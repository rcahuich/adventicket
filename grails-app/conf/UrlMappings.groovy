class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
                
                "/"(
                    controller: "index", 
                    action: "index"
                )
                
                "/nosotros"(
                    controller: "index", 
                    action: "nosotros"
                )
                
                "/contactanos"(
                    controller: "index", 
                    action: "contactanos"
                )
                
                "/registro"(
                    controller: "enrollment", 
                    action: "index"
                )
                
                
                
                "500"(view:'/error/error')
                "404"(view:'/error/notFound')
	}
}
