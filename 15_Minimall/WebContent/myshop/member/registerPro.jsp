<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
registerPro.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDAO mdao = MemberDAO.getInstance();
	%>
	<jsp:useBean id="dto" class="my.member.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<%

	int cnt = mdao.insertData(dto); 
	if(cnt>0){
		%>
			<script type="text/javascript">
				alert("삽입성공");
				location.href="../../main.jsp";
				<%-- location.href="<%=request.getContextPath()%>/main.jsp"; --%>
				
			</script>
		<%
		
	}else{
		%>
		<script type="text/javascript">
			alert("삽입실패");
			location.href="register.jsp";
		</script>
	<%
	}
	
%>
