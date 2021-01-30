<%@page import="DTO.BookDao"%>
<%@page import="DTO.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>


<%
	request.setCharacterEncoding("UTF-8");
	BookDao dao = new BookDao();
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.println(no);
	String[] bookstore = { "교보문고", "알라딘", "yes24", "인터파크" };
	String[] kind = { "유료", "무료" };
		BookBean bean = dao.getBookByNo(no);
		String gbs = bean.getBookstore();
	
		 
		
%>

<h1>도서 정보 입력</h1>
<form name="myform" action="updateProc.jsp" method="post">
	<table border=1>
	<input type="hidden" name="no" value="<%=bean.getNo()%>"/>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=bean.getTitle() %>"></td>
		</tr>
		<tr>
			<td>저자</td>
			<td><input type="text" name="author" value="<%=bean.getAuthor()%>"></td>
		</tr>
		<tr>
			<td>출판사</td>
			<td><input type="text" name="publisher" value="<%=bean.getPublisher()%>"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price" value="<%=bean.getPrice()%>"></td>
		</tr>
		<tr>
			<td>입고일</td>
			<td><input type="date" name="buy" value="<%=bean.getBuy()%>"></td>
		</tr>

		<tr>
			<td>배송비</td>
			<td>
				<%
					for (int i = 0; i < kind.length; i++) {
						if(kind[i].equals(bean.getKind())){
							%><%=kind[i]%><input type="radio" name="kind" value="<%=kind[i]%>" checked="checked"><%
						}
						else{
							%><%=kind[i]%><input type="radio" name="kind" value="<%=kind[i]%>">  <%
						}
				
				}
				%> <!-- 유료 <input type="radio" name="kind" value="유료"> 
				무료 <input type="radio" name="kind" value="무료"> -->
			</td>
		</tr>
		<tr>
			<td>구입가능 서점</td>
			<td>
				<!-- 교보문고 <input type="checkbox" name="bookstore" value="kyobo">
					알라딘 <input type="checkbox" name="bookstore" value="aladin">
					yes24 <input type="checkbox" name="bookstore" value="yes24">
					인터파크 <input type="checkbox" name="bookstore" value="interpark"> -->
					<%
					for (int i = 0; i < bookstore.length; i++) {
						if(gbs.contains(bookstore[i])){
							%><%=bookstore[i]%><input type="checkbox" name="bookstore" value="<%=bookstore[i]%>" checked="checked"><%
						}
						else{
							%><%=bookstore[i]%><input type="checkbox" name="bookstore" value="<%=bookstore[i]%>"> <%
						}
				
					}
				%>
				

			</td>
		</tr>
		<tr>
			<td>보유수량</td>
			<td><select name="count">
			
				<%
					for (int i = 1; i <=5; i++) {
						if(i==bean.getCount()){
							%><option value="<%=i%>" selected="selected"><%=i%><%
						}
						else{
							%><option value="<%=i%>"><%=i%> <%
						}
				
					}
				%>					
			</select></td>
		</tr>

	</table>
	<br> <input type="submit" value="전송"> <input type="reset"
		value="취소">
</form>
