<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="com.adventicket.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html>
    <head>
            <title><g:message code="enrollment.title.label" /></title>
            <meta name="layout" content="bootstrap">

    </head>
    <body>
      
      <div class="page-header">
          <h1><g:message code="enrollment.title.label" /></h1>
      </div>
      <div class="row-fluid">
        <div class="span12">
          <p><g:message code="enrollment.instruction1.label" /></p>
          <p><g:message code="enrollment.instruction2.label" /></p>
          <br/>
          <div class="hero-form span8">
            <g:form action="createEnrollment" class="">
                    <fieldset class="form">
                            <g:render template="formEnrollment"/>
                    </fieldset>	

                    <button class="button_orange" type="submit" style="margin-left:75px;">
                            <span><g:message code="enrollment.enrollmentSendConfirmation.label" default="Enviar confirmación"/></span>
                    </button>

            </g:form>
          
          
          
          
          
          
          
          </div>
          
        </div>
      </div>

    </body>
</html>
