<select 
  id="asociacion"
  name="asociacion.id"
  optionKey="id"
  class="many-to-one"
  value="${user?.asociacion?.id}"
  >
        <g:each in="${dataMap}" var="data">
        <optgroup label="${data.key}">
            <g:each in="${data.value}" var="value">
                <option value="${value?.id}">${value}</option>
            </g:each>
        </optgroup>
    </g:each>
</select>