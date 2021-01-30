<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
<jsp:useBean id="dao" class="myPkg.MovieDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	int cnt = dao.deleteData(num);
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
%>