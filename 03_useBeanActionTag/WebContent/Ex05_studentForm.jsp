<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex05_studentForm.jsp
<br>
<%
	String[] subject = { "국어", "영어", "수학", "음악", "미술" };
%>
<form method="post" action="Ex05_studentResult.jsp">

	이름 : <input type="text" name="name" value="홍길동">
	<p>
		비번 : <input type="password" name="password" value="1234">
	<p>과목점수
	<p>
		<%
			for (int i = 0; i < subject.length; i++) {
		%>
		<%=subject[i]%>
		: <input type="text" name="jumsu" value="11"><br>
		<%
			}
		%>
		
	좋아하는 걸그룹 : <select name="group" multiple="multiple">
		<option value="블랙핑크">블랙핑크</option>
		<option value="프로미스나인">프로미스나인</option>
		<option value="트와이스">트와이스</option>
		<option value="레드벨벳">레드벨벳</option>
		<option value="잇지">잇지</option>
	
	</select>
	
	<input type="submit" value="실행">	
</form>