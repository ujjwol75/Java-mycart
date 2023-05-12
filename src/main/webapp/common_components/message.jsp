<%
String message=(String) session.getAttribute("message");	
String type=(String)session.getAttribute("messagetype");
if(message!=null)
{%>
	<div class="alert alert-light  alert-dismissible fade show"  <%=type%> role="alert">
  <strong><%=message%>:</strong><i style="color: #ff99ff;">:Login and enjoy your shopping</i>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"  >
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	<%
	session.removeAttribute("message");
}
%>
