<%@page import="DTO.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	BookDao dao = new BookDao();	
%>

<jsp:useBean id="bean" class="DTO.BookBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
	
	String temp="";
	
	String []bs =request.getParameterValues("bookstore");
	for(int i=0;i<bs.length;i++){
		temp += bs[i]+" ";
	}
	
	bean.setBookstore(temp);
	int cnt = dao.updateData(bean);
	
	if(cnt>0){
		response.sendRedirect("select.jsp");
	}
	else{
		response.sendRedirect("updateForm.jsp?no="+bean.getNo());
	}
%>
