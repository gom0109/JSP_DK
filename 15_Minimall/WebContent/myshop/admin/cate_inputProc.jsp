<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cate_inputProc.jsp<br>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="cbean" class="my.shop.CategoryBean"></jsp:useBean>
<jsp:setProperty property="*" name="cbean"/>
<%
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.insertCategory(cbean);
	if(cnt>0){
		response.sendRedirect("cate_list.jsp");
	}else{
		%>
			<script type="text/javascript">
				alert("삽입실패");
				location.href("cate_input.jsp");
			</script>
		
		<%
	}
%>