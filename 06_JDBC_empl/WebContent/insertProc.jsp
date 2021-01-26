<%@page import="myPkg.EmplBean"%>
<%@page import="myPkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>


<%		
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myPkg.EmplDao"></jsp:useBean>
<jsp:useBean id="bean" class="myPkg.EmplBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
	//String name = request.getParameter("name");
	//int did = Integer.parseInt(request.getParameter("did"));
	//int salary = Integer.parseInt(request.getParameter("salary"));
	/* EmplBean// bean = new EmplBean(0,name, did, salary); */
	String msg;
	String url;
	int count = dao.insertData(bean);
	if(count >0){
		msg = "삽입성공";
		url = "select.jsp";
		%>
		
		
		<!-- 삽입성공 <br>
		<meta http-equiv="refresh" content="2;url=select.jsp"> -->
		<%
	}else{
		msg = "삽입실패";
		url = "insertForm.jsp";
		%>
		<!-- 삽입실패 <br>
		<meta http-equiv="refresh" content="2;url=insertForm.jsp"> -->
		<%
	}

%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = '<%=url%>';
</script>