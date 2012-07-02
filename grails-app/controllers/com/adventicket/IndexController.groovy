package com.adventicket

import java.util.regex.Matcher;
import java.util.regex.Pattern;

class IndexController {

    def index() { 
        log.debug "Inicio"
    }
    
    def nosotros() { 
        log.debug "Nosotros"
    }
    
    def contactanos() { 
        log.debug "Contactanos"
    }
    
    def solicitud = {
        
        String nombre = params.nombre
        String email = params.email
        String comentario = params.comentario
        
        if (nombre.isEmpty() || nombre == null){
            render "El campo -Nombre- no puede ser vacio"
            return
        }else
        if(email.isEmpty() || email == null){
            render "El campo -Email- no puede ser vacio"
            return
        }else
        if(comentario.isEmpty() || comentario == null){
            render "El campo -Comentario- no puede ser vacio"
            return
        }else
        if(!comentario.isEmpty() && validaEmail(email) == false){
                render "Introduzca un correo electronico valido"
                return
        }
        else{
            try {
                sendMail {
                    to      "hospitalgdl@gmail.com"
                    subject "Solicitud de Informacion"
                    body     """
                                   Nombre: ${params.nombre},
                                   Email: ${params.email},
                                   Comentario: ${params.comentario},

                                   Solicitud de Informacion.
                                   Thanks"""
            }
            def mensaje = message(code: 'solicitud.Envio')
            render "$mensaje"
            } catch(Exception e) {
                log.error "Problema al enviar el mail = $e.message", e
                flash.error = message(code: 'solicitud.noEnvio')
            }
        }
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
