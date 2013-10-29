<%
    name = attribs.get('name')
    value = attribs.get("value")
    type = attribs.get("type")
    span = attribs.get("span")
    offset = attribs.get("offset")
    css = ""
    if span and int(span) > 0:
        css = "span" + span
    if offset and int(offset) > 0:
        css = css + " offset" + offset
        
    disabled = attribs.get('disabled')
%>
  <button\
  % if name:
 id="${name}_id" name="${name}"\
  % endif
 class="btn ${css}" type="${type}"\
  % if disabled and disabled.lower()=="true":
 disabled="disabled"\
  % endif
>${value}</button>