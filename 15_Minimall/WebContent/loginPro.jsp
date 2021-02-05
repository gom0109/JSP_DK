<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
loginPro.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO mdao = MemberDAO.getInstance();
	MemberDTO member =  mdao.getMemberInfo(id,password);
	String viewPage = null;
	if(member == null){
		%>
		<script type="text/javascript">
			alert("잘못된 회원정보입니다")
			location.href="main.jsp"
		</script>
		<%
	}else{
		if(member.getId().equals("admin")){//관리자
			viewPage = "myshop/admin/main.jsp";
		}else{//일반사용자
			viewPage = "myshop/display/mall.jsp";
		}
		
		response.sendRedirect(viewPage);
	}
	
%>