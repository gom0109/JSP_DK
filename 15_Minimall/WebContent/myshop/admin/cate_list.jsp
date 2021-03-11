<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="my.shop.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="top.jsp"%>
<td colspan="6" align="center" valign="top">
		<table border="1" width=500>
			<caption><b>카테고리 목록</b></caption>
			<tr bgcolor="yellow">
				<th>번호</th>
				<th>카테고리 코드</th>
				<th>카테고리 이름</th>
				<th>삭제</th>
			</tr>
			<%	
				CategoryDao cdao = CategoryDao.getInstance();
				ArrayList<CategoryBean> list = cdao.getAllCategory();
				if(list.size() == 0){
					out.print("<tr><td colspan='4' align='center'>등록된 카테고리 데이터가 없습니다.</td></tr>");
				}else{
					for(int i=0;i<list.size();i++){
					CategoryBean cbean =  list.get(i);
					%>
						<tr>
							<td><%=cbean.getCnum() %></td>
							<td><%=cbean.getCode() %></td>
							<td><%=cbean.getCname()%></td>
							<td><a href="cate_delete.jsp?cnum=<%= cbean.getCnum()%>">삭제</a></td>
						</tr>
						
					
					<%
					}
				}
			%>
			
			
		
		</table>
		
		
		
	</td>
<%@include file="bottom.jsp"%>