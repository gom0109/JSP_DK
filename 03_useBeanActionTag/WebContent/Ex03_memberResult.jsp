<%@page import="bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex03_memberResult.jsp<br>


<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String [] hobby = request.getParameterValues("hobby");
	out.print("이름: "+name+"<br>");
	out.print("취미: ");
	String temp="";
	for(int i=0;i<hobby.length;i++){
		temp = temp+hobby[i]+" ";
		out.print(hobby[i]+" ");
	}

%>
<hr>
자바 객체 생성 ,setter, getter<br>
<%
	MemberBean mb = new MemberBean();
	//default패키지에 클래스를 만들면 오류가난다.
	mb.setName(name);
	mb.setHobby(temp);

%>

이름 : <%=mb.getName()%><br>
취미 : <%=mb.getHobby()%>
<hr>
usebean 객체생성 ,setProperty,getProperty<br>
<jsp:useBean id="mb2" class="MemberBean"></jsp:useBean>
<jsp:setProperty property="name" name="mb2" param="name"/>
<%-- <jsp:setProperty property="hobby" name="mb2" param="hobby"/> --%>
<%
	mb2.setHobby(temp);
%>
이름 : <jsp:getProperty property="name" name="mb2"/><br>
취미 : <%=mb2.getHobby() %><br>




