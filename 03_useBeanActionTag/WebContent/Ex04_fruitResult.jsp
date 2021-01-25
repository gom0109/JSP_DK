<%@page import="bean.FruitBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04_fruitResult.jsp<br>


<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String [] fruit = request.getParameterValues("fruit");
	out.print("이름: "+name+"<br>");
	out.print("과일: ");
	String temp="";
	for(int i=0;i<fruit.length;i++){
		temp = temp+fruit[i]+" ";
		out.print(fruit[i]+" ");
	}

%>
<hr>
<%
	FruitBean mb = new FruitBean();
	//default패키지에 클래스를 만들면 오류가난다.
	mb.setName(name);
	mb.setFruit(fruit);

%>

이름 : <%=mb.getName()%><br>
<%-- 과일 : <%=mb.getFruit()%><br><!-- 주소가 리턴됨 --> --%>
과일 : <%
	String [] gf = mb.getFruit();
	for(int i =0; i<gf.length;i++){
		out.print(gf[i]+" ");
	}
%>
<hr>

<jsp:useBean id="fb" class="bean.FruitBean"></jsp:useBean>
<jsp:setProperty property="*" name="fb"/>
이름 : <jsp:getProperty property="name" name="fb"/><br>
<%-- 과일 : <jsp:getProperty property="fruit" name="fb"/><br><!-- 주소가 리턴됨 --> --%>
과일 : <%
	String [] fgf = fb.getFruit();
	for(int i =0; i<fgf.length;i++){
		out.print(fgf[i]+" ");
	}
%>








