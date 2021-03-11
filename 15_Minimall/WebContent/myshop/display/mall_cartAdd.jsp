<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartAdd.jsp
<jsp:useBean id="cartBean" class="my.shop.mall.CartBean" scope="session"></jsp:useBean> <!-- 싱글톤과 비슷 -->


<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int selectqty =Integer.parseInt(request.getParameter("selectqty"));
	//System.out.println(pnum);
	//System.out.println(selectqty);
	//System.out.println(cartBean);
	
	cartBean.addProduct(pnum,selectqty); 
	response.sendRedirect("mall_cartList.jsp");
	
%>