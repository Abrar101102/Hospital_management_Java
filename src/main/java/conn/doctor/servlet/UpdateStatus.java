package conn.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import conn.dao.AppointmentDao;
import conn.db.DBconnect;


@SuppressWarnings("serial")
@WebServlet("/updateStatus")
	public class UpdateStatus extends HttpServlet {

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			try {
				int id = Integer.parseInt(req.getParameter("id"));
				int did = Integer.parseInt(req.getParameter("did"));
				String comm = "Visited";
				String m1 = req.getParameter("m1");
				String m2 = req.getParameter("m2");
				String m3 = req.getParameter("m3");
				String t1 = req.getParameter("t1");
				String t2 = req.getParameter("t2");
				String t3 = req.getParameter("t3");

				AppointmentDao dao = new AppointmentDao(DBconnect.getConn());

				HttpSession session = req.getSession();

				if (dao.updateCommentStatus(id, did, comm,m1,m2,m3,t1,t2,t3)) {
					session.setAttribute("succMsg", "Prescribed");
					resp.sendRedirect("doctor/patient.jsp");
				} else {
					session.setAttribute("errorMsg", "Something wrong on server");
					resp.sendRedirect("doctor/patient.jsp");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
