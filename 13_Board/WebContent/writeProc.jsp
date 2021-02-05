<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writeProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="bean" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/> <!-- writeForm에서 넘어오는 5개의stter method만 호출됨 -->
<%
	BoardDao dao = BoardDao.getInstance();
	bean.setReg_date(new Timestamp(System.currentTimeMillis()));//시간을 가져옴
	bean.setIp(request.getRemoteAddr());//실행한쪽의 아이피주소 가져옴

	int cnt = dao.insertArticle(bean);
	
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
	else{
		response.sendRedirect("writeForm.jsp");
	}
%>