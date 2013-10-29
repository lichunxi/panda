<%
    fluid = attribs.get("fluid")
    css = "row"
    if fluid and fluid.lower()=="true":
        css = css + "-fluid"
        
    span = attribs.get("span")
    if span and int(span) > 0:
        css = css + " span" + span
%>
<div class="${css}">
  ${body}
</div>