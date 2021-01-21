<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex07_김동욱_result.jsp
<hr>
<table border="1">
	<%
		request.setCharacterEncoding("UTF-8");
	Enumeration<String> e = request.getParameterNames();
	%>
	<tr>
		<%
			while (e.hasMoreElements()) {
			String name = e.nextElement();
			String[] values = request.getParameterValues(name);
		%><td>
			<%
				out.print(name);
			%>
		</td>
		<td>
			<%
				for (int i = 0; i < values.length; i++) {
					if(values[i].equals("on")){
						out.print("동의함");
					}else{
						out.print(values[i] + " ");
					}
				
			}
			%>
		</td>
		
	</tr>
	<%
		}
	%>
</table>