package com.adventicket

import com.grailsrocks.emailconfirmation.*

class EnrollConfirmationService {

    def mailService   
    def grailsApplication    
    grails.gsp.PageRenderer groovyPageRenderer    
    boolean transactional = true
    def maxAge = 1000*60*60*24*2L // 2 days
    def maxAgeConfirmation = 1000*60*60*24*1L // 1 days
    
    def makeURL(token) {
        def serverURL = grailsApplication.config.grails.serverURL 
        "${serverURL}/registro/confirmar/${token.encodeAsURL()}"
    }
    
    def sendConfirmation(User user) {
        
	def conf = new PendingEmailConfirmation(emailAddress:user.correo, userToken:user.id.toString())
        conf.makeToken()    
        if (!conf.save()) {
            throw new IllegalArgumentException( "Unable to save pending confirmation: ${conf.errors}")
        }
        def uri = makeURL(conf.confirmationToken)
        if (log.infoEnabled) {
            log.info( "Sending email confirmation mail to ${user.correo}")
        }        
        def contenido = groovyPageRenderer.render(view:"/mail/enrollment", model:[user:user,uri:uri])        
        try {
            //TODO parametrizar mensaje en subject
            mailService.sendMail {
                to user.correo 
                from grailsApplication.config.grails.fromMailAddress
                subject "Tu nueva cuenta en ADVENTicket"
                html contenido
            }
        } catch (Throwable t) {
            throw t
        }
        return conf
    }
    
    def checkConfirmation(String confirmationToken) {
        if (log.traceEnabled) log.trace("checkConfirmation looking for confirmation token: $confirmationToken")
        def conf = PendingEmailConfirmation.findByConfirmationToken(confirmationToken)
        if (conf && (conf.confirmationToken == confirmationToken)) {
            if (log.debugEnabled) {
                log.debug( "Notifying application of valid email confirmation for user token ${conf.userToken}, email ${conf.emailAddress}")
            }       
            conf.delete()
            return [valid: true, email: conf.emailAddress, token:conf.userToken]
        } else {
            if (log.traceEnabled) log.trace("checkConfirmation did not find confirmation token: $confirmationToken")
            return [valid:false]
        }
    }
    
    void cullStaleConfirmations() {
        
        def subjectMail = "Por favor confirma tu cuenta de correo"

        if (log.infoEnabled) {
            log.info( "Checking for stale email confirmations...")
        }
        
        def threshold = System.currentTimeMillis() - maxAge
        def threshold2 = System.currentTimeMillis() - maxAgeConfirmation
        def staleConfirmations = PendingEmailConfirmation.findAllByTimestampLessThan(new Date(threshold))
        def staleConfirmationsPre = PendingEmailConfirmation.findAllByTimestampLessThan(new Date(threshold2))
        
        def c = 0
        staleConfirmations.each() {
            if (log.debugEnabled) {
                log.debug( "Notifying application of stale email confirmation for user token ${it.userToken}")
            }
            it.delete()
            c++
        }
        
        if (log.infoEnabled) {
            log.info( "Done check for stale email confirmations, found $c")
        }
        
        def d = 0
        staleConfirmationsPre.each() {
            def email = it.emailAddress
            // Tell application
            if (log.debugEnabled) {
                log.debug( "Notifying application of stale email pre confirmation for user token ${it.userToken}")
            }
            def contenido = groovyPageRenderer.render(view:"/mail/enrollmentRemember", model:[mail:email,uri:it.userToken])
            mailService.sendMail {
                to email
                from grailsApplication.config.grails.fromMailAddresss
                subject subjectMail
                html contenido
            }
            d++
        }
        
        if (log.infoEnabled) {
            log.info( "Done check for pre stale email confirmations, found $d")
        }
    }
}
