package com.adventicket

import com.megatome.grails.RecaptchaService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class EnrollmentController {

    def enrollConfirmationService
    def mailService
    RecaptchaService recaptchaService
    def grailsApplication    
    grails.gsp.PageRenderer groovyPageRenderer 
    static allowedMethods = [createEnrollment:"POST", send:"GET", correct:"GET"]
        
    def index() {}
    
    def createEnrollment() {
        //validar contrasenas
        if (params.password != params.confirmationPassword) {
            flash.error = message(code: 'enrollment.controller.differentPasswords.label')
            chain(action: "index", model: [user: new User(params)])
            return
        }
        //validar que fecha no sea nula
        if(!params.fechaDeNacimiento){
            flash.error = message(code: "enrollment.controller.fechaDeNacimiento.label")
            chain(action: "index", model: [user: new User(params)])
            return
        }
        //validar que fecha no sea vacía
        if(params.fechaDeNacimiento == ""){
            flash.error = message(code: "enrollment.controller.fechaDeNacimiento.label")
            chain(action: "index", model: [user: new User(params)])
            return
        }
        //parsear fecha
        params.fechaDeNacimiento = Date.parse("dd/MM/yyyy",params.fechaDeNacimiento)

        def user = new User(params)
        user.accountLocked = true
        user.fechaDeAlta = new Date()
        //Su foto
        def archivo = request.getFile('imagen')
        if (!archivo.empty) {
            byte[] f = archivo.bytes
            def imagen = new Imagen(
                nombre : archivo.originalFilename
                , tipoContenido : archivo.contentType
                , tamano : archivo.size
                , archivo : f
            )
            if (usuario.imagenes) {
                usuario.imagenes?.clear()
            } else {
                usuario.imagenes = []
            }
            usuario.imagenes << imagen
            usuario.save()
        }
        //validar captcha
        def recaptchaOK = true
        if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
             recaptchaOK = false
        }
        //validar campos
        user.validate()
        if(user.hasErrors()) {
                chain(action: "index", model: [user: user])
                return
        }
        //si captcha no coincide
        if(!recaptchaOK){
            flash.error = message(code: "enrollment.controller.captcha.label")
            chain(action: "index", model: [user: user])
            return
        }
        //limpiamos captcha
        recaptchaService.cleanUp(session)
        
        user.save(flush: true);                           
        chain(action: "presend", model: [user: user])
    }
    
    def presend(){
        if(!chainModel){
            chain action: 'index'
        }
    }
    
    def send(){
        if(!session.getAt('idUsuario')){
            chain action: 'index'
            return
        }
        def idUsuario =  session.getAt('idUsuario')
        session.removeAttribute('idUsuario')
        def user = User.get(idUsuario)
        enrollConfirmationService.sendConfirmation(user)
        [user: user]
    }
    
    def correct(){
        if(!session.getAt('idUsuario')){
            chain action: 'index'
            return
        }
        def idUsuario =  session.getAt('idUsuario')
        session.removeAttribute('idUsuario')
        def user = User.get(idUsuario)
        [user: user]
    }
    
    def correctUpdate(){
        //validar contrasenas
        if (params.password != params.confirmationPassword) {
            flash.error = message(code: 'enrollment.controller.differentPasswords.label')
            chain(action: "correct", model: [user: new User(params)])
            return
        }
        //validar que fecha no sea nula
        if(!params.fechaDeNacimiento){
            flash.error = message(code: "enrollment.controller.fechaDeNacimiento.label")
            chain(action: "correct", model: [user: new User(params)])
            return
        }
        //validar que fecha no sea vacía
        if(params.fechaDeNacimiento == ""){
            flash.error = message(code: "enrollment.controller.fechaDeNacimiento.label")
            chain(action: "correct", model: [user: new User(params)])
            return
        }
        //parsear fecha
        params.fechaDeNacimiento = Date.parse("dd/MM/yyyy",params.fechaDeNacimiento)
        
        //obtener instancia a partir de campos llenos
        def idUsuario =  session.getAt('idUsuario')
        def user = User.get(idUsuario)
        user.accountLocked = true
        user.fechaDeAlta = new Date()
        
        //Su foto
        def archivo = request.getFile('imagen')
        if (!archivo.empty) {
            byte[] f = archivo.bytes
            def imagen = new Imagen(
                nombre : archivo.originalFilename
                , tipoContenido : archivo.contentType
                , tamano : archivo.size
                , archivo : f
            )
            if (usuario.imagenes) {
                usuario.imagenes?.clear()
            } else {
                usuario.imagenes = []
            }
            usuario.imagenes << imagen
            usuario.save()
        }

        //validar captcha
        def recaptchaOK = true
        if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
             recaptchaOK = false
        }

        //validar campos
        user.validate()
        if(user.hasErrors()) {
                user.errors.each {
                        println it
                    }
                flash.error = message(code: "error de que se yo")
                chain(action: "correct", model: [user: user])
                return
        }

        //si captcha no coincide
        
        if(!recaptchaOK){
            flash.error = message(code: "enrollment.controller.captcha.label")
            chain(action: "correct", model: [user: user])
            return
        }

        //limpiamos captcha
        recaptchaService.cleanUp(session)
        
        user.save(flush: true);
        chain(action: "presend", model: [user: user])
    }
    
    def confirm(){
        def result = enrollConfirmationService.checkConfirmation(params.id)
        if(!result.valid){
            render view: 'error'
            return
        }
        
        def user = User.get(result.token)
        
        if(!user){
            render view: 'error'
            return
        }
        
        user.accountLocked = false
        user.save()
        def roles2 = [] as Set
        roles2 << Role.findByAuthority('ROLE_ASISTENTE')
        for(rol in roles2) {
            UserRole.create(user, rol, false)
        }
        
        def contenido = groovyPageRenderer.render(view:"/mail/welcome", model:[user:user])
        //TODO parametrizar mensajes
        mailService.sendMail {
            to user.correo
            from grailsApplication.config.grails.fromMailAddress
            subject message(code: "enrollment.welcome.subject.label")
            html contenido
        }
        
        redirect(controller:"index", action:"index")
        
    }
    
    def obtieneListaDeRoles = { usuario ->
        //log.debug "Obteniendo lista de roles"
        def roles = Role.list()

        def rolesFiltrados = [] as Set
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
            //log.debug "Roles para ADMIN"
            rolesFiltrados = roles
        } else if(SpringSecurityUtils.ifAnyGranted('ROLE_EVENTO')) {
            //log.debug "Roles para EVENTO"
            for(rol in roles) {
                if (!rol.authority.equals('ROLE_ADMIN') && !rol.authority.equals('ROLE_EVENTO')) {
                    rolesFiltrados << rol
                }
            }
        } else if(SpringSecurityUtils.ifAnyGranted('ROLE_ASISTENTE')) {
            //log.debug "Roles para ASISTENTE"
            for(rol in roles) {
                if (rol.authority.equals('ROLE_USER')) {
                    rolesFiltrados << rol
                }
            }
        }
        roles = rolesFiltrados
        roles.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        Set userRoleNames = []
        for (role in usuario?.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<Role, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }
        return roleMap
    }
    
    def asignaRoles = { params ->
        def roles = [] as Set
        if (params.ROLE_ADMIN) {
            roles << Role.findByAuthority('ROLE_ADMIN')
        } else if (params.ROLE_EVENTO) {
            roles << Role.findByAuthority('ROLE_EVENTO')
        } else if (params.ROLE_ASISTENTE) {
            roles << Role.findByAuthority('ROLE_ASISTENTE')
        } else {
            roles << Role.findByAuthority('ROLE_USER')
        }
        return roles
    }
    
}
