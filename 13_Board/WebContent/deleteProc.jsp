<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDao dao =  BoardDao.getInstance();
	int cnt = dao.deleteArticle(num,passwd);
	if(cnt>0){
		int pageSize = 10;
		int recordCount = dao.getArticleCount();
		int pageCount = recordCount/pageSize+ (recordCount%pageSize == 0 ? 0 : 1);
		
		if(pageNum>pageCount){
			pageNum=pageCount;
		}	
		
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}
	else{
		%>
		<script type="text/javascript">
			location.href="deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
			alert("삭제실패");
		
		</script>
		
		
		<%
	}
	
%>