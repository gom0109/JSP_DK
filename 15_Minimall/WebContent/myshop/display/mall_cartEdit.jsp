<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartEdit.jsp<br>
<jsp:useBean id="cartBean" class="my.shop.mall.CartBean" scope="session"></jsp:useBean>
<%
	int amt = Integer.parseInt(request.getParameter("amt"));
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	out.print(amt);
	out.print(pnum);
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pbean = pdao.selectByNum(pnum);
	if(amt>pbean.getPqty()){
		%>
		<script type="text/javascript">
		 alert("주문가능수량 초과");
		 location.href="mall_cartList.jsp"
		</script>
		<%
	}else{
		cartBean.updateProduct(pnum, amt);
		response.sendRedirect("mall_cartList.jsp");
	}
	
%>