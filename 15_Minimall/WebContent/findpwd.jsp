<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwd.jsp<br>
<link rel="stylesheet" type="text/css" href= "<%=request.getContextPath() %>/style.css"/>
<form method="post" action="findpwdPro.jsp">
<table border="1">
	<tr>
		<td bgcolor="yellow" align="center">이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td bgcolor="yellow" align="center">아이디</td>
		<td><input type="text" name="id"></td>
	</tr>
	
	
	<tr>
		<td bgcolor="yellow" align="center">주민등록번호</td>
		<td><input type="text" name="rrn1" maxlength="6" size="6" >
			- 
			<input type="text" name="rrn2" maxlength="7" size="7" ></td>
	</tr>
	<tr>
		<td colspan="2" align="center" bgcolor="#FFCC00">
			<input type="submit" value="비밀번호 찾기">
		</td>
	</tr>

</table>


</form>