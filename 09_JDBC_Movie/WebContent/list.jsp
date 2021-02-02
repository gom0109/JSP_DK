<%@page import="myPkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp<br>

<style type="text/css">
	th{
		background-color: yellow;
	}
	th,td{
		padding: 5px
	}
	table{
		text-align: center;
	}
</style>

<script type="text/javascript">
	function insert(){
		location.href="insertForm.jsp"
	}
	
	function allcheck() {
		call = document.getElementsByName("call");
		cone = document.getElementsByName("checkone");
		if(call[0].checked){
			for(i=0;i<cone.length;i++){
				cone[i].checked=true;
			}
		}else{
			for(i=0;i<cone.length;i++){
				cone[i].checked=false;
			}
		}
	}
	function checkedDelete(){
		flag =false;
		cone = document.getElementsByName("checkone");
		for(i=0;i<cone.length;i++){
			if(cone[i].checked){
				flag=true;
			}
		}
		if(flag==false){
			alert("삭제할 데이터를 최소 하나 선택해주세요");
			return;
		}
		document.myform.submit();
	}
</script>

<%
	MovieDao dao = new MovieDao();
	ArrayList<MovieBean> list = dao.selectAll();
%>
<form method="post" name="myform" action="checkedDelete.jsp">
<input type="button" value="삭제" onclick="checkedDelete()">
<input type="button" value="추가" onclick="insert()">
<table border="1">
	<tr>
		<th><input type="checkbox" name="call" onclick="allcheck()"> </th>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>나이</th>
		<th>좋아하는 장르</th>
		<th>즐겨보는 시간대</th>
		<th>동반관객수</th>
		<th>개선사항</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
		for(int i =0;i<list.size();i++){
			MovieBean bean = list.get(i);
			%>
				<tr>
					<td><input type="checkbox" name="checkone" value="<%=bean.getNum()%>"></td>
					<td><%=bean.getNum() %></td>
					<td><%=bean.getId()%></td>
					<td><%=bean.getName() %></td>
					<td><%=bean.getAge() %></td>
					<td><%=bean.getGenre() %></td>
					<td><%=bean.getTime() %></td>
					<td><%=bean.getPartner()%></td>
					<td><%=bean.getMemo() %></td>
					<td><a href="updateFrom.jsp?num=<%=bean.getNum()%>">수정</a></td>
					<td><a href="deleteProc.jsp?num=<%=bean.getNum()%>">삭제</a></td>
				</tr>
			<%
		}
	%>
</table>
</form>