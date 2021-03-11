<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	function checkDel(pnum,pimage){
		var ans =confirm("정말 삭제하시겠습니까?");
		
		if(ans == true){
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage;
		}
	}
</script>

<%@include file="top.jsp"%>
	<td colspan="6" align="center" valign="top">
		<b>상품목록</b><br>
		<table width="99%" height = "99%" class=outline>
			<tr class="m2">
				<th>번호</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>이미지</th>
				<th>가격</th>
				<th>제조사</th>
				<th>수량</th>
				<th>수정|삭제</th>
			</tr>
			<%	
				String requestFolder = request.getContextPath() + "/myshop/images";
				ProductDao pdao = ProductDao.getInstance();
				ArrayList<ProductBean> list =  pdao.selectAllProd();
				if(list.size()==0){
					%>
						<tr><td colspan="8">등록된 상품이 없습니다</td></tr>
					<%
				}else{
					for(int i=0;i<list.size();i++){
					ProductBean bean = list.get(i);
					//System.out.println(requestFolder+"/"+bean.getPimage());
					%>
						<tr>
							<td align="right"><%=bean.getPnum() %></td>
							<td align="center"><%=bean.getPcategory_fk() %></td>
							<td align="center"><%=bean.getPname() %></td>
							<td align="center"><img src="<%=requestFolder %>/<%=bean.getPimage()%>" width="50" height="50"></td>
							<td align="right"><%=bean.getPrice() %></td>
							<td align="center"><%=bean.getPcompany() %></td>
							<td align="right"><%=bean.getPqty() %></td>
							<td align="center"><a href="prod_update.jsp?pnum=<%=bean.getPnum()%>">수정</a>|<a href="javascript:checkDel('<%=bean.getPnum() %>','<%=bean.getPimage()%>')">삭제</a></td>
						</tr>
					<%
					}
				}			
			%>
		</table>
		
		
	</td>
<%@include file="bottom.jsp"%>