<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex03_select_result.jsp<br><br>
<%	
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");//value가 담겨 넘어옴
	String age = request.getParameter("age");
	String gender =  request.getParameter("gender");
	String hobby =  request.getParameter("hobby");
	String color =  request.getParameter("color");
	/* String [] gender =request.getParameterValues("gender");
	String [] hobby =request.getParameterValues("hobby");
	String [] color =request.getParameterValues("color"); */
	
	if(gender.equals("m")){
		gender="남자";
	}
	else{
		gender="여자";
	}

%>
이름 : <%=name %><br>
나이 : <%=age %><br>
성별 : <%=gender %><br>
취미 : <%=hobby %><br>
색상: <%=color %><br>
<%-- <%=gender[0] %><br>
<%=hobby[0] %><br> --%>
<img src="../images/<%=color%>.jpg">
<br>
<br>
<br>
<%
	Enumeration<String> e =request.getParameterNames();
	while(e.hasMoreElements()){
		String x = e.nextElement();
		out.print(x+ " : ");
		String y = request.getParameter(x);
		out.print(y+ "<br>");
	}


%>
