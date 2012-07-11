package com.adventicket

class Asociacion {

    String nombre
    Union union

    static belongsTo = [union: Union]
    
    static constraints = {
    }
    
    static mapping = {
        table "asociaciones"
    }
    
    String toString() {
            return "$union | $nombre" 
        }
}
