package com.adventicket

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
        
        String nombre
        String apellidoPaterno
        String apellidoMaterno
        Date fechaDeNacimiento
        Date fechaDeAlta
        String sexo
        String correo
        boolean asistir = false
        boolean talVez = false
        
        String nombreCompleto
        static transients = ['nombreCompleto']

	static constraints = {
		username blank: false, unique: true, validator: { val, obj ->
                                                                obj.password == val ? 'userPassError' : true
                                                            }
		password blank: false
                nombre   blank: false, maxSize: 64
                apellidoPaterno blank: false, maxSize: 64
                apellidoMaterno blank: true, maxSize: 64
                sexo inList: ["Femenino", "Masculino"]
                correo unique: true, blank: false, maxSize: 128, email:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
