import com.adventicket.*

class BootStrap {

    def init = { servletContext ->
        log.debug "Iniciando aplicacion"
        
        log.debug "Validando roles"
        def rolAdmin = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def rolEvento = Role.findByAuthority('ROLE_EVENTO') ?: new Role(authority: 'ROLE_EVENTO').save(failOnError: true)
        def rolAsistente = Role.findByAuthority('ROLE_ASISTENTE') ?: new Role(authority: 'ROLE_ASISTENTE').save(failOnError: true)
        def rolUser = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
              
        log.debug "Validando ROL_ADMIN"
        def admin = UserRole.findByRole(rolAdmin)
        if (!admin) {
            admin = new User(
                username:'admin',
                password:'admin00',
                nombre: 'Admin',
                apellidoPaterno: 'Cahuich',
                apellidoMaterno: '',
                fechaDeNacimiento: '07/10/2011',
                fechaDeAlta: new Date(),
                sexo: 'Masculino',
                correo: 'rcc@um.edu.mx'
            )
            admin.save(flush:true)
            UserRole.create(admin, rolAdmin, true)
        }
        
        log.debug "Validando ROL_EVENTO"
        def evento = UserRole.findByRole(rolEvento)
        if (!evento) {
            evento = new User(
                username:'evento',
                password:'evento00',
                nombre: 'Evento',
                apellidoPaterno: 'Cahuich',
                apellidoMaterno: '',
                fechaDeNacimiento: '07/10/2011',
                fechaDeAlta: new Date(),
                sexo: 'Masculino',
                correo: 'seven.rbn@gmail.com'
            )
            evento.save(flush:true)
            UserRole.create(evento, rolEvento, true)
        }
    }
    def destroy = {
    }
}
