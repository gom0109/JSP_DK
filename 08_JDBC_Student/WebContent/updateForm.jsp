<%@page import="myPkg.StudentBean"%>
<%@page import="myPkg.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
updateForm.jsp
<br>
<%
	request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));

StudentDao dao = new StudentDao();
StudentBean bean = dao.selectByNum(num);
%>


<h2>회원 updateForm.jsp</h2>
<form action="updateProc.jsp?num=<%=num %>" method="post">
	 <input type="hidden" name="id" value="<%=bean.getId()%>">
	아이디 :<%=bean.getId()%><br> <br> 
	비밀번호 : <input type="password"	name="passwd" value="<%=bean.getPasswd()%>"><br> <br>
	이름 : <input type="text" name="name" value="<%=bean.getName()%>"><br>
	<br> 생년월일 : <select name="year">
		<%
			for (int i = 2019; i >= 1930; i--) {
			if (i == bean.getYear()) {
		%><option value="<%=i%>" selected="selected"><%=i%></option>
		<%
			} else {
		%><option value="<%=i%>"><%=i%></option>
		<%
			}
		}
		%>
	</select> 년 <select name="month">
		<%
			for (int i = 1; i <= 12; i++) {
			if (i == bean.getMonth()) {
		%><option value="<%=i%>" selected="selected"><%=i%></option>
		<%
			} else {
		%><option value="<%=i%>"><%=i%></option>
		<%
			}
		}
		%>
	</select> 월 <select name="day">
		<%
			for (int i = 1; i <= 31; i++) {
			if (i == bean.getDay()) {
		%><option value="<%=i%>" selected="selected"><%=i%></option>
		<%
			} else {
		%><option value="<%=i%>"><%=i%></option>
		<%
			}
		}
		%>
	</select> 일 <br> <br> 취미 :
	<%
 	String[] hobby = { "달리기", "수영", "잠자기", "영화" };
 for (int i = 0; i < hobby.length; i++) {
 	if (bean.getHobby().contains(hobby[i])) {
 %><input type="checkbox" name="hobby" value="<%=hobby[i]%>"
		checked="checked"><%=hobby[i]%>
	<%
		} else {
	%><input type="checkbox" name="hobby" value="<%=hobby[i]%>"><%=hobby[i]%>
	<%
		}

	}
	%>
	<br> <br> <br> [점수입력]<br> C언어 : <input type="text"
		name="c" size="10" value="<%=bean.getC()%>"> JAVA : <input
		type="text" name="java" size="10" value="<%=bean.getJava()%>">
	JSP : <input type="text" name="jsp" size="10"
		value="<%=bean.getJsp()%>"><br> <br> <input
		type="submit" value="수정하기">
</form>
