<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_top.jsp -->
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
			<caption>카테고리</caption>
				<%
					CategoryDao cdao = CategoryDao.getInstance();
					ArrayList<CategoryBean> clist = cdao.getAllCategory();
					if(clist.size()==0){
						out.print("<tr><td>등록한 카테고리가 없음</td></tr>");
					}else{
						for(int i=0;i<clist.size();i++){
						CategoryBean cbean = clist.get(i);
						%>
						<tr>
							<td><a href="<%=path%>/myshop/display/mall_cgList.jsp?cname=<%=cbean.getCname()%>&code=<%=cbean.getCode() %>"><%=cbean.getCname()%>[<%=cbean.getCode() %>]</a></td>
						</tr>
						<%
						}
					}
				%>
			</table>
		
		</td>
		<td width=590px align="center" valign="top">