<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex05_result.jsp
<br>
<br>


<%
	request.setCharacterEncoding("UTF-8");
/* request.getLocalName(); */
String name = request.getParameter("name");
String address = request.getParameter("address");
String[] pet = request.getParameterValues("pet");

out.print(name + "<br>");
out.print(address + "<br>");
for (int i = 0; i < pet.length; i++) {
	out.print(pet[i] + " ");

}
%>
<br>
<br>
<%
	Enumeration<String> pen = request.getParameterNames();
while (pen.hasMoreElements()) {
	String element = pen.nextElement();
	out.print(element + " ");
}
%>

<br>
<br>
<%
	Enumeration<String> n = request.getParameterNames();
while (n.hasMoreElements()) {
	String elements = n.nextElement();
	out.print(elements + " : ");
	String[] x = request.getParameterValues(elements);

	for (int i = 0; i < x.length; i++) {
		out.print(x[i] + " ");

	}
	out.print("<br>");
}
%>