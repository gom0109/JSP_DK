<%@page import="myPkg.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	StudentDao dao = new StudentDao();
	String [] chcekone =request.getParameterValues("chcekone");
	String co = "";
	for(int i =0 ;i<chcekone.length;i++){
		co += chcekone[i]+" ";
		
	}
	int cnt = dao.deleteAll(chcekone);
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
	
%>