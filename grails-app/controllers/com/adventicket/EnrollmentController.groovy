package com.adventicket

import com.megatome.grails.RecaptchaService

class EnrollmentController {

    def enrollConfirmationService
    def mailService
    RecaptchaService recaptchaService
    static allowedMethods = [createEnrollment:"POST", send:"GET", correct:"GET"]
        
    def index() {}
    
    def createEnrollment() {
        log.debug ":::: ${params}"
        //validar contrasenas
        if (params.password != params.confirmPassword) {
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
        //Buscar Asociacion
        //Asociacion aso = Asociacion.findByNombre(params.asociacion)
        //log.debug "ID aso:: ${aso.id}"
        //obtener instancia a partir de campos llenos
        def user = new User(params)
        user.accountLocked = true
        user.fechaDeAlta = new Date()
        //user.asociacion = aso
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
            redirect action: 'index'
        }
    }
    
    def send(){
        if(!session.getAt('idUsuario')){
            redirect action: 'index'
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
            redirect action: 'index'
            return
        }
        def idUsuario =  session.getAt('idUsuario')
        session.removeAttribute('idUsuario')
        def user = User.get(idUsuario)
        chain(action: "index", model: [user: user])
        return
    }
    
}
