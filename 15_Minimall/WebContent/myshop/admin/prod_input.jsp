<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="top.jsp"%>
	<td colspan="6" align="center">
		<form name="f" action="prod_inputproc.jsp" method="post" enctype="multipart/form-data">
<table border=0 class=outline width="600">
<CAPTION ALIGN="TOP"><b>상품등록카테고리</b></CAPTION>
	<tr>
		<th class="m2">카테고리</th>
		<td align=left>
		<select name="pcategory_fk">
			
			<%
				CategoryDao cdao = CategoryDao.getInstance();
				ArrayList<CategoryBean> list = cdao.getAllCategory();
				if(list.size()==0){
					%>
					<option value="">카테고리 없음
					<%
				}else{
					for(int i=0;i<list.size();i++){
					CategoryBean bean =  list.get(i);
					%>
						<option value="<%=bean.getCode()%>"><%=bean.getCname()+" ["+bean.getCode()+"]"%>
					<%
					
					}
				}
				
			%>
		
		</select>
		</td>
	</tr>
	<tr>
		<th class="m2">상품명</th>
		<td align=left>
		<input type=text name="pname" value="이름">
		</td>
	</tr>
	<tr>
		<th class="m2">상품코드</th>
		<td align=left>
		<input type=text name="pcode" value="이름">
		<!-- pcode는 bean에도 없고, 테이블에도 없다.
		카테고리 코드(code)와 pcode에 작성하는 내용을 더해서 pcategory_fk에 넣을것이다. -->
		</td>
	</tr>
	<tr>
		<th class="m2">제조회사</th>
		<td align=left>
		<input type=text name="pcompany" value="이름">
		</td>
	</tr>
	<tr>
		<th class="m2">상품이미지</th>
		<td align=left>
		<input type=file name="pimage">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 수량</th>
		<td align=left>
		<input type=text name="pqty" maxlength=8 value="3">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 가격</th>
		<td align=left>
		<input type=text name="price" maxlength=8 value="100">
		</td>
	</tr>
	<tr>
		<th class="m2">상품 스펙</th>
		<td align=left>
			<select name="pspec">
			<option value="NORMAL" SELECTED>::NORMAL::</option>
			<option value="HIT">HIT</option>
			<option value="NEW">NEW</option>
			<option value="BEST">BEST</option>
			</select>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 소개</th>
		<td align=left>
		<textarea name="pcontents" rows=5 cols=50 style="resize: none;">설명</textarea>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 포인트</th>
		<td align=left><input type=text name="point" value="222"></td>
	</tr>
	<tr>	
		<td colspan=2 class="m1" align="center">
		<input type=submit value="상품 등록">
		<input type=reset value="취 소">
		</td>
	</tr>
</table>
</form>
	</td>
<%@include file="bottom.jsp"%>