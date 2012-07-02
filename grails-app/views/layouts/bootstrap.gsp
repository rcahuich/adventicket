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
                  <li id="fat-menu" class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown 3 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                    </ul>
                  </li>
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
    
  </body>
</html>