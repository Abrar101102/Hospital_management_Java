<%@page import="conn.entity.Appointment"%>
<%@page import="conn.db.DBconnect"%>
<%@page import="conn.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!-- doctorPrescription.jsp -->
<%--<html>
<head>
    <title>Doctor Prescription</title>
</head>
<body>
    <h1>Doctor's Prescription</h1>
    <form action="../PrescriptionServlet" method="post">
        <h2>Prescribe Medicines:</h2>
        Medicine 1: <input type="text" name="medicines"><br>
        Medicine 2: <input type="text" name="medicines"><br>
        Medicine 3: <input type="text" name="medicines"><br>
        
        <h2>Prescribe Tests:</h2>
        Test 1: <input type="text" name="tests"><br>
        Test 2: <input type="text" name="tests"><br>
        Test 3: <input type="text" name="tests"><br>
        
        <input type="submit" value="Prescribe">
    </form>
</body>
</html>--%>
	
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<%@include file="../component/css.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Details</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBconnect.getConn());

						Appointment ap = dao.getAppointmentById(id);
						%>
					
							<div class="col-md-6 offset-md-3">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=ap.getFullName()%>" class="form-control">
							</div>
							<div class="col-md-6 offset-md-3">
								<label>Age</label> <input type="text" value="<%=ap.getAge()%>"
									readonly class="form-control">
							</div>
							<div class="col-md-6 offset-md-3">
								<br> <label>Mob No</label> <input type="tel" readonly
									value="<%=ap.getPhNo()%>" class="form-control">
							</div>
							<div class="col-md-6 offset-md-3">
								<br> <label>Diseases</label> <input type="text" readonly
									value="<%=ap.getDiseases()%>" class="form-control">
							</div>

							<%-- <div class="col-md-12">
								<br> <label>Prescription</label>
								<textarea required name="comm" class="form-control" row="3"
									cols=""></textarea>
							</div>--%>
						

					</div>
				</div>
			</div><br>
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Medicines</p>

						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Medicine 1</label> <input type="text" required name="m1" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Medicine 2</label> <input type="text" required name="m2" class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Medicine 3</label> <input type="text" required name="m3" class="form-control">
							</div>
							<p class="text-center fs-4">Tests</p>
							<div class="col-md-6">
								<label>Test 1</label> <input type="text" required name="t1" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Test 2</label> <input type="text" required name="t2" class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Test 3</label> <input type="text"  required name="t3"class="form-control">
							</div>
								<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
								type="hidden" name="did" value="<%=ap.getDoctorId()%>">

							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>


						</form>

					</div>
				</div>
			</div>
			
							

					
		</div>
	</div>
</body>
</html>