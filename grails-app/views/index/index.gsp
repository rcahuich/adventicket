<!doctype html>
<html xmlns:fb="http://ogp.me/ns/fb#">
	<head>
		<meta name="layout" content="bootstrap"/>
		<title><g:message code="menu.inicio" /></title>
                <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
                
	</head>

	<body>
		<div class="row-fluid">
		
			<section id="main" class="span8">
                          
                                <div id="myCarousel" class="carousel slide">
                                  <div class="carousel-inner">
                                    <div class="item active">
                                      <img src="${resource(dir: 'images/carousel', file: 'slider1.jpg')}" alt="" style="width: 640px; height: 350px;">
                                      <div class="carousel-caption">
                                        <h4>Bienvenido</h4>
                                        <p>Un lugar donde administrar los eventos de hoy en dia, con muchos servicios para ti</p>
                                      </div>
                                    </div>
                                    <div class="item">
                                      <img src="${resource(dir: 'images/carousel', file: 'slider2.jpg')}" alt="" style="width: 640px; height: 350px;">
                                      <div class="carousel-caption">
                                        <h4>Crea tu evento facilmente</h4>
                                        <p>Con solo dos click ya podras crear tus eventos y poder compartirlos con todos tus amigos</p>
                                      </div>
                                    </div>
                                    <div class="item">
                                      <img src="${resource(dir: 'images/carousel', file: 'slider3.jpg')}" alt="" style="width: 640px; height: 350px;">
                                      <div class="carousel-caption">
                                        <h4>Ultimas noticias</h4>
                                        <p>Encontraras las ultimas noticias acerca de lo mas necesario que pasa en los eventos</p>
                                      </div>
                                    </div>
                                  </div>
                                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                                  <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                                </div>

			</section>
                        
                        <aside id="application-status" class="span4">
				<div class="well sidebar-nav">
					<h5>Application Status</h5>
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
					<h5>Installed Plugins</h5>
                                        <ul>
                                          <li>sdkjflsdfjlsdjfhlasdjfhlasdjfhasldjfh</li>
                                          <li>sdkjflsdfjlsdjfhlasdjfhlasdjfhasldjfh</li>
                                          <li>sdkjflsdfjlsdjfhlasdjfhlasdjfhasldjfh</li>
						
					</ul>
				</div>
                          
                                <a href="${createLink(controller:'evento', action:'creaTuEvento')}" class="btn btn-primary">Crea tu Evento! &raquo;</a>
			</aside>
                
                </div>
                
                <ul class="quick-links">
                  <li class="follow-btn">
                    <a href="https://twitter.com/adventicket" class="twitter-follow-button" data-show-count="true" data-lang="es">Seguir a @adventicket</a>
                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                  </li>
                  <li class="follow-btn">
                    <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://adventicket.com" data-text="Visita ADENTicket" data-via="rbnseven" data-lang="es" data-hashtags="evento">Twittear</a>
                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                  </li>
                  <li class="follow-btn">
                    <fb:like href="http://www.facebook.com/ADVENTicket" send="false" width="270" show_faces="false" font="trebuchet ms"></fb:like>
                  </li>
                  <li>
                    
                  </li>
                </ul>
                
                <hr class="soften">
    
		<div class="row-fluid">

                                <div class="span4">
                                        <h3>Administra a tus Asistentes</h3>
                                        <p>Toda la informacion de tus asistentes a tu evento de una manera rápida y fácil</p>
                                        <h3>Facil de encontrar</h3>
                                        <p>Encuentra los eventos que te gustaría asistir</p>
                                        <p>This demo app includes a couple of controllers to show off its features.</p>
                                </div>

                                <div class="span4">
                                       <p>
                                        <script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
                                        <script>
                                        new TWTR.Widget({
                                          version: 2,
                                          type: 'profile',
                                          rpp: 4,
                                          interval: 30000,
                                          width: 250,
                                          height: 210,
                                          theme: {
                                            shell: {
                                              background: '#5864e8',
                                              color: '#ffffff'
                                            },
                                            tweets: {
                                              background: '#f5f2f5',
                                              color: '#0a0a0a',
                                              links: '#0e1e70'
                                            }
                                          },
                                          features: {
                                            scrollbar: true,
                                            loop: false,
                                            live: true,
                                            behavior: 'all'
                                          }
                                        }).render().setUser('ADVENTicket').start();
                                        </script>
                                      </p>
                                </div>

                                <div class="span4">
                                  <p>
                                        <div class="fb-like-box" data-href="http://www.facebook.com/ADVENTicket" data-width="292" data-height="300" data-show-faces="true" data-stream="false" data-header="true"></div>
                                        <div id="fb-root"></div>
                                        <script>(function(d, s, id) {
                                          var js, fjs = d.getElementsByTagName(s)[0];
                                          if (d.getElementById(id)) return;
                                          js = d.createElement(s); js.id = id;
                                          js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&appId=117307608376803";
                                          fjs.parentNode.insertBefore(js, fjs);
                                        }(document, 'script', 'facebook-jssdk'));</script>
                                  </p>
                                </div>
                                

                </div>
	</body>
</html>
