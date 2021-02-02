<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="myPkg.StudentDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	boolean flag = dao.checkid(userid);
	String str = "";
	if(flag == true){//중복되는 아이디 존재
		str = "NO";
		out.print(str);
	}
	else{
		str = "YES";
		out.print(str);
	}
	
%>