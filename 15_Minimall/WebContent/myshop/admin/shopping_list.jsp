<%@page import="my.shop.mall.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
shopping_list.jsp<br>
<jsp:useBean id="ob" class="my.shop.mall.OrderBean"></jsp:useBean>
<jsp:useBean id="odao" class="my.shop.mall.OrderDao" scope="session"></jsp:useBean>
<%
	String memid= request.getParameter("memid");
	ArrayList <OrderBean> list = null;
	if(memid != null){
		list = odao.getOrderList(memid);
		System.out.println(list.size());
	}
	
	int total=0;
%>
<jsp:include page="top.jsp"></jsp:include>
	<td colspan="6" align="center" valign="top">
		<table border="1" width=800>
			<tr>
				<td colspan="5">
					<form method="post" action="shopping_list.jsp">
						조회할 회원 아이디 입력:
						<input type="text" name="memid" value="hong">
						<input type="submit" value="내역조회">
					</form>
				</td>
			</tr>
			<tr>
				<td>고객명</td>
				<td>아이디</td>
				<td>상품명</td>
				<td>수량</td>
				<td>금액</td>
			</tr>
			<%
			if(list!=null){
				for(int i=0;i<list.size();i++){
					OrderBean obean = list.get(i);
					%>
					<tr>
						<td><%=obean.getMname() %></td>
						<td><%=obean.getMid() %></td>
						<td><%=obean.getPname() %></td>
						<td><%=obean.getQty() %></td>
						<td><%=obean.getAmount() %></td>
					</tr>
					
					<%
					total = total+ obean.getAmount();
				}
			}
				
			
			
			%>
			
			
			
			
			
			<tr>
				<td colspan="4">종합</td>
				<td> <%=total %>원</td>
				
			</tr>
			
		
		
		
		</table>




	</td>
<jsp:include page="bottom.jsp"></jsp:include>