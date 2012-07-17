package com.adventicket

import java.util.regex.Matcher;
import java.util.regex.Pattern;

class IndexController {

    static scaffold = Index
    def mailService
    def grailsApplication    
    grails.gsp.PageRenderer groovyPageRenderer  
    
    def index() { 
        log.debug "Inicio"
    }
    
    def index2() { 
        log.debug "Acerca de..."
    }
    
    def nosotros() { 
        log.debug "Nosotros"
    }
    
    def contactanos() { 
        log.debug "Contactanos"
       
    }
    
    def solicitud() {
        
        def nombre = params.nombre
        def email = params.mail
        def comentario = params.comentario
        
        
        if (nombre.isEmpty() || nombre == null){
            flash.error = "El campo -Nombre- no puede ser vacio"
            chain(action: "contactanos", model: [index: new Index(params)])
            return
        }else
        if(email.isEmpty() || email == null){
            flash.error = "El campo -Email- no puede ser vacio"
            chain(action: "contactanos", model: [index: new Index(params)])
            return
        }else
        if(comentario.isEmpty() || comentario == null){
            flash.error = "El campo -Comentario- no puede ser vacio"
            chain(action: "contactanos", model: [index: new Index(params)])
            return
        }else
        if(!comentario.isEmpty() && validaEmail(email) == false){
            flash.error = "Introduzca un correo electronico valido"
            chain(action: "contactanos", model: [index: new Index(params)])
            return
        }
        
        
        def index = new Index(params)
        index.validate()
        def contenido = groovyPageRenderer.render(view:"/mail/contact", model:[user:index])        
        try {
            //TODO parametrizar mensaje en subject
            mailService.sendMail {
                to "hospitalgdl@gmail.com" 
                from grailsApplication.config.grails.fromMailAddress
                subject "Solicitud de Información"
                html contenido
            }
            flash.message = message(code: 'solicitud.Envio')
        } catch (Exception e) {
             log.error "Problema al enviar el mail = $e.message", e
            flash.error = message(code: 'solicitud.noEnvio')
        }
        
        chain(action: "contactanos")
        
    }
    
    boolean validaEmail(def mail){
        Pattern pat = null
        Matcher mat = null
        pat = Pattern.compile("[a-zA-Z0-9][a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)*@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+")
        mat = pat.matcher(mail)
        if (mat.find()) {
            return true
        }else{
            return false
        }        
    }
    
}
