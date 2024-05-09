package conn.admin.servlet;
import conn.entity.*;
import java.io.IOException;

import conn.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {

				String email = req.getParameter("email");
				String password = req.getParameter("password");

				HttpSession session = req.getSession();

				if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
					session.setAttribute("adminObj", new User());
					resp.sendRedirect("Admin/index.jsp");
				} else {
					session.setAttribute("errorMsg", "invalid email & password");
					resp.sendRedirect("AdminLogin.jsp");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

}
