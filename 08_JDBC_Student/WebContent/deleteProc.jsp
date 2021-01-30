<%@page import="myPkg.StudentBean"%>
<%@page import="myPkg.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));

	StudentDao dao = new StudentDao();
	int cnt = dao.deleteByNum(num);
	
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
%>