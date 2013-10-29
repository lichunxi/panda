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
    css = ""
    if span and int(span) > 0:
        css = "span" + span
    if offset and int(offset) > 0:
        css = css + " offset" + offset
        
    ## value from options is in form of "key1:value1, key2:value2, ...."
    options = attribs.get("options")
    optionXml = options.split(",")
    
    optionMap = {}
    for line in optionXml:
    	option = line.split(":")
        optionMap[option[0].strip()] = option[1].strip()
        
    if name:
        ## value from do must be a dict
        optionDo = getattr(do,name)
        ## merge them together
        optionMap.update(optionDo)
        
    selected = attribs.get("selected")
    disabled = attribs.get("disabled")
    multiple = attribs.get("multiple")
%>

<div id="${name}_div" class="${css}">
  <div class="control-group ${labelDirectionCss}">
  % if label:
    <label class="control-label" for="${name}_id">${label}</label>
  % endif
      <div class="controls">
        <select id="${name}_id" name="${name}"\
        %if disabled and disabled.lower() == "true":
 disabled="true"\
        %endif
        %if multiple and multiple.lower() == "true":
 multiple="true"\
        %endif
>
        % for key in optionMap.keys():
          <option value="${key}"\
% if selected==key:
 selected="selected"\
% endif
>${optionMap[key]}</option>
        % endfor
        </select>
      </div>
  </div>
</div>