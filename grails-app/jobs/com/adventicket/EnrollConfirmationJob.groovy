
package com.adventicket

class EnrollConfirmationJob {
    def cronExpression = "0 50 2 * * ? *"  // Once every twenty four hours at 3am
    def enrollConfirmationService
    
    def execute() {
        if (log.infoEnabled) {
            log.info( "Culling stale email confirmations")
        }
        try {
            enrollConfirmationService.cullStaleConfirmations()
        } catch (Throwable t) {
            log.error( "Unabled to execute stale email confirmation job", t)
        }
    }
}

