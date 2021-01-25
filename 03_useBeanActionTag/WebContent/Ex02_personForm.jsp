<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_personForm.jsp<br>

<form method="post" action="Ex02_personResult.jsp">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input text="text" name ="name"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input text="text" name ="age"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input text="text" name ="address"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input text="text" name ="tel"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</th>
			
		</tr>
	
	</table>



</form>