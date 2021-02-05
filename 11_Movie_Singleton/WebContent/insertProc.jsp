<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>
<%-- <jsp:useBean id="dao" class="myPkg.MovieDao"></jsp:useBean> --%>
<jsp:useBean id="bean" class="myPkg.MovieBean"></jsp:useBean>
<%
	MovieDao dao = MovieDao.getInstance();
	System.out.println("insertProc : "+dao);
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="bean"/>
<%
	String [] reqg= request.getParameterValues("genre");
	
	String genre="";
	if(reqg==null){
		genre="없음";
	}else{
		for(int i =0;i<reqg.length;i++){
		genre += reqg[i]+" ";
	}
	}
	bean.setGenre(genre);
	int cnt = dao.insertData(bean);
	//System.out.println(cnt);
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
	else{
		response.sendRedirect("insertForm_ajax.jsp");
	}
%> 
