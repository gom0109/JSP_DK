<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwdPro.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDAO mdao = MemberDAO.getInstance();
%>
<jsp:useBean id="dto" class="my.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String pw =mdao.getPwById(dto);
	if(pw==null){
		%>
		<script type="text/javascript">
		alert("일치하는 회원정보가 없습니다");
		location.href="main.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("찾으시는 비밀번호는  <%=pw%>입니다");
		location.href="main.jsp";
		</script>
		<%
	}
%>

