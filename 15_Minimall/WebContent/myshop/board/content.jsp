<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
content.jsp<br>
<%@ include file="color.jsp"%>
<link rel="stylesheet" type="text/css" href="style.css"/>
<style type="text/css">
	body{
		text-align: center;
	}
	
	table {
		margin: auto;
		text-align: center;
		
	}
	
</style>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	//System.out.println(pageNum);
	BoardDao dao = BoardDao.getInstance();
	BoardBean bean = dao.getArticle(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int ref =bean.getRef();
	int re_step = bean.getRe_step();
	int re_level = bean.getRe_level();
	//System.out.println("content "+num+","+ref+","+re_step+","+re_level );
%>

<body bgcolor="<%=bodyback_c %>">
	<b>글내용 보기</b>
<table width = "700" height = "200">
	<tr>
		<td bgcolor="<%=value_c%>" width = "25%">글번호</td>
		<td width = "25%"><%=bean.getNum() %></td>
		<td bgcolor="<%=value_c%>" width = "25%">조회수</td>
		<td width = "25%"><%=bean.getReadcount() %></td>
	</tr>
	<tr>
		<td bgcolor="<%=value_c%>" >작성자</td>
		<td><%=bean.getWriter() %></td>
		<td bgcolor="<%=value_c%>">작성일</td>
		<td><%=sdf.format(bean.getReg_date()) %></td>
	</tr>
	<tr>
		<td bgcolor="<%=value_c%>">글제목</td>
		<td colspan="3" align="left"><%=bean.getSubject() %></td>
	</tr>
	<tr>
		<td bgcolor="<%=value_c%>">글내용</td>
		<td colspan="3" ><%=bean.getContent() %></td>
	</tr>
	<tr>		
		<td colspan="4" bgcolor="<%=value_c%>" align="right">
			<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%= bean.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%= bean.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="답글쓰기" onclick="location.href='replyForm.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
			<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>



</table>
</body>
