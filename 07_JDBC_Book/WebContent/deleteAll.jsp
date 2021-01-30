<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>
<jsp:useBean id="dao" class="DTO.BookDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String [] rowcheck = request.getParameterValues("rowcheck");
	
	/* for(int i=0;i<rowcheck.length;i++){
		
	} */
	
	
	int cnt = dao.deleteCheckData(rowcheck);
	if(cnt>0){
		response.sendRedirect("select.jsp");
		
	}
	
%>