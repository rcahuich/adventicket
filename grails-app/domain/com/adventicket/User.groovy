package com.adventicket

class User {

	transient springSecurityService

	String username
	String password
        String confirmationPassword
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
        Asociacion asociacion
        
        String nombreCompleto
        static transients = ['nombreCompleto']
        static hasMany = [imagenes: Imagen]
        
	static constraints = {
		username (blank: false, unique: true, validator: { val, obj ->
                                                                obj.password == val ? 'userPassError' : true
                                                            })
		password (password:true, blank: false, nullable:false)
                /*confirmationPassword (password:true, blank:false, nullable:false, validator:{ value, reference ->
								    return value == reference.password
								    })*/
                nombre (blank: false, maxSize: 64)
                apellidoPaterno (blank: false, maxSize: 64)
                apellidoMaterno (blank: true, maxSize: 64)
                sexo (inList: ["Femenino", "Masculino"])
                correo (unique: true, blank: false, maxSize: 128, email:true)
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
        
        String getEdad(){
            def dob = fechaDeNacimiento.toCalendar()
            def today = Calendar.getInstance()	
            def age = today.get(Calendar.YEAR) - dob.get(Calendar.YEAR)
            if (today.get(Calendar.DAY_OF_YEAR) < dob.get(Calendar.DAY_OF_YEAR)){
                age--
            }
          return age  
        }
        
        String getNombreCompleto() {
            if(apellidoMaterno == ""){
                return "$nombre $apellidoPaterno "
            }else{
                return "$nombre $apellidoPaterno $apellidoMaterno"
            }
        }
        
        String toString() {
            return "$username | $nombre $apellidoPaterno"
        }
}
