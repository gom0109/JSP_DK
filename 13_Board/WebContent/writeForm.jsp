<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writeForm.jsp<br>
<%@ include file="color.jsp"%>
<link rel="stylesheet" type="text/css" href="style.css"/>
<style type="text/css">
	body{
		text-align: center;
	}
	
	table {
		margin: auto;
		
	}
	
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>

<body bgcolor="<%=bodyback_c%>"> 
	<b>글쓰기</b><br>
	<form method="post" name="writeForm" action="writeProc.jsp">
	
<table width="450" bgcolor="<%=bodyback_c%>">
	<tr>
		<td colspan="2" style="text-align: right;" bgcolor="<%=value_c%>"><a href="list.jsp">글목록</a></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">이름</td>
		<td width="350"><input type="text" name="writer" maxlength="10" value="홍길동"></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">제목</td>
		<td width="350"><input type="text" name="subject" maxlength="20" value="어떤글"></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">Email</td>
		<td width="350"><input type="text" name="email" maxlength="10" value="aa@xx.com"></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">내용</td>
		<td width="350"><textarea name="content" rows="15" cols="50">호호호</textarea></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">비밀번호</td>
		<td width="350"><input type="password" name="passwd" maxlength="10" value="1234"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;" bgcolor="<%=value_c%>" height="30">
			<input type="submit" value="글쓰기" onclick="return writeSave()">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="location.href='list.jsp'">
		</td>
	</tr>
</table>
</form>
</body>