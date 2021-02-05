<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateFrom.jsp<br>
<%-- <jsp:useBean id="dao" class="myPkg.MovieDao"></jsp:useBean> --%>
<%
	MovieDao dao = MovieDao.getInstance();
	System.out.println("updateFrom : "+dao);
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	MovieBean bean = dao.selectByNum(num);
%>
<form method="post" action="updateProc.jsp">
<h2>영화 선호도 조사 수정</h2>
<table border="1">
<%
	String [] genre = {"공포","다큐","액션","애니메이션"};
	String [] time = {"08~10","10~12","12~14","14~16","16~18","18~20","20~22","22~24"};
	
%>
	<input type="hidden" name="num" value="<%=bean.getNum()%>">
	<input type="hidden" name="id" value="<%=bean.getId()%>">
	<tr>
		<td>아이디</td>
		<td><%=bean.getId()%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="<%=bean.getName()%>"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age" value="<%=bean.getAge()%>"></td>
	</tr>
	<tr>
		<td>좋아하는 장르</td>
		<td><%
			for(int i=0;i<genre.length;i++){
				if(bean.getGenre().contains(genre[i])){
					%>
					<input type="checkbox" name="genre" value="<%=genre[i]%>" checked="checked"><%=genre[i]%>
				<%
				}else{
					%>
					<input type="checkbox" name="genre" value="<%=genre[i]%>"><%=genre[i]%>
				<%
				}
				
			}
		
		%></td>
	</tr>
	<tr>
		<td>즐겨보는 시간대</td>
		<td><select name="time">
			<%
				for(int j=0;j<time.length;j++){
					if(bean.getTime().equals(time[j])){
						%><option value="<%=time[j]%>" selected="selected"><%=time[j]%><%
					}else{
						%><option value="<%=time[j]%>"><%=time[j]%><%
					}
					
				}
			
			%>
		</select> </td>
	</tr>
	<tr>
		<td>동반관객수</td>
		<td>
		<%
			for(int i=1;i<=5;i++){
				if(bean.getPartner()==i){
					%>
					<input type="radio" name="partner" value="<%=i%>" checked="checked"><%=i%>
				<%
				}else{
					%>
					<input type="radio" name="partner" value="<%=i%>"><%=i%>
				<%
				}
				
			}
		
		%></td>
	</tr>
	<tr>
		<td>영화관 개선사항</td>
		<td><textarea name="memo" rows="5" cols="30"><%=bean.getMemo() %></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정하기"></td>
		
	</tr>

</table>
</form>