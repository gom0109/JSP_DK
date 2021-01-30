<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp
<jsp:useBean id="dao" class="myPkg.EmplDao"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String [] rowcheck = request.getParameterValues("rowcheck");
int cnt = dao.deleteCheckData(rowcheck);
if(cnt>0){
	response.sendRedirect("select.jsp");
	
}
%>