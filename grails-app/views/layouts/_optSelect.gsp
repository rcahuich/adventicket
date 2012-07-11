<select name="mainList" placeholder="Seleccione su Asociación">
        <g:each in="${dataMap}" var="data">
        <optgroup label="${data.key}">
            <g:each in="${data.value}" var="value">
                <option value="${value}">${value}</option>
            </g:each>
        </optgroup>
    </g:each>
</select>
