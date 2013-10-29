<%
title = attribs.get("title")
name = attribs.get("name")
%>
<div id="${name}_id" class="modal hide fade">
<form>
  <div class="modal-header">
    <a class="close" data-dismiss="modal" >&times;</a>
    <h3>${title}</h3>
  </div>
  <div class="modal-body">
  ${body}
  </div>
  <div class="modal-footer">
      <button type="reset" class="btn">Reset</button>
      <a href="#" class="btn" data-dismiss="modal" >&nbsp;&nbsp;OK&nbsp;&nbsp;</a>
  </div>
</form>
</div>
<a data-toggle="modal" href="#${name}_id" class="btn">Launch demo modal</a>