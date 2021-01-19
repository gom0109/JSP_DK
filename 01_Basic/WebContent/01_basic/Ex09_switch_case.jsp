<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int a = 123;
int x = a % 2;
switch (x) {
case 0:
	out.print("짝수입니다");
	break;
case 1:
	out.print("홀수입니다");
	break;
}
%>
<br><br>
<% String str ="apple";
	switch(str){
	case "apple" : out.print("사과");
		break;
	case "grape" : out.print("포도");
	break;
	default : out.print("그밖의 과일");
	break;
	
	}

%>