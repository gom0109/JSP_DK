<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="Ex03_select_result.jsp">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>

	성별 : 남자<input type="radio" name="gender" value="m">
		   여자<input type="radio" name="gender" value="f"><br>
		   
	취미 : <select name="hobby">
			<option value="JAVA공부">JAVA공부</option>
			<option value="TV시청">TV시청</option>
			<option value="만화보기">만화보기</option>
			<option value="게임">게임</option>
			<option value="등산">등산</option>
	</select> 
	
	색 선택: <select name="color">
			<option value="blue">파랑</option>
			<option value="green">초록</option>
			<option value="red">빨강</option>
			<option value="yellow">기타</option>	
	</select> <p>
	
	<input type="submit" value="보내기">
	
</form>