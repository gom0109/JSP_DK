<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
control.jsp
<br>
<%
	String product = request.getParameter("product");
String x;
if (product.equals("1")) {
	x = "tv";
} else if (product.equals("2")) {
	x = "dc";
} else {
	x = "mp";
}
%>

<jsp:forward page="template.jsp">
	<jsp:param value="<%=x%>" name="x" />

</jsp:forward>