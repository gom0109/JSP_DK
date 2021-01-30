<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
checkedDelete.jsp<br>
<jsp:useBean id="dao" class="myPkg.MovieDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String [] cone = request.getParameterValues("checkone");
	for(int i=0;i<cone.length;i++){
		out.print(cone[i]+" ");
	}
	int cnt = dao.cDelete(cone);
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
%>