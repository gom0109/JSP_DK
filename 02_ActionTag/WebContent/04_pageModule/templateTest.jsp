<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
table {
	width: 600px;
	height: 400px;
	border-collapse: collapse;
}

td:nth-child(1) {
	width: 200px;
}
</style>
templateTest.jsp
<br>
<!-- main.jsp에서 시작할것@@@@@@@@@@@@@@@@@@@@@@@ -->
<%
	String contentPage = request.getParameter("contentPage");
/* String contentPage  =content.jsp, comp.jsp, goods.jsp */
%>

<table border="1">
	<tr>
		<td colspan="2"><%@ include file="top.jsp"%>
		</td>
	</tr>
	<tr>
		<td><jsp:include page="left.jsp"></jsp:include></td>
		<td>
			<jsp:include page="<%=contentPage%>"></jsp:include>
		</td>
	</tr>
	<tr>
		<td colspan="2"><%@ include file="bottom.jsp"%>
		</td>
	</tr>
</table>