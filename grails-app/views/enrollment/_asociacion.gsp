
<g:if test="${asociacionList}">
    <g:select 
        id="asociacion" 
        name='asociacion' 
        value="${user?.asociacion?.id}"
        noSelection="${['null':'Select One...']}"
        from='${asociacionList.list()}'
        optionKey="id" 
        optionValue="asociacion"></g:select>
 
</g:if>