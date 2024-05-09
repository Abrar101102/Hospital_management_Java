<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<script type="text/javascript">
    function validateForm() {
        var email = document.forms["appointmentForm"]["email"].value;
        var password = document.forms["appointmentForm"]["password"].value;

        // Email validation using a simple regex pattern
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var number=/^[0-9]/;
        var upper=/^[A-Z]/;
        var lower=/^[a-z]/;
        if (!emailRegex.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        // Password validation - you can add specific criteria as needed
        if (password.length < 6) {
            alert("Password should be at least 8 characters long.");
            return false;
        }
        if (password.value.match(number)) {
            alert("Password should be at least 8 characters long.");
            return false;
        }
        if (password.value.match(upper)) {
            alert("Password should be at least 8 characters long.");
            return false;
        }
        if (password.value.match(lower)) {
            alert("Password should be at least 8 characters long.");
            return false;
        }

        return true; // Proceed with form submission if validations pass
    }
</script>


</head>
<body>
	<%@include file="component/Navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Register</p>
							<%
							String sucMsg=(String)session.getAttribute("sucMsg");
							String error=(String)session.getAttribute("errorMsg");
							if(error!=null){
							%>
							<p class="text-danger text-center"><%=error %></p>
							<%
							session.removeAttribute("errorMsg");
							}%>
							<%if(sucMsg!=null){
							%>
							<p class="text-success text-center"><%=sucMsg %></p>
							<p class="text-center"><a href="userLogin.jsp">Click To Login</a></p>
							<%
							session.removeAttribute("sucMsg");
							}%>

						<form name="appointmentForm" action="user_register" method="post" onsubmit="return validateForm()">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input required
									name="fullname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>