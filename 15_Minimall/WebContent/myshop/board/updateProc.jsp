<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
%>
<jsp:useBean id="bean" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
	BoardDao dao = BoardDao.getInstance();
	int cnt = dao.updateArticle(bean);
	if(cnt>0){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}else{
		%>
		<script type="text/javascript">
			alert("수정실패");
			<%-- location.href="updateForm.jsp?num=<%=bean.getNum()%>"; --%>
			history.back();
			/* history.go(-1); */
		</script>
		
		<%
		//response.sendRedirect("updateForm.jsp?num="+bean.getNum());
	}
%>