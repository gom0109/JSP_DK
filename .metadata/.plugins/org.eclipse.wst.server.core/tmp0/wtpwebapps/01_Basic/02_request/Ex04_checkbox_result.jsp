<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04_checkbox_result.jsp <br><br>

<% 
	request.setCharacterEncoding("UTF-8");
	String name =request.getParameter("name");
	String [] fruit =request.getParameterValues("fruit");
	out.print("선택한 과일은 <br>");
	for(int i=0;i<fruit.length;i++){
		out.print(fruit[i]+"<br>");
	}

%>
<br>
이름 : <%=name%><br><br><br>

<%
	Enumeration<String> x=request.getParameterNames();

	while(x.hasMoreElements()){
		String z = x.nextElement();
		out.print(z+ " : ");
		String [] y = request.getParameterValues(z);
		
		for(int i=0;i<y.length;i++){
			out.print(y[i]+ " ");
			
		}
		out.print("<br>");
	}

%>