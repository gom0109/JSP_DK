<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%! //메소드를 정의함으로 선언문을 사용한다.
	int multiply(int x, int y){
		 return x*y;
	}
%>
<%= multiply(10,25) %> <!-- 표현식 -->
