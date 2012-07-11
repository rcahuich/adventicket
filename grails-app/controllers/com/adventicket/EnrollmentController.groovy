package com.adventicket

class EnrollmentController {

    def index() {

    }
    
    
    def unionByName() {
        log.debug "Buscando... ${params.unionId}"
        [book: Asociacion.findByUnion(params.unionId)]
    }
    
    
}
