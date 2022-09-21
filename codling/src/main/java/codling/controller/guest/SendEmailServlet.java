package codling.controller.guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codling.controller.EmailService;

@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String to = request.getParameter("email");
		String code = "";
		
		EmailService email = new EmailService();
		
		try {
			code = email.sendEmail(to);
		} catch(Exception e) {
			System.out.println("sendEmail Error : " + e.getMessage());
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(code);
	}
}