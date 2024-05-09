<%@page import="conn.db.DBconnect"%>
<%@page import="conn.dao.DoctorDao"%>
<%@page import="conn.entity.*" %>
<%--
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
--%>
<%@page isELIgnored="false"%>
<%@page import="conn.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	}
</style>
<script type="text/javascript">
    function validateForm() {
        var nameRegex = /^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$/;
        var emailRegex = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$/;
        var phoneRegex = /^[0-9]{10}$/;
        let currentDate=new Date();
        let appointmentDate= new Date(document.forms["appointmentForm"]["appoint_date"].value);

        var fullName = document.forms["appointmentForm"]["fullname"].value;
        var email = document.forms["appointmentForm"]["email"].value;
        var phone = document.forms["appointmentForm"]["phno"].value;

        if (!nameRegex.test(fullName)) {
            alert("Invalid name format.");
            return false;
        }

        if (!emailRegex.test(email)) {
            alert("Invalid email format.");
            return false;
        }

        if (!phoneRegex.test(phone)) {
            alert("Invalid phone number format (should be 10 digits).");
            return false;
        }
        if (appointmentDate < currentDate) {
            alert("Please Select a valid date either after today's  or today's date);
            return false;
        }

        return true; // Proceed with form submission
    }
</script>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 ">
				<img alt="" src="img/doc6.jpg" height=400px>
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
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
						
						<form class="row g-3" name="appointmentForm" action="appAppointment" method="post" onsubmit="return validateForm()">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="tel" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doct">
									<option value="">--select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBconnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>




								</select>
							</div>
							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>
							<%
							var u = (User) session.getAttribute("userObj");
							
							if (u == null) {
							%>
							<a href="userLogin.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							<%} %>
							<%if (u!=null)
						    {%>
							 <button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							 <%} %>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>
							
							