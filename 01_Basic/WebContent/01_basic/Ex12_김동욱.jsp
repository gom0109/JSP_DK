<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jsp 구구단 -->
<style type="text/css">
 th{
 	background: pink
 }
 table,th,td{
 	border: 1px solid black;
 	border-collapse: collapse;
 	padding: 5px;
 }
 
</style>



<table >
	<tr>
		<%
			for (int z = 2; z <= 9; z++) {
		%>
		<th><%=z%>단</th>
		<%
			}
		%>
	</tr>


	<%
		for (int i = 1; i <= 9; i++) {
	%>
	<tr>
		<%
			for (int j = 2; j <= 9; j++) {
		%>
		<td><%=j%> x<%=i%> = <%=i * j%></td>
		<%-- <td><%=j+ "x"+ i +"="+ i * j%></td> --%>
		<%
			}
		%>
	</tr>
	<%
		}
	%>




</table>