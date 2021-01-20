<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
applicationTest.jsp<hr>
<%
	String path = application.getContextPath();
	out.print(path+"<br>");//프로젝트 이름 
	//프로젝트 안에서 어디서든 사용하고싶은 변수를 만들때 application내장객체 사용
	
	String reqpath = request.getContextPath();//요청이 들어오면 request객체가 만들어짐
	out.print(reqpath);
%>

