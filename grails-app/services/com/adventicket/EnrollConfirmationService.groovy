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
}
