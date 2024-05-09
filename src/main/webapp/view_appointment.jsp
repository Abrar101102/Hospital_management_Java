<%@page import="conn.dao.*"%>
<%@page import="conn.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="conn.db.DBconnect"%>
<%@page import="conn.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page isELIgnored="false"%>
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

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-6">
		<div class="row">
			<div class="col-md-11">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
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
								var user = (User)session.getAttribute("userObj");
								AppointmentDao dao = new AppointmentDao(DBconnect.getConn());
								DoctorDao dao2 = new DoctorDao(DBconnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
									%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
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

			<%-- <div class="col-md-3 p-3">
				<img alt="" src="img/doc1.jpg" height=400px>
			</div>--%>
		</div>
	</div>


</body>
</html>
<!-- userPrescriptions.jsp -->
<%--<html>
<head>
    <title>User Prescriptions and Tests</title>
</head>
<body>
    <h1>Prescriptions and Tests</h1>
    <h2>Prescribed Medicines:</h2>
    <ul>
        <% 
        List<String> medicines = (List<String>) session.getAttribute("medicines");
        if (medicines != null) {
            for (String medicine : medicines) { %>
                <li><%= medicine %></li>
            <% }
        } else { %>
            <li>No medicines prescribed yet.</li>
        <% } %>
    </ul>
    <h2>Prescribed Tests:</h2>
    <ul>
        <% 
        List<String> tests = (List<String>) session.getAttribute("tests");
        if (tests != null) {
            for (String test : tests) { %>
                <li><%= test %></li>
            <% }
        } else { %>
            <li>No tests prescribed yet.</li>
        <% } %>
    </ul>
</body>
</html>--%>
