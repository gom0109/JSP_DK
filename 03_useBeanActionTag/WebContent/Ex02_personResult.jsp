<%@page import="bean.PersonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_personResult.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	
%>
이름 : <%=name %><br>
나이 : <%=age %><br>
주소 : <%=address %><br>
전화번호 : <%=tel %><br>
<hr>

<%
	PersonBean bean = new PersonBean();
	bean.setName(name);
	bean.setAge(age);
	bean.setAddress(address);
	bean.setTel(tel);
	
	String bname = bean.getName();
	int bage = bean.getAge();
	String baddress = bean.getAddress();
	String btel = bean.getTel();
	
%>
이름2 : <%=bname %><br>
나이2 : <%=bage %><br>
주소2 : <%=baddress %><br>
전화번호2 : <%=btel %><br>
<hr>
<jsp:useBean id="bean3" class="bean.PersonBean"></jsp:useBean>

<%
/* 객체는 액션테그로 만들고 setter getter 는 자바코드로 작성가능 */
bean3.setName(name);
bean3.setAge(age);
bean3.setAddress(address);
bean3.setTel(tel);
String bname3 = bean3.getName();
int bage3 = bean3.getAge();
String baddress3 = bean3.getAddress();
String btel3 = bean3.getTel();
%>
이름3 : <%=bname3 %><br>
나이3 : <%=bage3 %><br>
주소3 : <%=baddress3 %><br>
전화번호3 : <%=btel3 %><br>
<hr>
<jsp:useBean id="bean4" class="bean.PersonBean"></jsp:useBean>
<!-- sb.setMsg(message); 를 대신한다.setProperty=set property=name는 소문자로 적는다.-->
<!-- form에서 넘어오는 name과 bean의 변수이름이 같을때 param생략 가능!!! -->
<!-- property와 param이 같을때 param생략가능!!! -->
<%-- <jsp:setProperty property="name" name="bean4"/>
<jsp:setProperty property="age" name="bean4" param="age"/>
<jsp:setProperty property="address" name="bean4" param="address"/>
<jsp:setProperty property="tel" name="bean4" param="tel"/> --%>
<jsp:setProperty property="*" name="bean4"/>

<!-- sb.getMsg(message); 를 대신한다.getProperty=get property=name는 소문자로 적는다.-->
<jsp:getProperty property="name" name="bean4"/><br>
<jsp:getProperty property="age" name="bean4"/><br>
<jsp:getProperty property="address" name="bean4"/><br>
<jsp:getProperty property="tel" name="bean4"/><br>
















