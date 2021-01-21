<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
template.jsp
<br>
<%
	String x = request.getParameter("x");
	String xL = x+"Left.jsp";
	String xR = x+".jsp";
	
%>

<table border="2" width="500px" height="250px"
	style="text-align: center;">
	<tr>
		<td colspan="2">
		<jsp:include page="top.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td><jsp:include page="<%=xL %>"></jsp:include></td>
		<td style="text-align: left;"><jsp:include page="<%=xR %>"></jsp:include></td>
	</tr>
	<tr>
		<td colspan="2"><jsp:include page="bottom.jsp"></jsp:include></td>
	</tr>
</table>
