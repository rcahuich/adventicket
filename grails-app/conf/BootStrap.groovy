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
        
        log.debug "Creando Uniones"
        def unionMN = Union.findByNombre('Union Mexicana del Norte') ?: new Union(nombre: 'Union Mexicana del Norte').save(flush:true)
        def unionMS = Union.findByNombre('Union Mexicana del Sur') ?: new Union(nombre: 'Union Mexicana del Sur').save(flush:true)
        def unionMC = Union.findByNombre('Union Mexicana Central') ?: new Union(nombre: 'Union Mexicana Central').save(flush:true)
        def unionMI = Union.findByNombre('Union Interoceanica') ?: new Union(nombre: 'Union Interoceanica').save(flush:true)
        
        log.debug "Creando Asociaciones"
        def asociacionNE = Union.findByNombre('Asociacion del Noreste') ?: new Union(nombre: 'Asociacion del Noreste', union: unionMN).save(flush:true)
        def asociacionNO = Union.findByNombre('Asociacion del Noroeste') ?: new Union(nombre: 'Asociacion del Noroeste', union: unionMN).save(flush:true)
        def asociacionMa = Union.findByNombre('Asociacion del Mayab') ?: new Union(nombre: 'Asociacion del Mayab', union: unionMS).save(flush:true)
        def asociacionSO = Union.findByNombre('Asociacion del Soconusco') ?: new Union(nombre: 'Asociacion del Soconusco', union: unionMS).save(flush:true)
        def asociacionME = Union.findByNombre('Asociacion Metropolitana') ?: new Union(nombre: 'Asociacion Metropolitana', union: unionMC).save(flush:true)
        
        
        log.debug "Aplicacion Inicializada"
        
    }
    def destroy = {
    }
}
