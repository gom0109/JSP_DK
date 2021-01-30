<%@page import="myPkg.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp
<style type="text/css">
	th{
		background-color: yellow;
	}
	
</style>
<script type="text/javascript">
	function insert(){
		location.href="insertForm.jsp";
		
	}
	function checkAll(){
		var ac = document.getElementsByName("allchcek");
		var cone = document.getElementsByName("chcekone");
		if(ac[0].checked){
			for(i=0;i<cone.length;i++){
				cone[i].checked = true;
			}
			
		}else{
			for(i=0;i<cone.length;i++){
				cone[i].checked = false;
			}
		}
		
	}
	function delMethod(){
		flag = false;
		var cone = document.getElementsByName("chcekone");
		for(i=0;i<cone.length;i++){
			if(cone[i].checked == true){
				flag=true;
			}
			
		}if(flag==false){
			alert("삭제할 항목을 최소 한개이상 선택해야 합니다")
			return
		}
		
		document.myform.submit();
				
		
	}
	
</script>

<jsp:useBean id="dao" class="myPkg.StudentDao"></jsp:useBean><!-- 객체를 생성하면 StudentDao로 이동하여 생성자를 실행한다 -->
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<StudentBean> list = dao.selectall();
	
%>

<form name="myform" action="deleteAll.jsp" method="post">
<table border="1">
	<tr>
		<th><input type="checkbox" name="allchcek" onclick="checkAll()"> </th>
		<th>번호</th>
		<th>아이디</th>
		<th>비번</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>취미</th>
		<th>C언어</th>
		<th>JAVA</th>
		<th>JSP</th>
		<th>합계</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			StudentBean bean = list.get(i);
			%>
				<tr>
					<td><input type="checkbox" name="chcekone" value="<%=bean.getNum() %>"> </td>
					<td><%=bean.getNum() %></td>
					<td><%=bean.getId() %></td>
					<td><%= bean.getPasswd()%></td>
					<td><%=bean.getName() %></td>
					<td><%=bean.getYear()+"-"+bean.getMonth()+"-"+bean.getDay() %></td>
					<td><%=bean.getHobby() %></td>
					<td><%=bean.getC() %></td>
					<td><%=bean.getJava() %></td>
					<td><%=bean.getJsp() %></td>
					<td><%=bean.getSum() %></td>
					<td><a href="updateForm.jsp?num=<%=bean.getNum()%>">수정</a></td>
					<td><a href="deleteProc.jsp?num=<%=bean.getNum()%>">삭제</a></td>
					
				</tr>
			
			<%
		}
	
	%>
</table>
<input type="button" value="삽입" onclick="insert()">
<input type="button" value="삭제" onclick="delMethod()">
</form>

