package com.adventicket

class Asociacion {

    String nombre

    static belongsTo = [union: Union]
    
    static constraints = {
    }
    
    static mapping = {
        table "asociaciones"
    }
    
    String toString() {
            return "$nombre"
        }
}
