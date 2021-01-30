<%@page import="myPkg.EmplBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	th{
		background-color: yellow;
		width: 80px;
		border: 1px solid black; 
	}
	td{
		border: 1px solid black; 
	}
	table{
		
		height: 80px;
		text-align: center;
		border: 2px solid blue;
	}
</style>
<jsp:useBean id="dao" class="myPkg.EmplDao"></jsp:useBean>
<script type="text/javascript">
	
function allDelete(){
	var chkobj =document.getElementsByName("rowcheck");/* 배열 */
	var check = document.getElementsByName("checkAll");/* 배열 */
	if(check[0].checked==true){
		for(i=0;i<chkobj.length;i++){
			chkobj[i].checked = true;
		}
		
	}else{
		for(i=0;i<chkobj.length;i++){
			chkobj[i].checked = false;
		}
	}
	
}function insert() {
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

select.jsp<br>

<form name="myform" method="post" action="deleteAll.jsp">
<input type="button" value="삭제" onclick="selectDelete()">
<input type="button" value="추가" onclick="insert()">
<table>
	<tr>
		<th><input type="checkbox" name="checkAll" onclick="allDelete()"></th>
		<th>아이디</th>
		<th>이름</th>
		<th>부서번호</th>
		<th>급여</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
<%
	/* EmplDao dao = new EmplDao(); */
	ArrayList<EmplBean> list = dao.getAllEmpls();
	for (int i=0; i<list.size();i++){
		EmplBean bean = list.get(i);
		int mid = bean.getMid();
		String name = bean.getName();
		int did = bean.getDid();
		int salary = bean.getSalary();
		%>
		
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%=mid%>"></td>
			<td><%= mid%></td>
			<td><%= name%></td>
			<td><%= did%></td>
			<td><%= salary%></td>
			<td><a href="updateForm.jsp?mid=<%=mid %>">수정</a></td>
			<td><a href="deleteProc.jsp?mid=<%=mid %>">삭제</a></td>
		</tr>
		<%
	}
%>
</table>
</form>
<!-- <a href="insertForm.jsp">삽입</a> -->
