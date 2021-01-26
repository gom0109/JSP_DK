<%@page import="myPkg.EmplBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

updateForm.jsp
<br>

<jsp:useBean id="dao" class="myPkg.EmplDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
int mid = Integer.parseInt(request.getParameter("mid"));
//out.print(mid); 
EmplBean bean = dao.getEmpleByMid(mid);
int bmid = bean.getMid();
String bname = bean.getName();
int bdid = bean.getDid();
int bsalary = bean.getSalary();
%>
<%-- <%=bmid %><br>
<%=bname %><br>
<%=bdid %><br>
<%=bsalary %><br>
 --%>

</head>
<body>
	<h2>회원가입</h2>
	<form action="updateProc.jsp?mid=<%=mid%>" method="post">
		이름 : <input type="text" name="name" value="<%=bname%>"><br>
		<br> 부서번호 : <select name="did">
			<%
				for (int i = 1; i <= 3; i++) {
				if (i == bdid) {
			%>
			<option value="<%=i%>" selected="selected"><%=i%></option>
			<%
				} else {
			%>
			<option value="<%=i%>"><%=i%></option>
			<%-- <option value="<%=i%>" <%if(i==bdid){ %>selected<% } %> > <%=i%></option> --%>
			
			<%
				}

			}
			%>
			<!-- 	<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option> -->
		</select><br>
		<br> 급여 : <input type="text" name="salary" value="<%=bsalary%>"><br>
		<br> <input type="submit" value="수정하기">
	</form>
</body>
</html>
