<%@page import="myPkg.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex01_result.jsp
<br>

<%
	request.setCharacterEncoding("UTF-8");
String message = request.getParameter("message");
SimpleBean sb = new SimpleBean();
sb.setMsg(message);
String msg = sb.getMsg();
System.out.println("-------------");
%>

message :
<%=message%><br>
msg :
<%=msg%>

<hr>

<!-- useBean 액션태그를 사용해서 객체를 만들때는 패키지이름을 적어야한다 -->
<!-- SimpleBean ubsb = new SimpleBean(message); 아래와 같은코드 -->
객체생성 :<jsp:useBean id="sb2" class="myPkg.SimpleBean" /><br>
<!-- sb.setMsg(message); 를 대신한다.setProperty=set property=msg는 소문자로 적는다.-->
<!-- param 에는 form에서 넘어오는 name과 같아야한다. -->
setMsg : <jsp:setProperty property="msg" name="sb2" param="message"/><br>
<!-- value는 고정된값을 사용할때 사용 -->
<%-- setMsg : <jsp:setProperty property="msg" name="sb2" value="가나다라"/><br> --%>
getMsg : <jsp:getProperty property="msg" name="sb2"/><br>









