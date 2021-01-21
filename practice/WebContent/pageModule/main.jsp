<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
main.jsp<br>

<form method="post" action="template.jsp">
<table border="1">
<tr>
	<td colspan="2">게시판</td>
</tr>
<tr>
	<td>글 목록</td>
	<td><jsp:include page="list.jsp"></jsp:include></td>
</tr>
</table>
</form>