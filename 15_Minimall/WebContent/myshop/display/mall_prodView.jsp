<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pbean = pdao.selectByNum(pnum);
	String reqPath = request.getContextPath()+"/myshop/images";
	DecimalFormat df = new DecimalFormat("###,###");
%>
<script type="text/javascript">
	function goCart(pnum){
		//alert(pnum)
		selectqty = f.oqty.value;
		//alert(selectqty)
		if(selectqty<1){
			alert("수량을 입력하세요")
			f.oqty.focus();
			return;
		}
		if(selectqty><%=pbean.getPqty()%>){
			alert("주문가능 최대 수량은 <%=pbean.getPqty()%>입니다")
			return;
		}
		
		location.href="mall_cartAdd.jsp?pnum="+pnum+"&selectqty="+selectqty;
		
	}
	function goOrder(pnum){
		selectqty = f.oqty.value;
		if(selectqty<1){
			alert("수량을 입력하세요")
			f.oqty.focus();
			return;
		}
		if(selectqty><%=pbean.getPqty()%>){
			alert("주문가능 최대 수량은 <%=pbean.getPqty()%>입니다")
			return;
		}
		location.href="mall_order.jsp?pnum="+pnum+"&selectqty="+selectqty;
	}

</script>
    
    
<%@include file="mall_top.jsp" %>
<table border="0" width="100%" class=outline>
	<tr>
		<td colspan="2" align="center"><font color="green"><b>[<%=pbean.getPname() %>]상품정보</b></font></td>
	</tr>
	<tr>
		<td align="center" class=m3><img src="<%=reqPath%>/<%=pbean.getPimage()%>"></td>
		<td class=m3 >
			<form name="f" method="post">
			상품번호 : <%=pnum %><br>
			상품이름 : <%=pbean.getPname() %><br>
			상품가격 : <font color="red"><%=df.format(pbean.getPrice())  %></font>원<br>
			상품포인트 : <font color="red">[<%=df.format(pbean.getPoint())  %>]</font>point<br>
			
			상품갯수 : <input type="text" name="oqty" value="1" size="2">개 (재고 : <%=pbean.getPqty() %>개)<br>
			<table border="0" width="90%">
				<tr>
					<td><a href="javascript:goCart(<%=pnum%>)"><img src="../../img/cartbtn.gif" width="70" height="30"></a></td>
					<td><a href="javascript:goOrder(<%=pnum%>)"><img src="../../img/orderbtn.gif" width="70" height="30"></a></td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="200" style="vertical-align: top;"><font color="blue"><b>상품 상세 설명</b><br>
			<%=pbean.getPcontents() %></font>
		</td>
	</tr>
</table>
<%@include file="mall_bottom.jsp" %>