<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="dao" class="myPkg.MovieDao"></jsp:useBean> --%>
<%
	MovieDao dao = MovieDao.getInstance();
	System.out.println("id_check_proc : "+dao);
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");/* userid에 담겨 넘어오는 값을 받음 */
	
	boolean isCheck = dao.searchId(userid);
	String str = "";
	if(isCheck == true){
		str = "NO";
		out.print(str);
		//ajax함수로 넘어왔을때는 웹브라우저 출력이아닌 ajax로 응답을 의미
	}
	else{
		str = "YES";
		out.print(str);
	}

%>