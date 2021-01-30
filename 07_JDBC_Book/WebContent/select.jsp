<%@page import="DTO.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
select.jsp
<br>
<jsp:useBean id="dao" class="DTO.BookDao"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<BookBean> list = dao.selectAll();
	
%>
<style type="text/css">
	table {
		text-align: center;
		margin: auto;
		
	}
	th{
		background-color: yellow;
	}
</style>

<script type="text/javascript">
	function allDelete(obj){
		var chkobj =document.getElementsByName("rowcheck");
		var check = obj.checked
		if(check==true){
			for(i=0;i<chkobj.length;i++){
				chkobj[i].checked = true;
			}
			
		}else{
			for(i=0;i<chkobj.length;i++){
				chkobj[i].checked = false;
			}
		}
		
	}
	function insert() {
		location.href="insertForm.jsp";
	}
	function selectDelete(){
		flag = false;
		var chkobj =document.getElementsByName("rowcheck");
		for(i=0;i<chkobj.length;i++){
			if(chkobj[i].checked){
				flag = true;
			}
		}
		if(flag == false){
			alert("최소 한개는 선택해야합니다")
			return;
		}
		
		document.myform.submit();
	}

</script>
<form name="myform" method="post" action="deleteAll.jsp"> <%-- <%=bean.getNo() %>를 rowcheck에 담아 넘기기위해 form사용 --%>
<input type="button" value="삭제" onclick="selectDelete()"/>
<input type="button" value="추가" onclick="insert()"/>
<table border="1">
	<tr>
		<th><input type="checkbox" name="allcheck" onclick="allDelete(this)"></th>
		<th>번호</th>
		<th>제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>가격</th>
		<th>입고일</th>
		<th>배송비</th>
		<th>구입 가능 서점</th>
		<th>보유 수량</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
		for (int i = 0; i < list.size(); i++) {
			BookBean bean = list.get(i);
	%>
	<tr>
		<td><input type="checkbox" name="rowcheck" value="<%=bean.getNo() %>"></td>
		<td><%=bean.getNo() %></td>
		<td><%=bean.getTitle()%></td>
		<td><%=bean.getAuthor() %></td>
		<td><%=bean.getPublisher()%></td>
		<td><%=bean.getPrice()%></td>
		<td><%=bean.getBuy()%></td>
		<td><%=bean.getKind()%></td>
		<td><%=bean.getBookstore()%></td>
		<td><%=bean.getCount()%></td>
		<td><a href="updateForm.jsp?no=<%=bean.getNo()%>">수정</a></td>
		<td><a href="deleteProc.jsp?no=<%=bean.getNo()%>">삭제</a></td>
	</tr>
	<%
		}
	%>
</table>
</form>
<!-- <a href="insertForm.jsp">삽입</a> -->