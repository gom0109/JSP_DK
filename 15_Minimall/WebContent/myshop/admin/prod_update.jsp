<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_update.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	int pnum =Integer.parseInt(request.getParameter("pnum"));
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pbean = pdao.selectByNum(pnum);
	
	String fullpath = request.getContextPath() +"/myshop/images/"+pbean.getPimage();
	
%>

<%@include file="top.jsp"%>
	<td colspan="6" align="center">
		<form name="f" action="prod_updateproc.jsp?pnum=<%=pnum %>" method="post" enctype="multipart/form-data">
<table border=0 class=outline width="600">
<CAPTION ALIGN="TOP"><b>상품등록카테고리</b></CAPTION>
	<tr>
		<th class="m2">카테고리</th>
		<td align=left>
		 	<input type="text" name="Pcategory_fk" value="<%=pbean.getPcategory_fk() %>" readonly="readonly">	
		</td>
	</tr>
	<tr>
		<th class="m2">상품번호</th>
		<td align=left>
			<%=pnum %>
			
		</td>
	</tr>
	<tr>
		<th class="m2">상품명</th>
		<td align=left>
		<input type=text name="pname" value="<%=pbean.getPname() %>">
		</td>
	</tr>
	
	<tr>
		<th class="m2">제조회사</th>
		<td align=left>
		<input type=text name="pcompany" value="<%=pbean.getPcompany()%>">
		</td>
	</tr>
	<tr>
		<th class="m2">상품이미지</th>
		<td align=left>
			<img src="<%=fullpath%>">
			<input type=file name="pimage">
			<input type="hidden" name="pimage2" value="<%=pbean.getPimage()%>">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 수량</th>
		<td align=left>
		<input type=text name="pqty" maxlength=8 value="<%=pbean.getPqty()%>">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 가격</th>
		<td align=left>
		<input type=text name="price" maxlength=8 value="<%=pbean.getPrice()%>">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 스펙</th>
		<td align=left>
		<select name="pspec">
		<%
			String [] spec = {"NORMAL","HIT","NEW","BEST"};
			for(int i=0;i<spec.length;i++){
				if(spec[i].equals(pbean.getPspec())){
					%><option value="<%=spec[i]%>" SELECTED><%=spec[i]%></option><%
				}else{
					%><option value="<%=spec[i]%>"><%=spec[i]%></option><%
				}
			}
		
		%></select>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 소개</th>
		<td align=left>
		<textarea name="pcontents" rows=5 cols=50 style="resize: none;"><%=pbean.getPcontents()%></textarea>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 포인트</th>
		<td align=left><input type=text name="point" value="<%=pbean.getPoint()%>"></td>
	</tr>
	<tr>	
		<td colspan=2 class="m1" align="center">
		<input type=submit value="상품 수정">
		<input type=reset value="취 소">
		</td>
	</tr>
</table>
</form>
	</td>
<%@include file="bottom.jsp"%>