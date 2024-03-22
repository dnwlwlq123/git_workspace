package com.person;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/person")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		//String gender = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender").equals("1")?"여자":"남자";
		String color = request.getParameter("color");
		String [] hobby = request.getParameterValues("hobby");
		String [] subject = request.getParameterValues("subject");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println("li{color:" + color + "}");
		out.println("</style>");
		out.println("<body>");
		out.println("<ul>");
		out.println("<li>이름 :  " + name + "</li>");
		out.println("<br>");
		out.println("<li>성별 :  " + gender +"</li>");
		out.println("<br>");
		out.println("<li>색깔 :  " + color + "</li>");
		out.println("<br>");
		
		
		out.println("<li>취미 :  ");
		if(hobby == null)
		out.println("취미가 없습니다.");
		else {
		for(int i=0; i<hobby.length; i++) {
			out.println( hobby[i]   + "   ");
			}//for
		
		out.println("</li>");
		}
		
		out.println("<br>");

		out.println("<li>과목 :  ");
		for(int i=0; i<subject.length; i++) {
		out.println(subject[i] +  "  ");
		}//for
		out.println("</li>");
		out.println("</ul>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
	}

}
