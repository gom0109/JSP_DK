<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_form.jsp<br>
<form method="post" action="Ex01_proc.jsp" enctype="multipart/form-data">
	이름 : <input type="text" name="name"><br>
	파일 : <input type="file" name="filename"><br>
	
	<input type="submit" value="업로드">
</form>