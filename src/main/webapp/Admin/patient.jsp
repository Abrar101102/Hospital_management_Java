<%@page import="conn.entity.Doctor"%>
<%@page import="conn.dao.DoctorDao"%>
<%@page import="conn.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="conn.db.DBconnect"%>
<%@page import="conn.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12 " >
		<div class="card paint-card" >
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
							<th scope="col">Medicine1</th>
							<th scope="col">Medicine2</th>
							<th scope="col">Medicine3</th>
							<th scope="col">Test1</th>
							<th scope="col">Test2</th>
							<th scope="col">Test3</th>
						</tr>
					</thead>
					<tbody>
						<%
						AppointmentDao dao = new AppointmentDao(DBconnect.getConn());
						DoctorDao dao2 = new DoctorDao(DBconnect.getConn());
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress()%></td>
							<td><%
									if ("Not Visted".equals(ap.getStatus())) {
									%> <a href="#" class="btn btn-sm btn-warning">Not Visited</a>
<%
 } else {
 %> 
 <a href="#" class="btn btn-sm btn-success"><%=ap.getStatus()%></a></td>
<td> <%=ap.getMedicine1()%> </td>
  <td> <%=ap.getMedicine2()%></td>
   <td><%=ap.getMedicine3()%></td>
   <td><%=ap.getTest1()%></td>
   <td><%=ap.getTest2()%></td>
  <td> <%=ap.getTest3()%></td>
 <%}
 %>
						</tr>
						<%
						}
						%>


					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>