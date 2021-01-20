<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
session1.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	out.print("id : "+ id+"<br>");
	out.print("pw : "+ pw+"<br>");
%>
<hr>
<%
	session.setAttribute("id", id); /* ("세션이름",세션으로 설정할 값) */
	session.setAttribute("pw", pw);
	session.setMaxInactiveInterval(10);//10초동안 세션 유지
%>

<form method="post" action="session2.jsp">
	 <%-- <input type="hidden" name="id" value="<%=id%>"> --%><!-- 화면에 표시되지않는다 -->
	<%--  <input type="hidden" name="pw" value="<%=pw%>"> --%><!-- 화면에 표시되지않는다 -->
	★가장 좋아하는 스포츠를 선택하세요★<br>
	<input type="radio" name="sports" value="태권도">태권도
	<input type="radio" name="sports" value="유도">유도
	<input type="radio" name="sports" value="유도">수영<p>
	★가장 좋아하는 게임을 선택하세요★<br>
	<select name="game">
		<option value="카트라이더">카트라이더</option>
		<option value="리니지">리니지</option>
		<option value="기적의검">기적의검</option>
	
	
	</select><br>
	
	
	
	<input type="submit" value="전송">

</form>