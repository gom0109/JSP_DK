<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex02_via.jsp
<br>
<%
	request.setCharacterEncoding("UTF-8");//한글처리는 거쳐가는페이지에서 할것
String name = request.getParameter("name");
String color = request.getParameter("color");
String selectedColor=color+".jsp";
%>
이름 :
<%=name%><br>
색상 :
<%=color%><br>
<%-- <img src="../images/<%=color%>.jpg"> --%>

<%-- <jsp:forward page='<%=color%>.jsp'> --%>
<jsp:forward page='<%=color+".jsp"%>'>

<jsp:param value="" name=""/>
</jsp:forward>


