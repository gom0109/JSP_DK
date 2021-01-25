<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex05_studentResult.jsp
<br>

<%
	request.setCharacterEncoding("UTF-8");
String[] subject = { "국어", "영어", "수학", "음악", "미술" };
%>


<jsp:useBean id="sb" class="DTO.SungjukBean"></jsp:useBean>
<jsp:setProperty property="*" name="sb" />
이름 :
<jsp:getProperty property="name" name="sb" /><br>
비번 :
<jsp:getProperty property="password" name="sb" /><br>
<br>

과목점수
<br>
<%
	String[] sungjuk = sb.getJumsu();
for (int i = 0; i < sungjuk.length; i++) {
	out.print(subject[i] + ":" + sungjuk[i] + "<br>");
}
%>
<br>

좋아하는 걸그룹 :
<%
	String[] group = sb.getGroup();
for (int i = 0; i < group.length; i++) {
	out.print(group[i] + " ");
}
%>
