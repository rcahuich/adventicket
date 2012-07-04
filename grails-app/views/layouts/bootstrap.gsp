    <%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="initial-scale = 1.0">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <r:require modules="scaffolding"/>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link href="${resource(dir: 'css', file: 'prettify.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <g:javascript src="prettify.js" />
    <g:javascript src="application.js" />
    <g:javascript src="jquery.js" />
    <g:javascript src="bootstrap-alert.js" />
    <g:javascript src="bootstrap-transition.js" />
    <g:javascript src="bootstrap-modal.js" />
    <g:javascript src="bootstrap-dropdown.js" />
    <g:javascript src="bootstrap-scrollspy.js" />
    <g:javascript src="bootstrap-tab.js" />
    <g:javascript src="bootstrap-tooltip.js" />
    <g:javascript src="bootstrap-popover.js" />
    <g:javascript src="bootstrap-button.js" />
    <g:javascript src="bootstrap-collapse.js" />
    <g:javascript src="bootstrap-carousel.js" />
    <g:javascript src="bootstrap-typeahead.js" />
    <g:javascript src="login.js" />
    
    <g:layoutHead/>
    <r:layoutResources/>
  </head>

  <body>

    <nav class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          
          <a href="${createLink(uri: '/')}" ><img src="${resource(dir: 'images', file: 'logoPNG.png')}" alt="" title="" border="0" style="float: left; width: 140px; height: 37px;"/> </a>
                                        
          <div class="nav-collapse">
            <ul class="nav">
              <li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}"><i class="icon-home icon-white"></i><g:message code="menu.inicio" /></a></li>
              <li<%= request.forwardURI == "${createLink(uri: '/index/nosotros')}" ? ' class="active"' : '' %>><a href="${createLink(action: 'nosotros')}"><g:message code="menu.nosotros" /></a></li>
              <li<%= request.forwardURI == "${createLink(uri: '/index/contactanos')}" ? ' class="active"' : '' %>><a href="${createLink(action: 'contactanos')}"><g:message code="menu.contactanos" /></a></li>
            </ul>
          </div>
    
          <ul class="nav pull-right">
                <li class="divider-vertical"></li>
                <sec:ifNotLoggedIn>
                  <li><a href="${createLink(uri: '/')}"><g:message code="menu.registrate" /></a></li>
                 <!-- Login Starts Here -->
                  <div id="loginContainer">
                      <a href="#" id="loginButton"><span><g:message code="menu.iniciaSesion" /></span><em></em></a>
                      <div style="clear:both"></div>
                      <div id="loginBox">                
                          <form id="loginForm" action='/adventicket/j_spring_security_check' method='POST' autocomplete='off'>
                              <fieldset id="body">
                                  <fieldset>
                                      <label for="email"><g:message code="menu.username" /></label>
                                      <input autofocus="autofocus" type='text' class='text_' name='j_username' id='username'/>
                                  </fieldset>
                                  <fieldset>
                                      <label for="password"><g:message code="menu.contrasena" /></label>
                                      <input type='password' class='text_' name='j_password' id='password'/>
                                  </fieldset>
                                  <input type='submit' id="login" value='${message(code: "springSecurity.login.button")}'/>
                                  
                                  <label for="checkbox"><input type='checkbox' name='${rememberMeParameter}' id='checkbox' <g:if test='${hasCookie}'>checked='checked'</g:if>/><g:message code="menu.recordar" /></label>
                              </fieldset>
                              <span><a href="#"><g:message code="menu.olvidoContrasena" /></a></span>
                          </form>
                      </div>
                  </div>
                  <!-- Login Ends Here -->
                </sec:ifNotLoggedIn>
                
                <sec:ifLoggedIn>
                      <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li id="fat-menu" class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="menu.admin.inicio" /> <b class="caret"></b></a>
                          <ul class="dropdown-menu">
                                <li><i class="icon-th"></i> <g:message code="menu.admin.usuarios" /></li>
                                <li><a href="${createLink(controller:'user', action:'lista')}"><i class="icon-th-list"></i> <g:message code="menu.admin.usuarios.lista" /></a></li>
                                <li><a href="${createLink(controller:'user', action:'nuevo')}"><i class="icon-plus"></i> <g:message code="menu.admin.usuarios.nuevo" /></a></li>
                                <li class="divider"></li>
                                <li><i class="icon-th"></i> <g:message code="menu.admin.eventos" /></li>
                                <li><a href="${createLink(controller:'evento', action:'lista')}"><i class="icon-th-list"></i> <g:message code="menu.admin.eventos.lista" /></a></li>
                                <li><a href="${createLink(controller:'evento', action:'nuevo')}"><i class="icon-plus"></i> <g:message code="menu.admin.eventos.nuevo" /></a></li>
                                <li><a href="${createLink(controller:'evento', action:'aceptarEventos')}"><i class="icon-check"></i> <g:message code="menu.admin.eventos.porAceptar" /></a></li>
                                <li class="divider"></li>
                                <li><a href="${createLink(controller:'tipoEvento', action:'lista')}"><i class="icon-th-list"></i> <g:message code="menu.admin.tipoEventos.lista" /></a></li>
                                <li><a href="${createLink(controller:'tipoSubEvento', action:'lista')}"><i class="icon-th-list"></i> <g:message code="menu.admin.tipoSubEventos.lista" /></a></li>
                                <li class="divider"></li>
                                <li><a href="${createLink(controller:'index', action:'index2')}"><i class="icon-info-sign"></i> <g:message code="menu.admin.acerca" /></a></li>
                          </ul>
                        </li>
                      </sec:ifAllGranted>
                      <li id="fat-menu" class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="menu.bienvenido" /> <sec:username /> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li><a href="${createLink(controller:'user', action:'ver')}"><i class="icon-user"></i> <g:message code="menu.miCuenta" /></a></li>
                          <li class="divider"></li>
                          <li><a href="${createLink(controller:'logout')}"><i class="icon-off"></i> <g:message code="menu.cerrarSesion" /></a></li>
                        </ul>
                      </li>

                </sec:ifLoggedIn>
          </ul>
        </div>
      </div>
    </nav>
    
    
    <div class="container-fluid">

      <g:layoutBody/>

      <hr>

      <footer>
        <p>&copy; Company 2011</p>
      </footer>
    
    </div>
    
      <!-- <r:layoutResources/>   -->
      <r:layoutResources/> 
  </body>
</html>