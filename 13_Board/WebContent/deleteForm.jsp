<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteForm.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));

%>
<style type="text/css">
	body{
		text-align: center;
	}
</style>
<script type="text/javascript">
function delcheck(){
	if(document.delForm.passwd.value==""){
		alert("비밀번호를 입력하세요");
		document.delForm.passwd.focus();
		return false;
	}
}
</script>

<%@ include file="color.jsp"%>
<link rel="stylesheet" type="text/css" href="style.css"/>
<body bgcolor="<%=bodyback_c%>">
<b>글삭제</b>
<form action="deleteProc.jsp?pageNum=<%=pageNum%>" method="post" name="delForm">
<table align = "center" width="360">
	<tr height="30">
		<td align = "center" bgcolor="<%=value_c%>">비밀번호를 입력해 주세요</td>
	</tr>
	<tr height="30">
		<td align = "center" >비밀번호 : <input type="password" name="passwd" size="8" maxlength="12">
			<input type="hidden" name="num" value="<%=num%>">
			</td>
	</tr>
	<tr height="30">
		<td align = "center" bgcolor="<%=value_c%>"><input type="submit" value="글삭제" onclick="return delcheck()">
			<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
	</tr>


</table>
</form>
</body>