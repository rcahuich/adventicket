<%@ page import="com.adventicket.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="user.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="64" required="" value="${userInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="user.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" maxlength="64" required="" value="${userInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="user.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" maxlength="64" value="${userInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sexo', 'error')} ">
	<label for="sexo">
		<g:message code="user.sexo.label" default="Sexo" />
		
	</label>
	<g:select name="sexo" from="${userInstance.constraints.sexo.inList}" value="${userInstance?.sexo}" valueMessagePrefix="user.sexo" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="user.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" maxlength="128" required="" value="${userInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'asistir', 'error')} ">
	<label for="asistir">
		<g:message code="user.asistir.label" default="Asistir" />
		
	</label>
	<g:checkBox name="asistir" value="${userInstance?.asistir}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'asociacion', 'error')} required">
	<label for="asociacion">
		<g:message code="user.asociacion.label" default="Asociacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asociacion" name="asociacion.id" from="${com.adventicket.Asociacion.list()}" optionKey="id" required="" value="${userInstance?.asociacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'confirmationPassword', 'error')} ">
	<label for="confirmationPassword">
		<g:message code="user.confirmationPassword.label" default="Confirmation Password" />
		
	</label>
	<g:textField name="confirmationPassword" value="${userInstance?.confirmationPassword}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fechaDeAlta', 'error')} required">
	<label for="fechaDeAlta">
		<g:message code="user.fechaDeAlta.label" default="Fecha De Alta" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeAlta" precision="day"  value="${userInstance?.fechaDeAlta}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fechaDeNacimiento', 'error')} required">
	<label for="fechaDeNacimiento">
		<g:message code="user.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeNacimiento" precision="day"  value="${userInstance?.fechaDeNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'imagenes', 'error')} ">
	<label for="imagenes">
		<g:message code="user.imagenes.label" default="Imagenes" />
		
	</label>
	<g:select name="imagenes" from="${com.adventicket.Imagen.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.imagenes*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'talVez', 'error')} ">
	<label for="talVez">
		<g:message code="user.talVez.label" default="Tal Vez" />
		
	</label>
	<g:checkBox name="talVez" value="${userInstance?.talVez}" />
</div>

