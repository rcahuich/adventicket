<legend-title><g:message code="enrollment.form.title.label" /></legend-title>

      <div class="fieldcontain ${hasErrors(bean: user, field: 'username', 'error')} required">
              <label style="width: 150px;" for="username">
                      <g:message code="enrollment.form.username.label" />
                      <span class="required-indicator">*</span>
              </label>
              <g:textField name="username" required="" value="${user?.username}" />
      </div>

      <div class="fieldcontain ${hasErrors(bean: user, field: 'correo', 'error')} required">
              <label style="width: 150px;" for="correo">
                      <g:message code="enrollment.form.correo.label"/>
                      <span class="required-indicator">*</span>
              </label>
              <g:field type="email" name="correo" maxlength="128" required="" value="${user?.correo}" placeholder="${message(code:"enrollment.form.correo.placeHolder.label")}"/>
              <span class="help-inline"><strong><g:message code="enrollment.form.correo.note.title.label"/>:</strong> <g:message code="enrollment.form.correo.note.label"/></span>
      </div>
    
    <div class="fieldcontain ${hasErrors(bean: user, field: 'password', 'error')} required">
              <label style="width: 150px;" for="password">
                      <g:message code="enrollment.form.password.label"/>
                      <span class="required-indicator">*</span>
              </label>
              <g:passwordField name="password" required="" value="${user?.password}"/>
      </div>

    <div class="fieldcontain ${hasErrors(bean: user, field: 'confirmationPassword', 'error')} required">
              <label style="width: 150px;" for="confirmationPassword">
                      <g:message code="enrollment.form.confirmPassword.label"/>
                      <span class="required-indicator">*</span>
              </label>
              <g:passwordField name="confirmationPassword" required="" value="${params?.confirmationPassword}" placeholder="${message(code:"enrollment.form.confirmPassword.placeHolder.label")}"/>
      </div>
<br/>
<legend><g:message code="enrollment.form.title2.label" /></legend>

<div class="fieldcontain ${hasErrors(bean: user, field: 'nombre', 'error')} required">
              <label style="width: 150px;" for="nombre">
                      <g:message code="enrollment.form.nombre.label"/>
                      <span class="required-indicator">*</span>
              </label>
              <g:textField name="nombre" maxlength="64" required="" value="${user?.nombre}"/>
      </div>

      <div class="fieldcontain ${hasErrors(bean: user, field: 'apellidoPaterno', 'error')} required">
              <label style="width: 150px;" for="apellidoPaterno">
                      <g:message code="enrollment.form.apellidoPaterno.label" />
                      <span class="required-indicator">*</span>
              </label>
              <g:textField name="apellidoPaterno" maxlength="64" required="" value="${user?.apellidoPaterno}"/>
      </div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'apellidoMaterno', 'error')} ">
	<label style="width: 150px;" for="apellidoMaterno">
		<g:message code="enrollment.form.apellidoMaterno.label" />
		
	</label>
	<g:textField name="apellidoMaterno" maxlength="64" value="${user?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'sexo', 'error')} ">
	<label style="width: 150px;" for="sexo">
		<g:message code="enrollment.form.sexo.label" />
                <span class="required-indicator">*</span>
	</label>
        <g:select name="sexo" from="${[ 'Masculino', 'Femenino']}" value="${user?.sexo}"  valueMessagePrefix="enrollment.form.sexo" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'fechaDeNacimiento', 'error')} required">
	<label style="width: 150px;" for="fechaDeNacimiento">
		<g:message code="enrollment.form.fechaDeNacimiento.label" />
		<span class="required-indicator">*</span>
	</label>
        <%  
		def fecha = ''

		if(user?.fechaDeNacimiento != null){
			fecha = user?.fechaDeNacimiento
			fecha = fecha.format("dd/MM/yyyy")
		}
	%>
        <g:textField type="text" id="datepicker" required="" name="fechaDeNacimiento" readonly="true" value="${fecha}" placeholder="${message(code:"enrollment.form.fechaDeNacimiento.placeHolder.label")}" class="input-small"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'imagenes', 'error')} required">
        <label style="width: 150px;" for="imagen">
                <g:message code="enrollment.form.foto.label" />
        </label>
        <input type="file" name="imagen" id="imagen" />
        <span class="help-inline"><strong><g:message code="enrollment.form.imagen.note.title.label"/>:</strong> <g:message code="enrollment.form.imagen.note.label"/></span>
</div>

<br/>
<legend><g:message code="enrollment.form.title3.label" /></legend>
<div class="fieldcontain required">
        <label style="width: 150px;" for="imagen">
                <g:message code="enrollment.form.asociacion.label" />
        </label>
         
  <% 
    def map = [:]   
    com.adventicket.Union.list().each{it -> map.putAt(it.nombre, it.asociacion)}
  %>
  
  <test:optGroup name = "data" dataMap="${map}" />

<br/>
<br/>
<legend><g:message code="enrollment.form.title4.label" /></legend>
<recaptcha:recaptcha theme="white" lang="es"/>

<!--
<div class="fieldcontain ${hasErrors(bean: user, field: 'accountExpired', 'error')} ">
	<label style="width: 150px;" for="accountExpired">
		<g:message code="enrollment.form.accountExpired.label" />
		
	</label>
	<g:checkBox name="accountExpired" value="${user?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'accountLocked', 'error')} ">
	<label style="width: 150px;" for="accountLocked">
		<g:message code="enrollment.form.accountLocked.label" />
		
	</label>
	<g:checkBox name="accountLocked" value="${user?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'asistir', 'error')} ">
	<label style="width: 150px;" for="asistir">
		<g:message code="enrollment.form.asistir.label"/>
		
	</label>
	<g:checkBox name="asistir" value="${user?.asistir}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'enabled', 'error')} ">
	<label style="width: 150px;" for="enabled">
		<g:message code="enrollment.form.enabled.label"/>
		
	</label>
	<g:checkBox name="enabled" value="${user?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'fechaDeAlta', 'error')} required">
	<label style="width: 150px;" for="fechaDeAlta">
		<g:message code="enrollment.form.fechaDeAlta.label" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeAlta" precision="day"  value="${user?.fechaDeAlta}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'passwordExpired', 'error')} ">
	<label style="width: 150px;" for="passwordExpired">
		<g:message code="enrollment.form.passwordExpired.label" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${user?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'talVez', 'error')} ">
	<label style="width: 150px;" for="talVez">
		
          <g:message code="enrollment.form.talVez.label" />
		
	</label>
	<g:checkBox name="talVez" value="${user?.talVez}" />
</div>
-->




  


