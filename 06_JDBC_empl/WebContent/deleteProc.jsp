<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
<jsp:useBean id="dao" class="myPkg.EmplDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	int mid = Integer.parseInt(request.getParameter("mid"));
	int count = dao.deleteData(mid);
	String msg;
	String url;
	System.out.println(count);
	if(count>0){
		msg="삭제 성공";
		url = "select.jsp";
	}
	else{
		msg="삭제 실패";
		url = "select.jsp";		
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = '<%=url%>';
</script>