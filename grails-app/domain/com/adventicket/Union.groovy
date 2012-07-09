package com.adventicket

class Union {
    
    String nombre
    Set asociacion
    
    static hasMany = [asociacion: Asociacion]

    static constraints = {
    }
    
    static mapping = {
        table "uniones"
    }
    
    String toString() {
            return "$nombre"
        }
}
