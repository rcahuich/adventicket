<%@ page import="com.adventicket.Index" %>
<!doctype html>
<html>
    <head>
            <title><g:message code="menu.contactanos" /></title>
            <meta name="layout" content="bootstrap">
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
            
            <g:javascript src="gmaps.js" />
            <script type="text/javascript">
              var map;
              $(document).ready(function(){
                map = new GMaps({
                  div: '#map',
                  lat: 25.1916969,
                  lng: -99.84660810000003
                });
                map.addMarker({
                  lat: 25.1916969,
                  lng: -99.84660810000003,
                  title: 'Marker with InfoWindow',
                  infoWindow: {
                    content: '<p>HTML Content</p>'
                  }
                });
              });
            </script>
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'examples.css')}" type="text/css">
    </head>
    <body>

          <div class="page-header">
              <h1>Contactanos <small>Adventicket</small></h1>
          </div>
          <div class="row-fluid">
            <div class="span3 columns">
              <img class="small-bs-icon" src="${resource(dir: 'images', file: 'contactanos.jpg')}" style="height: 400px; width: 220px;">
            </div>
            <div class="span9 columns">
                 <div id="map"></div>
                 
                        <br />
                  
                 
          	 <g:form name="solicitudInformacion" action="solicitud" class="form-horizontal" >
                        <legend>Solicitar Información</legend>
                         
                        
                        <g:if test="${flash.message}">
                              <div class="alert alert-info fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    <p>- ${flash.message}</p>
                              </div>
                          </g:if>

                          <g:if test="${flash.error}">
                              <div class="alert alert-error fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    <p>- ${flash.error}</p>
                              </div>
                          </g:if>

                          <g:hasErrors bean="${index}">
                                  <bootstrap:alert class="alert-error fade in">
                                      <ul>
                                          <g:eachError bean="${index}" var="error">
                                          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                          </g:eachError>
                                      </ul>
                                  </bootstrap:alert>
                          </g:hasErrors> 
                        
                        <div class="control-group ${hasErrors(bean: index, field: 'nombre', 'error')}">
                          <label class="control-label" for="input01">Nombre *</label>
                          <div class="controls">
                            <input type="text" name="nombre" class="input-xlarge" value="${index?.nombre}" required>
                          </div>
                        </div>
                        
                        <div class="control-group ${hasErrors(bean: index, field: 'mail', 'error')}">
                          <label class="control-label" for="input01">E-mail *</label>
                          <div class="controls">
                            <input type="email" name="mail" class="input-xlarge" value="${index?.mail}" required>
                          </div>
                        </div>
                        
                        <div class="control-group ${hasErrors(bean: index, field: 'comentario', 'error')}">
                          <label class="control-label" for="textarea">Comentario *</label>
                          <div class="controls">
                            <g:textArea class="input-xlarge" name="comentario" value="${index?.comentario}" rows="6" cols="40"/>
                            
                          </div>
                        </div>

                        <div class="form-actions">
                          <button type="reset" class="btn">Limpiar</button>
                          <button type="submit" class="btn btn-large btn-primary" >
                              <i class="icon-comment icon-white"></i>
                              <g:message code="solicitud.Enviar" /> &raquo;
                          </button>
                        </div>
                  </g:form>
              
            </div>
          </div>
         
    </body>

</html>