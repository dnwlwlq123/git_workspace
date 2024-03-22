package com.param;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/param")
public class paramServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		String s = "성인";
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		if(age>=20) {
			out.println("나의 이름은" + name + "이고, 나이는" + age + "살 입니다. 그래서" +"<font size=5 color=red>"+s+"</font>" +"입니다." + "<br>");
		}
		else{
			s="청소년";
			out.println("나의 이름은" + name + "이고, 나이는" + age + "살 입니다. 그래서" +"<font size=5 color=red>"+s+"</font>"+ "입니다.");
		}
		out.println("<br>");
		out.println("<br>");
		//out.println("<input type='button' value='뒤로' onclick=javascript:location.href='http://localhost:8080/testServlet2/com.param/param.html'");
		out.println("<input type='button' value='뒤로' onclick='history.go(-1)'");
		out.println("</body>");
		out.println("</html>");
	}



}
