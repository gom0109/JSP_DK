<%@page import="bean.BookBean_김동욱"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex06_내이름_result.jsp
<br>

자바객체
<br>
<%
	request.setCharacterEncoding("UTF-8");

BookBean_김동욱 bean = new BookBean_김동욱();
bean.setTitle(request.getParameter("title"));
bean.setAuthor(request.getParameter("author"));
bean.setPublisher(request.getParameter("publisher"));
bean.setPrice(request.getParameter("price"));
bean.setDate(request.getParameter("date"));
bean.setKind(request.getParameter("kind"));
bean.setBookstore(request.getParameterValues("bookstore"));
bean.setCount(request.getParameter("count"));
%>

<table border=1>
	<tr>
		<td>제목</td>
		<td><%=bean.getTitle()%></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><%=bean.getAuthor()%></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><%=bean.getPublisher()%></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><%=bean.getPrice()%></td>
	</tr>
	<tr>
		<td>입고일</td>
		<td><%=bean.getDate()%></td>
	</tr>

	<tr>
		<td>배송비</td>
		<td><%=bean.getKind()%></td>
	</tr>
	<tr>
		<td>구입가능 서점</td>
		<td>
			<%
				String[] store = bean.getBookstore();
			for (int i = 0; i < store.length; i++) {
				out.print(store[i] + " ");
			}
			%>
		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td><%=bean.getCount()%></td>
	</tr>

</table>


<hr>

useBean객체<br>
<jsp:useBean id="ub" class="bean.BookBean_김동욱"></jsp:useBean>
<jsp:setProperty property="*" name="ub"/>
<table border=1>
	<tr>
		<td>제목</td>
		<td><jsp:getProperty property="title" name="ub"/></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><jsp:getProperty property="author" name="ub"/></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><jsp:getProperty property="publisher" name="ub"/></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><jsp:getProperty property="price" name="ub"/></td>
	</tr>
	<tr>
		<td>입고일</td>
		<td><jsp:getProperty property="date" name="ub"/></td>
	</tr>

	<tr>
		<td>배송비</td>
		<td><jsp:getProperty property="kind" name="ub"/></td>
	</tr>
	<tr>
		<td>구입가능 서점</td>
		<td>
			<%
				String[] ubstore = ub.getBookstore();
			for (int i = 0; i < ubstore.length; i++) {
				out.print(ubstore[i] + " ");
			}
			%>
		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td><jsp:getProperty property="count" name="ub"/></td>
	</tr>

</table>









