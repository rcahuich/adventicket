<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Acerca de...</title>
                
                <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
	</head>
	<body>
            <section>
            <div>
                        
                        <header class="hero-unit">
                            <center>
                            <h1>ADVENTicket</h1>
                            <p>Sistema especializado en Eventos de la IASD</p>
                            <p class="download-info">
                              <a href="https://github.com/rcahuich/event" class="btn btn-primary btn-large">Ver projecto en GitHub</a>
                            </p>
                            </center>
                          <div class="bs-links">
                            <ul class="quick-links">
                              <li>
                                <iframe class="github-btn" src="http://markdotto.github.com/github-buttons/github-btn.html?user=rcahuich&repo=event&type=watch&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="112px" height="20px"></iframe>
                              </li>
                              <li>
                                <iframe class="github-btn" src="http://markdotto.github.com/github-buttons/github-btn.html?user=rcahuich&repo=event&type=fork&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="98px" height="20px"></iframe>
                              </li>
                              <li class="follow-btn">
                              <a href="https://twitter.com/rbnseven" class="twitter-follow-button" data-show-count="true" data-lang="es">Seguir a @rbnseven</a>
                              <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                              </li>
                              <li class="tweet-btn">
                                <a href="https://twitter.com/intent/tweet?screen_name=rbnseven" class="twitter-mention-button" data-lang="es" data-related="rbnseven">Tweet to @rbnseven</a>
                                <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                              </li>
                            </ul>
                          </div>
                        </header>
              
                        <hr class="soften">
                        
                        <div class="marketing">
                          <h1>Grails & Groovy - Twitter Bootstrap.</h1>
                          <p class="marketing-byline">Información del Sitio</p>
                          <div class="row-fluid">
                          <div class="span4">
                                    <h2>Controladores</h2>
                            <ul>
                                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                      <li><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                                    </g:each>
                            </ul>
                          </div>
                          <div class="span4">
                                    <h2>Plugins Instalados</h2>
                            <ul>
                                    <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                                            <li>${plugin.name} - ${plugin.version}</li>
                                    </g:each>
                            </ul>
                          </div>
                          <div class="span4">
                                    <h2>Estatus de la Aplicación</h2>
                            <ul>
                                    <li>App version: <g:meta name="app.version"/></li>
                                    <li>Grails version: <g:meta name="app.grails.version"/></li>
                                    <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                                    <li>JVM version: ${System.getProperty('java.version')}</li>
                                    <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                                    <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                                    <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                                    <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                            </ul>
                          </div>
                        </div>

                        </div><!-- /.marketing -->
                        
                        
              </div>
           </section>
	</body>
</html>
