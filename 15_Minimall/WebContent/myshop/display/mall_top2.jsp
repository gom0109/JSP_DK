<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<style type="text/css">
	.logout{
		float : right
	}
</style>

<link rel="stylesheet" type="text/css" href="../../styles.css">
<table border="1" width="770px" align="center" >
	<tr height = 50>
		<td colspan="2" align="center">
			<a href="<%=path %>/main.jsp">로그인</a>|
			<%
				if(session.getAttribute("mid").equals("admin")){
					%><a href="<%=path %>/myshop/admin/main.jsp">관리자 홈</a>|<%
				}
			
			%>
			
			<a href="mall.jsp">쇼핑몰 홈</a>|
			<a href="mall_cartList.jsp">장바구니</a>|
			<a href="<%=path%>/myshop/board/list.jsp">게시판</a>|
			<a href="company.jsp">회사소개</a>|
			<span class="logout"><%=session.getAttribute("mid") %>님
				<a href="../../logout.jsp"><img src="<%=path%>/img/logout.jpg" width=50 height=20></a></span>		
		</td>
	</tr>
	<tr>
		<td width=180px align="center" valign="top">
			
			<table border="1">
				<tr>
					<td><a href="ceo.jsp">CEO인사말</a></td>
				</tr>
				<tr>
					<td><a href="history.jsp">회사연혁</a></td>
				</tr>
				<tr>
					<td><a href="chart.jsp">조직도</a></td>
				</tr>
			</table>
		
		</td>
		<td width=590px align="center" valign="top">