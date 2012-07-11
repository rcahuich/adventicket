package com.adventicket

import org.springframework.beans.SimpleTypeConverter
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler

class MyAppTagLib {

    def selectWithOptGroup = {attrs ->
        def messageSource = grailsAttributes.getApplicationContext().getBean("messageSource")
        def locale = RCU.getLocale(request)
        def writer = out
        def from = attrs.remove('from')
        def keys = attrs.remove('keys')
        def optionKey = attrs.remove('optionKey')
        def optionValue = attrs.remove('optionValue')
        def groupBy = attrs.remove('groupBy')
        def value = attrs.remove('value')
        def valueMessagePrefix = attrs.remove('valueMessagePrefix')
        def noSelection = attrs.remove('noSelection')
        def disabled = attrs.remove('disabled')
        Map optGroupSet = new TreeMap();
        attrs.id = attrs.id ? attrs.id : attrs.name

        if (value instanceof Collection && attrs.multiple == null) {
            attrs.multiple = 'multiple'
        }

        if (noSelection != null) {
            noSelection = noSelection.entrySet().iterator().next()
        }

        if (disabled && Boolean.valueOf(disabled)) {
            attrs.disabled = 'disabled'
        }

        // figure out the groups 
        from.eachWithIndex {el, i ->

        	def groupKey = el.properties[groupBy]
            
            if (optGroupSet[(groupKey)]) {

            	optGroupSet[(groupKey)] << [el, i]
            }

            else {

            	optGroupSet[(groupKey)] = [[el, i]]
            }
        }

        writer << "<select name=\"${attrs.remove('name')}\" "
        // process remaining attributes
        outputAttributes(attrs)
        writer << '>'
        writer.println()

        if (noSelection) {
            renderNoSelectionOption(noSelection.key, noSelection.value, value)
            writer.println()
        }

        // create options from list
        if (from) {
            //iterate through group set
            for(optGroup in optGroupSet) {
                writer << " <optgroup label=\"${optGroup.key.encodeAsHTML()}\">"
                writer.println()

                optGroup.value.each {el, i ->

                        def keyValue = null
                        writer << '<option '

                        if (keys) {
                            keyValue = keys[i]
                            writeValueAndCheckIfSelected(keyValue, value, writer)
                        }

                        else if (optionKey) {
                            if (optionKey instanceof Closure) {
                                keyValue = optionKey(el)
                            }

                            else if (el != null && optionKey == 'id' && grailsApplication.getArtefact(DomainClassArtefactHandler.TYPE, el.getClass().name)) {
                                keyValue = el.ident()
                            }

                            else {
                                keyValue = el[optionKey]
                            }

                            writeValueAndCheckIfSelected(keyValue, value, writer)
                        }

                        else {
                            keyValue = el
                            writeValueAndCheckIfSelected(keyValue, value, writer)
                        }

                        writer << '>'

                        if (optionValue) {
                            if (optionValue instanceof Closure) {
                                writer << optionValue(el).toString().encodeAsHTML()
                            }

                            else {
                                writer << el[optionValue].toString().encodeAsHTML()
                            }

                        }

                        else if (valueMessagePrefix) {
                            def message = messageSource.getMessage("${valueMessagePrefix}.${keyValue}", null, null, locale)

                            if (message != null) {
                                writer << message.encodeAsHTML()
                            }

                            else if (keyValue) {
                                writer << keyValue.encodeAsHTML()
                            }

                            else {
                                def s = el.toString()
                                if (s) writer << s.encodeAsHTML()
                            }
                        }

                        else {
                            def s = el.toString()
                            if (s) writer << s.encodeAsHTML()
                        }

                        writer << '</option>'
                        writer.println()
                    }
                }
            }
        // close tag
        writer << '</select>'
    }

    void outputAttributes(attrs) {
        attrs.remove('tagName') // Just in case one is left
        attrs.each {k, v ->
            out << k << "=\"" << v.encodeAsHTML() << "\" "
        }
    }

    def typeConverter = new SimpleTypeConverter()
    private writeValueAndCheckIfSelected(keyValue, value, writer) {
        boolean selected = false
        def keyClass = keyValue?.getClass()
        if (keyClass.isInstance(value)) {
            selected = (keyValue == value)
        }
        else if (value instanceof Collection) {
            selected = value.contains(keyValue)
        }
        else if (keyClass && value) {
            try {
                value = typeConverter.convertIfNecessary(value, keyClass)
                selected = (keyValue == value)
            } catch (Exception) {
                // ignore
            }
        }
        writer << "value=\"${keyValue}\" "
        if (selected) {
            writer << 'selected="selected" '
        }
    }
}

