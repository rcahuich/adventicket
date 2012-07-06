package com.adventicket

class EnrollmentController {

    def index() { 
        [user: new User(params)]
    }
    
    
    
}
