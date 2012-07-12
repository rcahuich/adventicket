<%@ page import="com.adventicket.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html>
    <head>
            <title><g:message code="enrollment.title.label" /></title>
            <meta name="layout" content="bootstrap">
            
            <r:require module="jquery-ui"/>
            <script type="text/javascript">
                $(document).ready(function(){
                  $('#datepicker').datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true, 
                    changeYear: true, 
                    yearRange: '-100:+0',
                    showOn: "button",
                    buttonImage: "images/Calendar.gif",
                    buttonImageOnly: true,
                    maxDate: 0
                  });
                })
            </script>
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
            
            <g:hasErrors bean="${user}">
                    <ul class="alert alert-error">
                      <a class="close" data-dismiss="alert" href="#">&times;</a>
                            <g:eachError bean="${user}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                    </ul>
            </g:hasErrors>
            <g:if test="${flash.error}">
              <div class="alert alert-error fade in" >
              <a class="close" data-dismiss="alert" href="#">&times;</a>
                    <ul>
                            <li>${flash.error}</li>
                    </ul>
              </div>
            </g:if>
            <g:form action="createEnrollment" class="form-horizontal" enctype="multipart/form-data">
                
                            <g:render template="formEnrollment"/>
                            
                            <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">
                                            <i class="icon-ok icon-white"></i>
                                            <g:message code="default.button.create.label" default="Create" />
                                    </button>
                            </div>
            </g:form>
          </div>
          
        </div>
      </div>

    </body>
</html>
