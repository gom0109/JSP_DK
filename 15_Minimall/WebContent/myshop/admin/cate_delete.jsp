<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cate_delete.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.deleteCategory(cnum);
	
	String msg="";
	if(cnt>0){
		msg="카테고리 삭제 성공";
	}
	else{
		msg="카테고리 삭제 실패";
	}	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="cate_list.jsp";

</script>