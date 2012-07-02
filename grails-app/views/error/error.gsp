<!doctype html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
		<meta name="layout" content="bootstrap">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
        <body>
                
          <div class="well-error">
                <div class="errorWrapper">
                    <h1 class="pageErrorTitle"><g:message code="500.mainText.label"/></h1>
                    <span><g:message code="500.subText.label"/></span>
                    <br>
                    <a href="${createLink(uri: '/')}" class="btn btn-info btn-toolbar btn-large"><i class=" icon-home icon-white"></i> <g:message code="500.returnHome.label"/></a>
                </div>
          </div>
                <!-- 
		<g:renderException exception="${exception}" />
                -->
	</body>
</html>