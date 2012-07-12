<%@ page import="com.adventicket.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html>
    <head>
            <title><g:message code="enrollment.preSend.title.label" /></title>
            <meta name="layout" content="bootstrap">
    </head>
    <body>
      
      <div class="page-header">
          <h1><g:message code="enrollment.preSend.title.label" /></h1>
      </div>
      <div class="row-fluid">
        <div class="span12">
          <p><g:message code="enrollment.preSend.instruction1.label" /></p>
          <br/>
           
          <div class="hero-form span8">
            <dl class="dl-horizontal">
                      <dt><g:message code="enrollment.preSend.username.label" /></dt><dd>${user?.username}</dd>
                      <dt><g:message code="enrollment.preSend.fechaDeNacimiento.label" /></dt><dd><g:formatDate date="${user?.fechaDeNacimiento}"/></dd>
                      <dt><g:message code="enrollment.preSend.correo.label" /></dt><dd>${user?.correo}</dd>
            </dl>
            <br/>
            <div class="form-actions">
               <g:set var="idUsuario" value="${user.id }" scope="session" /> 
                    <a href="${createLink(action:'send')}" class="btn btn-primary btn-large"><g:message code="enrollment.preSend.sendConfirmation.button"/></a>&nbsp;<a href="${createLink(action:'correct')}" class="btn btn-info btn-large"><g:message code="enrollment.preSend.correctData.button"/></a>
            </div>
          </div>
          
        </div>
      </div>

    </body>
</html>
