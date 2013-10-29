<%
    label = attribs.get("label")
    if label is None:
    	label = ""
    name = attribs.get("name")
    value = attribs.get("value")
    if name:
    	value = getattr(do,name)
    checked = attribs.get("checked")
    disabled = attribs.get("disabled")
%>
<label class="checkbox">
  <input id="${name}_id" name="${name}" type="checkbox" value="${value}"\
  %if checked and checked.lower() == "true":
  checked="true"\
  %endif
  %if disabled and disabled.lower() == "true":
  disabled="true"\
  %endif
>${label}
</label>