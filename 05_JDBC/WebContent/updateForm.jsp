<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp(1차 수정폼)<br>

<h2> JDBC - update - 폼 페이지 </h2>

<form method="post" action="updateVia.jsp">
	<table border="1" cellpadding="3" cellspacing="0">
		<tr>
			<th colspan="2">
				회원 정보를 입력해 주세요
			</th>
		</tr>
		<tr>
			<th> 아이디 </th>
			<td> <input type="text" name="id"> </td>
		</tr>
		<tr>
			<th> 패스워드 </th>
			<td> <input type="password" name="passwd"> </td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</th>
		</tr>	
	</table>
</form>
