package com.adventicket

class EnrollmentController {

    def index() {
    def map = [:]   
    com.adventicket.Asociacion.list().each{it -> map.putAt(it.union, it.nombre)}
    println("Asociaciones: ${map}")
    [map:map]
    }
    
    
    def unionByName() {
        log.debug "Buscando... ${params.unionId}"
        [book: Asociacion.findByUnion(params.unionId)]
    }
    
    
}
