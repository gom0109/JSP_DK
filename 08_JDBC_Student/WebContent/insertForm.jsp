<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<
	<h2>회원가입 insertForm.jsp</h2>
	<form action=insertProc.jsp method="post">
		아이디 : <input type="text" name="id" value="IU"><br><br>  
		비밀번호 :
		<input type="password" name="passwd" value="1234"><br><br>  
		이름
		: <input type="text" name="name" value="아이유"><br><br>  
		생년월일 :
		<select name="year">
			<%
				for(int i=2019;i>=1930;i--){
			%>
					<option value="<%=i%>"><%=i%></option>
			<%} %>
		</select> 년 
		
		<select name="month">
			<%
		for(int i=1;i<=12;i++){
	%>
			<option value="<%=i%>"><%=i%></option>
			<%} %>
		</select> 월
		
		<select name="day">
			<%
		for(int i=1;i<=31;i++){
	%>
			<option value="<%=i%>"><%=i%></option>
			<%} %>
		</select> 일 <br>
		<br> 취미 : 
		<%
			String [] hobby = {"달리기","수영","잠자기","영화"};
			for(int i=0;i<hobby.length;i++){%>
				<input type="checkbox" name="hobby" value="<%=hobby[i]%>"><%=hobby[i]%>
			<%}
		
		%>
		<br> <br><br> 

		[점수입력]<br> 
		C언어 : 	<input type="text" name="c" size="10">
		JAVA : <input type="text" name="java" size="10">
		JSP : <input type="text" name="jsp" size="10"><br><br>  
		<input type="submit" value="가입하기">
	</form>

