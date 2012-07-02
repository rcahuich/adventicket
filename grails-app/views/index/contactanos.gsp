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
                 
          	 <g:form name="solicitudInformacion" action="solicitud" class="form-horizontal" >
                        <legend>Solicitar Información</legend>
                          <div id="mensajeEnviado" style="font-size: 13px; text-align: center; text-decoration: underline;">
                          </div>
                        <br />
                        <div class="control-group">
                          <label class="control-label" for="input01">Nombre *</label>
                          <div class="controls">
                            <input type="text" name="nombre" class="input-xlarge" required>
                          </div>
                        </div>
                        <div class="control-group">
                          <label class="control-label" for="input01">E-mail *</label>
                          <div class="controls">
                            <input type="email" name="email" class="input-xlarge" required>
                          </div>
                        </div>
                        <div class="control-group">
                          <label class="control-label" for="textarea">Comentario *</label>
                          <div class="controls">
                            <textarea class="input-xlarge" name="comentario" rows="3" required></textarea>
                          </div>
                        </div>

                        <div class="form-actions">
                          <button type="reset" class="btn">Limpiar</button>
                          <g:submitToRemote
                            type="submit"
                            class="btn btn-primary"
                            update="mensajeEnviado" 
                            value="Enviar"
                            url="[controller:'index', action:'solicitud']"
                            onLoading="showSpinner(true)"  
                            onComplete="showSpinner(false)">
                            <img id="spinner" style="display: none" src="${resource(dir: 'images', file: 'spinner.gif')}"/>
                          </g:submitToRemote>
                        </div>
                  </g:form>
              
            </div>
          </div>
         
    </body>
<g:javascript>
    function showSpinner(visible) {
          $('#spinner').toggle();
    }
</g:javascript>

</html>