<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<script type="text/javascript"> 
/* 바디안에쓰는건 html코드이나 자바스크립트 코드로 인식시키기위해 적는다 */
document.write("hello<br>");//자바스크립트 코드

</script>

가나다 <!-- html -->
<br>
String name =  "hello"; <!-- 자바코드 하지만 html코드로 나온다. -->
<%//자바코드로 인식하게 하기위해 이렇게적는다
String name =  "hello";
%>
<br>
<b>저의 이름은 <%=name %>입니다</b> <%-- 자바코드를 불러오지못하므로 <%= %>를적어 불러오도록한다 --%> 
<br>
<% int age=30; %>
<b>저의 나이는 <%= age %>살 입니다</b>
<br>
<% int height = 168; %>
저의 키는 <%=height %>cm 입니다.

<%-- 
<% %>:scriptlet java코드를 html안에 jsp코드로쓸때사용
<%= %>:표현식 변수출력, 메소드호출
<%@ %>지시어 page,include, taglib import
<%! %>선언문 전역변수 메소드 선언
:주석
 --%>

 </body>
</html>
