<%
String message = (String) session.getAttribute("message");
if (message != null) {
%>
<!-- printing message to user saying that Registraion Successful -->
<div class="alert alert-success alert-dismissible fade show"
	role="alert" style="border-radius: 1rem;">
	<strong>Hi </strong><%= message %>
</div>
<% }
session.removeAttribute("message");
%>