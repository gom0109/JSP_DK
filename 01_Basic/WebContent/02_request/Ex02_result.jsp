<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_result.jsp <br>

<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	
	int x = Integer.parseInt(num1);	
	int y = Integer.parseInt(num2);	
	int result=1;
	for(int z=0;z<y;z++){
		result = result*x;
	}
	
%>

num1 : <%=num1%><br>
num2 : <%=num2%><br>
result : <%=result%><br><br>

<%=(int)Math.pow(x, y)%>