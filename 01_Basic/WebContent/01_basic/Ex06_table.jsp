<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	th,td{
		border: 1px solid black;
	}
	table{
		border-collapse: collapse;
	}
</style>
<table>
	<tr>
		<th>첨자</th>
		<th>내용</th>
	</tr>

	<%
		String[] str = { "JSP", "정말", "재미", "있다" };
	String x;
	for (int i = 0; i < str.length; i++) {
		x = str[i];
	%>
	<tr>
		<td><%=i%></td>
		<td><%=x%></td>
	</tr>
	<%
		}
	%>
</table>
