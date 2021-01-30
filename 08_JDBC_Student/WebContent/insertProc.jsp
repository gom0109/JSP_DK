<%@page import="myPkg.StudentDao"%>
<%@page import="myPkg.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
insertProc.jsp
<br>

<%
	request.setCharacterEncoding("UTF-8");
StudentBean bean = new StudentBean();
StudentDao dao = new StudentDao();

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int day = Integer.parseInt(request.getParameter("day"));

String[] hby = request.getParameterValues("hobby");
String hobby = "";
if (hby == null) {
	hobby = "선택한 취미없음";
} else {
	for (int i = 0; i < hby.length; i++) {
		hobby += hby[i] + " ";
	}
}

int c = Integer.parseInt(request.getParameter("c"));
int java = Integer.parseInt(request.getParameter("java"));
int jsp = Integer.parseInt(request.getParameter("jsp"));
int sum = c + java + jsp;

bean.setId(id);
bean.setPasswd(passwd);
bean.setName(name);
bean.setYear(year);
bean.setMonth(month);
bean.setDay(day);
bean.setHobby(hobby);
bean.setC(c);
bean.setJava(java);
bean.setJsp(jsp);
bean.setSum(sum);

int cnt = dao.insertData(bean);
if (cnt > 0) {
	response.sendRedirect("list.jsp");
} else {
	response.sendRedirect("insertForm.jsp");
}
%>



