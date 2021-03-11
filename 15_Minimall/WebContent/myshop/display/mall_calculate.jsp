<%@page import="my.shop.mall.OrderDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_calculate.jsp<br>

<jsp:useBean id="cartBean" class="my.shop.mall.CartBean" scope="session"></jsp:useBean>
<jsp:useBean id="odao" class="my.shop.mall.OrderDao" scope="session"></jsp:useBean>
<%
	Vector<ProductBean> vec = cartBean.getAllProduct();
	int mno = (int)session.getAttribute("mno");
	System.out.println(mno);
	int cnt = odao.insertOrder(vec,mno);
	if(cnt>0){
		cartBean.deleteAllProduct();
		%>
		<script type="text/javascript">
			alert("주문성공")
			location.href="mall.jsp";
		</script>
		<%
		
	}else{
		%>
		<script type="text/javascript">
			alert("주문실패")
			location.href="mall.jsp";
		</script>
		<%
	}
%>