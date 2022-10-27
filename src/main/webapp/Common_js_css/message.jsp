
<%
String message = (String) session.getAttribute("message");
if (message == "Registration succesful") {
%>
<!-- printing message to user saying that Registraion Successful -->
<div class="alert alert-success alert-dismissible fade show"
	role="alert" style="border-radius: 1rem;">
	<strong>Hi User </strong>You Registration is Successful
</div>

<%
} else if(message=="Registration failed username or email already exists") {
%>
<!-- printing message to user saying that Registraion is Unsuccessful -->
<div class="alert alert-warning alert-dismissible fade show"
	role="alert" style="border-radius: 1rem;">
	<strong>Hi User </strong>You Registration is Unsuccessful. Username or
	Mail already exists
</div>
<%
}
else if(message=="Invalid User") {
%>
<!-- printing message to user saying that Registraion is Unsuccessful -->
<div class="alert alert-warning alert-dismissible fade show"
	role="alert" style="border-radius: 1rem;">
	<strong>Hi </strong>Invalid username or password.Please register if you are not registered.
</div>
<%
}
else if(message=="Valid User") {
%>
<!-- printing message to user saying that Registraion is Unsuccessful -->
<div class="alert alert-success alert-dismissible fade show"
	role="alert" style="border-radius: 1rem;">
	<strong>Hi </strong>Login Successful
</div>
<%
}
session.removeAttribute("message");
%>