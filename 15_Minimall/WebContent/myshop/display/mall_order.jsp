<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_order.jsp<br>
<jsp:useBean id="cartBean" class="my.shop.mall.CartBean" scope="session"></jsp:useBean>
<jsp:useBean id="cb" class="my.shop.mall.CartBean" scope="session"></jsp:useBean>
<%	
	String pnum;
	String id = (String)session.getAttribute("mid");
	if(request.getParameter("pnum")==null){
		pnum = null;
	}else{
		pnum = request.getParameter("pnum");
	}
	
	
	int tp = 0;
%>
<%@ include file="mall_top.jsp" %>
	<%
		if(id.equals("admin")){
			%>
			<script type="text/javascript">
				alert("관리자는 주문할수 없습니다.")
				location.href="mall_cartList.jsp";
			</script>
			<%
			
		}else{
			%>
				<table width="90%" border="1" align="center" class="outline">
					<tr class="m2">
						<td colspan="3" align="center">결재 내역서 보기</td>
					</tr>
					<tr class="m1">
						<th width="40%">상품명</th>
						<th width="20%">수량</th>
						<th width="40%">금액</th>
					</tr>
					<%
					if(pnum==null){
						Vector<ProductBean> vec = cartBean.getAllProduct();
						
						for(int i=0;i<vec.size();i++){
							ProductBean pbean =  vec.get(i);
							%>
								<tr>
									<td><%=pbean.getPname() %></td>
									<td><%=pbean.getPqty() %></td>
									<td><%=pbean.getTotalPrice() %></td>
								</tr>
							<%
							tp = tp+pbean.getTotalPrice();
						}
						%>
						<tr class="m1">
							<td colspan="3">총 결재하실 금액: <%=tp %>원</td>
						</tr>
						</table>
					<input type="button" value="결재하기" onclick="location.href='mall_calculate.jsp'">
					
					<%
					}else{
						
						ProductDao pdao = ProductDao.getInstance();
						ProductBean bean = pdao.selectByNum(Integer.parseInt(pnum));
						%>
						
						<tr>
							<td><%=bean.getPname() %></td>
							<td><%=bean.getPqty() %></td>
							<td><%=bean.getPrice() %></td>
						</tr>
						<tr class="m1">
						<td colspan="3">총 결재하실 금액: <%=bean.getPrice() %>원</td>
						</tr>
						</table>
					<input type="button" value="결재하기" onclick="location.href='mall_calculate2.jsp'">
					<%
					}
					
		}
	
	%>



<%@ include file="mall_bottom.jsp" %>