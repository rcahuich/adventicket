package com.adventicket

class Index {

    String nombre
    String mail
    String comentario
    
    static constraints = {
        mail blank: false, email: true
        comentario blank: false, maxSize: 600
    }
}
