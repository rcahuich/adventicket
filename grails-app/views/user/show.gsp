
<%@ page import="com.adventicket.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${userInstance?.username}">
						<dt><g:message code="user.username.label" default="Username" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="username"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.password}">
						<dt><g:message code="user.password.label" default="Password" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="password"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.nombre}">
						<dt><g:message code="user.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.apellidoPaterno}">
						<dt><g:message code="user.apellidoPaterno.label" default="Apellido Paterno" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="apellidoPaterno"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.apellidoMaterno}">
						<dt><g:message code="user.apellidoMaterno.label" default="Apellido Materno" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="apellidoMaterno"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.sexo}">
						<dt><g:message code="user.sexo.label" default="Sexo" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="sexo"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.correo}">
						<dt><g:message code="user.correo.label" default="Correo" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="correo"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.accountExpired}">
						<dt><g:message code="user.accountExpired.label" default="Account Expired" /></dt>
						
							<dd><g:formatBoolean boolean="${userInstance?.accountExpired}" /></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.accountLocked}">
						<dt><g:message code="user.accountLocked.label" default="Account Locked" /></dt>
						
							<dd><g:formatBoolean boolean="${userInstance?.accountLocked}" /></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.asistir}">
						<dt><g:message code="user.asistir.label" default="Asistir" /></dt>
						
							<dd><g:formatBoolean boolean="${userInstance?.asistir}" /></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.asociacion}">
						<dt><g:message code="user.asociacion.label" default="Asociacion" /></dt>
						
							<dd><g:link controller="asociacion" action="show" id="${userInstance?.asociacion?.id}">${userInstance?.asociacion?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.confirmationPassword}">
						<dt><g:message code="user.confirmationPassword.label" default="Confirmation Password" /></dt>
						
							<dd><g:fieldValue bean="${userInstance}" field="confirmationPassword"/></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.enabled}">
						<dt><g:message code="user.enabled.label" default="Enabled" /></dt>
						
							<dd><g:formatBoolean boolean="${userInstance?.enabled}" /></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.fechaDeAlta}">
						<dt><g:message code="user.fechaDeAlta.label" default="Fecha De Alta" /></dt>
						
							<dd><g:formatDate date="${userInstance?.fechaDeAlta}" /></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.fechaDeNacimiento}">
						<dt><g:message code="user.fechaDeNacimiento.label" default="Fecha De Nacimiento" /></dt>
						
							<dd><g:formatDate date="${userInstance?.fechaDeNacimiento}" /></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.imagenes}">
						<dt><g:message code="user.imagenes.label" default="Imagenes" /></dt>
						
							<g:each in="${userInstance.imagenes}" var="i">
							<dd><g:link controller="imagen" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${userInstance?.passwordExpired}">
						<dt><g:message code="user.passwordExpired.label" default="Password Expired" /></dt>
						
							<dd><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></dd>
						
					</g:if>
				
					<g:if test="${userInstance?.talVez}">
						<dt><g:message code="user.talVez.label" default="Tal Vez" /></dt>
						
							<dd><g:formatBoolean boolean="${userInstance?.talVez}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${userInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
