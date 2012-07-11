package com.adventicket

class TestTagLib {
    static namespace = 'test'
 
    def optGroup = {attrs ->
        Map dataMap = attrs['dataMap']
        out << g.render(template: 'layouts/optSelect', model: [dataMap:dataMap])
    }

}
