<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartList.jsp<br>

<%@include file="mall_top.jsp" %>

<jsp:useBean id="cartBean" class="my.shop.mall.CartBean" scope="session"></jsp:useBean>
<%
	Vector<ProductBean> cVec = cartBean.getAllProduct();
	System.out.println("list"+cVec.size());
	String reqPath = request.getContextPath()+"/myshop/images";
	
%>

<table border="1" width="99%">
	<tr class=m2>
		<th colspan="6" bgcolor="yellow" height="50">장바구니 보기</th>
	</tr>
	<%
	if(cVec.size()==0){
		%><tr><td colspan="6" align="center">장바구니가 비어있음</td></tr><%
	}else{
		%>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>수량</th>
			<th>단가</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>
		<%
		int totalprice = 0;
		int totalpoint = 0;
		for(int i=0;i<cVec.size();i++){
			ProductBean pbean = cVec.get(i);
			totalprice +=pbean.getPrice()*pbean.getPqty();
			totalpoint +=pbean.getPoint()*pbean.getPqty();
			%>
			<tr>
				<td><%=pbean.getPnum() %></td>
				<td align="center">
					<img src="<%=reqPath%>/<%=pbean.getPimage()%>" width="50" height="50"><br>
				<%=pbean.getPname() %></td>
				<td>
				<form name="myform" method="post" action="mall_cartEdit.jsp">
				<input type="text" name="amt" value="<%=pbean.getPqty() %>" size="2">개 <input type="submit" value="수정">
				<input type="hidden" name="pnum" value="<%= pbean.getPnum()%>">
				</form>
				</td >
				<td align="right"><font color="blue"><%=pbean.getPrice() %>원<br>
					[<%=pbean.getPoint() %>]point
				</td>
				<td align="right"><font color="red"><%= pbean.getTotalPrice()%>원<br>
					[<%=pbean.getTotalPoint() %>]point</font></td>
				<td><a href="mall_cartDelete.jsp?pnum=<%=pbean.getPnum()%>">삭제</a></td>
			</tr>
			
			
			<%
			
		}
		%>
		<tr>
		<td colspan="4">장바구니 총액: <%=totalprice %>원<br>
		총 정립포인트: <%=totalpoint %>point</td>
		<td colspan="2">
		<a href="mall_order.jsp">[주문하기]</a> <a href="mall.jsp"> [계속쇼핑]</a></td>
	</tr>
	<%
	}
	
	%>
	

</table>






<%@include file="mall_bottom.jsp" %>