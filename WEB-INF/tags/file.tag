
<%
    label = attribs.get("label")
    if label is None:
    	label = ""
    labelDirectionCss = ""
    if label:
    	if labelDirection=="horizontal":
    		labelDirectionCss = "form-horizontal"
    	
    name = attribs.get("name")
    span = attribs.get("span")
    offset = attribs.get("offset")
    prepend = attribs.get("prepend")
    append = attribs.get("append")
    css = ""
    if span and int(span) > 0:
        css = "span" + span
    if offset and int(offset) > 0:
        css = css + " offset" + offset
%>
<div id="${name}_div" class="${css}">
	<div class="control-group ${labelDirectionCss}">
	    <label class="control-label" for="${name}_id">${label}</label>
	    <div class="controls">
	    	<input id="${name}_id" name="${name}" type="file" class="input-file" defaultValue="${getattr(do,name)}"\
        %if disabled and disabled.lower() == "true":
 disabled="true"\
        %endif
/>
	    </div>
	</div>
</div>