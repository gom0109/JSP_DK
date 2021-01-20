<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_main.jsp<br>

include 전 name값  : <%=request.getParameter("name") %>
<hr>
	<jsp:include page="Ex01_sub.jsp">
		<jsp:param name="name" value="kim"></jsp:param>
		<!-- name에 kim이 담겨서 EX01_sub.jsp로 넘어간다 --> 
		<!-- 넘어가서 실행된 결과가 다시 넘어온다 -->
	</jsp:include>

<hr>
include 후 name값  : <%=request.getParameter("name") %>