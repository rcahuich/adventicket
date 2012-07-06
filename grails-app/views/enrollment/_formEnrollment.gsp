<legend><g:message code="enrollment.form.title.label" /></legend>

      <div class="fieldcontain ${hasErrors(bean: user, field: 'username', 'error')} required">
              <label style="width: 150px;" for="username">
                      <g:message code="enrollment.form.username.label" />
                      <span class="required-indicator">*</span>
              </label>
              <g:textField name="username" required="" value="${user?.username}"/>
      </div>

      <div class="fieldcontain ${hasErrors(bean: user, field: 'correo', 'error')} required">
              <label style="width: 150px;" for="correo">
                      <g:message code="user.correo.label" default="Correo" />
                      <span class="required-indicator">*</span>
              </label>
              <g:field type="email" name="correo" maxlength="128" required="" value="${user?.correo}"/>
      </div>
    
    <div class="fieldcontain ${hasErrors(bean: user, field: 'password', 'error')} required">
              <label style="width: 150px;" for="password">
                      <g:message code="user.password.label" default="Password" />
              </label>
              <g:textField name="password" required="" value="${user?.password}"/>
      </div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'nombre', 'error')} required">
              <label style="width: 150px;" for="nombre">
                      <g:message code="user.nombre.label" default="Nombre" />
                      <span class="required-indicator">*</span>
              </label>
              <g:textField name="nombre" maxlength="64" required="" value="${user?.nombre}"/>
      </div>

      <div class="fieldcontain ${hasErrors(bean: user, field: 'apellidoPaterno', 'error')} required">
              <label style="width: 150px;" for="apellidoPaterno">
                      <g:message code="user.apellidoPaterno.label" default="Apellido Paterno" />
                      <span class="required-indicator">*</span>
              </label>
              <g:textField name="apellidoPaterno" maxlength="64" required="" value="${user?.apellidoPaterno}"/>
      </div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'apellidoMaterno', 'error')} ">
	<label style="width: 150px;" for="apellidoMaterno">
		<g:message code="user.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" maxlength="64" value="${user?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'sexo', 'error')} ">
	<label style="width: 150px;" for="sexo">
		<g:message code="user.sexo.label" default="Sexo" />
		
	</label>
	<g:select name="sexo" from="${user.constraints.sexo.inList}" value="${user?.sexo}" valueMessagePrefix="user.sexo" noSelection="['': '']"/>
</div>



<div class="fieldcontain ${hasErrors(bean: user, field: 'accountExpired', 'error')} ">
	<label style="width: 150px;" for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${user?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'accountLocked', 'error')} ">
	<label style="width: 150px;" for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${user?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'asistir', 'error')} ">
	<label style="width: 150px;" for="asistir">
		<g:message code="user.asistir.label" default="Asistir" />
		
	</label>
	<g:checkBox name="asistir" value="${user?.asistir}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'enabled', 'error')} ">
	<label style="width: 150px;" for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${user?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'fechaDeAlta', 'error')} required">
	<label style="width: 150px;" for="fechaDeAlta">
		<g:message code="user.fechaDeAlta.label" default="Fecha De Alta" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeAlta" precision="day"  value="${user?.fechaDeAlta}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'fechaDeNacimiento', 'error')} required">
	<label style="width: 150px;" style="width: 150px;" for="fechaDeNacimiento">
		<g:message code="user.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeNacimiento" precision="day"  value="${user?.fechaDeNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'passwordExpired', 'error')} ">
	<label style="width: 150px;" for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${user?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: user, field: 'talVez', 'error')} ">
	<label style="width: 150px;" for="talVez">
		<g:message code="user.talVez.label" default="Tal Vez" />
		
	</label>
	<g:checkBox name="talVez" value="${user?.talVez}" />
</div>

