<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
        <meta name="layout" content="login"/>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'structure.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">
</head>

<body>
  <g:if test='${flash.message}'>
              <div class="error">${flash.message}</div>
            </g:if>
  <form action='${postUrl}' method='POST' autocomplete='off' class='box login'>
          
          <fieldset class="boxBody">
            <img src="${resource(dir: 'images', file: 'AT-2.png')}" alt="" style="width: 240px; height: 50px; margin-left: 27px;">
            <hr>
            <label><g:message code="menu.username"/>:</label>
            <input type='text' class='text_' name='j_username' id='username' placeholder='${message(code: "menu.username.placeHolder")}' required autofocus=""/>
            <label><a href="#" class="rLink" tabindex="5"><g:message code="menu.olvidoContrasena" /></a><g:message code="menu.contrasena"/>:</label>
            <input type='password' class='text_' name='j_password' id='password' placeholder='${message(code: "menu.contrasena.placeHolder")}' required/>
          </fieldset>
          <footer>
            <label>
              <input type='checkbox' tabindex="3" class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>>
              <g:message code="menu.recordar" />
            </label>
            <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' class="btnLogin"/>
          </footer>
  </form>
  <footer id="main">
    <a href="${createLink(uri: '/')}"><g:message code="menu.inicio" /></a> | <a href="${createLink(controller: 'index', action: 'nosotros')}"><g:message code="menu.nosotros" /></a> | <a href="${createLink(controller: 'index', action: 'contactanos')}"><g:message code="menu.contactanos" /></a> | <a href="${createLink(controller: 'enrollment')}"><g:message code="menu.registrate" /></a>
  </footer>
</body>
</html>
