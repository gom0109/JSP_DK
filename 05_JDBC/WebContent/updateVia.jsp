<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
updateVia.jsp(2차 수정폼)
<br>
<!-- //아이디 비번 잘못되면 다시 updateForm.jsp으로 돌아가기
//잘 입력하면 정보 가져오기 -->
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id = "jspid";
String pw = "jsppw";

request.setCharacterEncoding("UTF-8");
String id2 = request.getParameter("id");
String passwd = request.getParameter("passwd");

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, id, pw);

String sql = "select * from register where id = ?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, id2);
ResultSet rs = ps.executeQuery();
if (rs.next()) {
	String rspasswd = rs.getString("passwd");
	String name = rs.getString("name");
	String gender = rs.getString("gender");
	String uname = rs.getString("uname");
	if (passwd.equals(rspasswd)) {
		session.setAttribute("sid", id2);
%>
<form method="post" action="updateProc.jsp">
<%-- <input type="hidden" name="id" value="<%=id2%>"><!-- 세션사용도 좋은방법 --> --%>
	<table border="1">
		<tr>
			<th colspan="2">수정할 정보를 입력하세요</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=id2%></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><INPUT TYPE="password" NAME="passwd" value="<%=rspasswd%>"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%= name%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="radio" name="gender" value="남" >남
				<input type="radio" name="gender" value="여" >여</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="uname" value="<%=uname%>">@ <select
				name="dname">
					<option value="daum.net">daum.net</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="google.com">google.com</option>
					<option value="yahoo.com">yahoo.com</option>
			</select></td>
		</tr>
		<tr>
			
			<td colspan="2">
			<INPUT TYPE="submit" VALUE="수정">
			<INPUT TYPE="reset" VALUE="취소">
			</td>
		</tr>
	</table>

</form>
<%
	} else {
out.print("잘못된 비밀번호 입니다.");
%>
<meta http-equiv="refresh" content="2; url = updateForm.jsp">
<%
	}

} else {
out.print("아이디가 존재하지 않습니다.");
%>
<meta http-equiv="refresh" content="2; url = updateForm.jsp">
<%
	}
%>
