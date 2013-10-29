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
    
    disabled = attribs.get("disabled")
%>
<div id="${name}_div" class="${css}">
	<div class="control-group ${labelDirectionCss}">
	    <label class="control-label" for="${name}_id">${label}</label>
	    <div class="controls">
	    % if prepend and append:
	    <div class="input-prepend input-append">
            <span class="add-on">${prepend}</span><input id="${name}_id" name="${name}" type="text" value="${getattr(do,name)}"\
            %if disabled and disabled.lower() == "true":
 disabled="true"\
            %endif
/><span class="add-on">${append}</span>
        </div>
        % elif prepend:
        <div class="input-prepend">
            <span class="add-on">${prepend}</span><input id="${name}_id" name="${name}" type="text" value="${getattr(do,name)}"\
            %if disabled and disabled.lower() == "true":
 disabled="true"\
            %endif
/>
        </div>
        % elif append:
	    <div class="input-append">
            <input id="${name}_id" name="${name}" type="text" value="${getattr(do,name)}"\
            %if disabled and disabled.lower() == "true":
 disabled="true"\
            %endif
/><span class="add-on">${append}</span>
        </div>
        % else:
	    	<input id="${name}_id" name="${name}" type="text" value="${getattr(do,name)}"\
            %if disabled and disabled.lower() == "true":
 disabled="true"\
            %endif
/>
	    % endif
	    </div>
	</div>
</div>