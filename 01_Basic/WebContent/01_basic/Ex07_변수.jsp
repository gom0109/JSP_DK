<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <!-- 지시문 -->
	
<% String id="park";
	String name = "박찬호";
	String comment = "주석문";
%><!-- 지역변수 -->	
<%!String id = "kim";//전역변수
	String name = "김연아";//전역변수는 기본값으로 null이 들어간다. 지역변수는 아니다.

	public String getId() {
		return id;
	}%> <!-- 선언문 -->
	
<%=getId() %> <!-- 표현식 --><br>
name = <%= name%> <!-- 지역변수의 우선순위가 더 높다 --><br>

comment1 : <%=comment%><br>
comment2 : <%-- <%=comment%> --%><br> <!-- jsp주석 페이지소스보기에서 안보인다-->
comment3 : <!-- <%=comment%><br> --> <!-- html주석 페이지 소스보기에서 보인다-->