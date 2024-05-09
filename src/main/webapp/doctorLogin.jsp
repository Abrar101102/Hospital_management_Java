<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Login</title>
<%@include file="component/css.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
<%@include file="component/Navbar.jsp" %>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<div align="center">
							<h1>Doctor Login</h1>
							<%
							String succMsg=(String)session.getAttribute("succMsg");
							String error=(String)session.getAttribute("errorMsg");
							if(error!=null){
							%>
							<p class="text-danger text-center"><%=error %></p>
							<%
							session.removeAttribute("errorMsg");
							}%>
							<%if(succMsg!=null){
							%>
							<p class="text-success text-center"><%=succMsg %></p>
							<%
							session.removeAttribute("succMsg");
							}%>
							<form action="doctorLogin" method="post">
								<div class="mb-3">
									<label class="form-label">Email</label> <input required name="email"
										type="email" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Password</label> <input required name="password"
										type="password" class="form-control">
								</div>
								<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>