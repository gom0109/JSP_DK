<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>
<form method="post" action="insertProc.jsp">
<h2>영화 선호도 조사</h2>
<table border="1">
<%
	String [] genre = {"공포","다큐","액션","애니메이션"};
	String [] time = {"08~10","10~12","12~14","14~16","16~18","18~20","20~22","22~24"};

%>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="IU"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="아이유"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age" value="23"></td>
	</tr>
	<tr>
		<td>좋아하는 장르</td>
		<td><%
			for(int i=0;i<genre.length;i++){
				%>
					<input type="checkbox" name="genre" value="<%=genre[i]%>"><%=genre[i]%>
				<%
			}
		
		%></td>
	</tr>
	<tr>
		<td>즐겨보는 시간대</td>
		<td><select name="time">
			<%
				for(int j=0;j<time.length;j++){
					%><option value="<%=time[j]%>"><%=time[j]%><%
				}
			
			%>
		</select> </td>
	</tr>
	<tr>
		<td>동반관객수</td>
		<td>
		<%
			for(int i=1;i<=5;i++){
				%>
					<input type="radio" name="partner" value="<%=i%>"><%=i%>
				<%
			}
		
		%></td>
	</tr>
	<tr>
		<td>영화관 개선사항</td>
		<td><textarea name="memo" rows="5" cols="30">없음</textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="가입하기"></td>
		
	</tr>

</table>
</form>