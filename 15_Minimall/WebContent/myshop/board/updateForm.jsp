<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDao dao = BoardDao.getInstance();
	BoardBean bean = dao.updateGetArticle(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<%@ include file="color.jsp"%>
<link rel="stylesheet" type="text/css" href="style.css"/>
<script type="text/javascript" src="script.js"></script>
<style type="text/css">
	body{
		text-align: center;
	}
	
	table {
		margin: auto;
		
	}
	
</style>
<script type="text/javascript" src="js/jquery.js"></script>

<body bgcolor="<%=bodyback_c%>"> 
	<b>글수정</b><br>
	<form method="post" name="updateForm" action="updateProc.jsp?pageNum=<%=pageNum%>">
	<input type="hidden" name="num" value="<%=num%>">
	
<table width="450" bgcolor="<%=bodyback_c%>">
	<tr>
		<td colspan="2" style="text-align: right;" bgcolor="<%=value_c%>"><a href="list.jsp?pageNum=<%=pageNum%>">글목록</a></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">이름</td>
		<td width="350"><input type="text" name="writer" maxlength="10" value="<%=bean.getWriter() %>"></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">제목</td>
		<td width="350"><input type="text" name="subject" maxlength="20" value="<%= bean.getSubject()%>"></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">Email</td>
		<td width="350"><input type="text" name="email" maxlength="10" value="<%= bean.getEmail()%>"></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">내용</td>
		<td width="350"><textarea name="content" rows="15" cols="50"><%= bean.getContent()%></textarea></td>
	</tr>
	<tr>
		<td width="100" align="center" bgcolor="<%=value_c%>">비밀번호</td>
		<td width="350"><input type="password" name="passwd" maxlength="10"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;" bgcolor="<%=value_c%>" height="30">
			<input type="submit" value="글수정" onclick="return writeSave()">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
</form>
</body>