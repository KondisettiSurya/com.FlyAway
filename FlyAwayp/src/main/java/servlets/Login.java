package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {
	public static boolean isLoggedIn = false;
	public static String email = "suryakondisetti123@gmail.com";
	public static String password = "surya";

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter out = resp.getWriter();

		String emai = req.getParameter("emailEntered");
		String pass = req.getParameter("passwordEntered");

		if (emai.equals(Login.email) && pass.equals(Login.password)) {
			isLoggedIn = true;          
			resp.sendRedirect("admin-dashboard.jsp");
		} else {
			isLoggedIn = false;
			out.println("Login Failed : Incorrect email or Password");
		}
		out.close();
	}
}
