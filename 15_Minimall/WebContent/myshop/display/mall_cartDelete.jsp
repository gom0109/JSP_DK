<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartDelete.jsp<br>
<jsp:useBean id="cartBean" class="my.shop.mall.CartBean" scope="session"></jsp:useBean>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	cartBean.deleteProduct(pnum);
	response.sendRedirect("mall_cartList.jsp");
%>