<%
    span = attribs.get("span")
    offset = attribs.get("offset")
    css = ""
    if span and int(span) > 0:
        css = "span" + span
    if offset and int(offset) > 0:
        css = css + " offset" + offset
%>

<div class="form-inline ${css}">
${body}
</div>