<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
<% %>:scriptlet java코드를 html안에 jsp코드로쓸때사용
<%= %>:표현식 변수출력, 메소드호출
<%@ %>지시어 page,include, taglib import
<%! %>선언문 전역변수 메소드 선언
:주석
 --%>
<!--  1~10사이 정수 난수 (10-1+1) 시작값 -->

<%
	int count = 1;
while (count <= 20) {
	int x = (int) (Math.random() * 10) + 1;
	if (x == 7) {
		out.print("count: "+count+"\n");
		out.print("x: "+x);
		break;

	}
	count++;
}
%>


<%
	count = 1;
while (count <= 20) {
	int x = (int) (Math.random() * 10) + 1;
	
		%>
		<br>
		count : 
		<%=count %>
		<br>
		x : 
		<%=x %>
		<%
		if (x == 7) {
		break;

	}
	count++;
}
%>

