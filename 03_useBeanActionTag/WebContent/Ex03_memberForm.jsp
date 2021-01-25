<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex03_memberForm.jsp<br>

<form method="post" action="Ex03_memberResult.jsp">

	이름 : <input type="text" name="name"><br>
	취미 : <input type="checkbox" name="hobby" value="달리기">달리기
		  <input type="checkbox" name="hobby" value="수영">수영
		  <input type="checkbox" name="hobby" value="영화">영화
		  <input type="checkbox" name="hobby" value="등산">등산
		  
		  <input type="submit" value="보내기">


</form>