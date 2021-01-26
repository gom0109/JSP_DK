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


select.jsp<br>
<table>
	<tr>
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
			<td><%= mid%></td>
			<td><%= name%></td>
			<td><%= did%></td>
			<td><%= salary%></td>
			<td><a href="updateForm.jsp?mid=<%=mid %>">수정</a></td>
			<td><a href="#">삭제</a></td>
		</tr>
		<%
	}
%>
</table>
<br>
<a href="insertForm.jsp">삽입</a>
