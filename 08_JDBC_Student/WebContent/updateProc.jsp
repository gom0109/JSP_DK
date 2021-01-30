<%@page import="myPkg.StudentDao"%>
<%@page import="myPkg.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp

<%
	request.setCharacterEncoding("UTF-8");
	
	StudentDao dao = new StudentDao();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	
	String [] hby = request.getParameterValues("hobby");
	String hobby = "";
	for(int i=0;i<hby.length;i++){
		hobby += hby[i]+" "; 
	}
	out.print(hobby);
	int c = Integer.parseInt(request.getParameter("c"));
	int java = Integer.parseInt(request.getParameter("java"));
	int jsp = Integer.parseInt(request.getParameter("jsp"));
	int sum = c+java+jsp;
	
	
	
	StudentBean bean = new StudentBean(num,id,passwd,name,year,month,day,hobby,c,java,jsp,sum);
	
	int cnt = dao.updateData(bean);
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("updateForm.jsp?num="+bean.getNum());
	}
	
%>