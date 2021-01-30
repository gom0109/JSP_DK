<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
<jsp:useBean id="dao" class="DTO.BookDao"></jsp:useBean>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	
	int cnt = dao.deleteData(no);
	
	if(cnt>0){
		response.sendRedirect("select.jsp");
	}
%>