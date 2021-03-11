<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href= "<%=request.getContextPath() %>/style.css"/>
<%-- <%=request.getContextPath() %>/15_Minimall --%>
register.jsp<br>
<!-- WebConten-myshop-member-register.jsp -->
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../script.js"></script>




<form action="registerPro.jsp" method="post" onsubmit="return writeSave()">

<table border="1" align="center">
	<tr>
		<td colspan="2" align="center" bgcolor="#FFCC00">
			<font size="3" color="#5D1900"><b>◈ 기본 정보 ◈</b></font>
		</td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center"> * 회원 아이디 </th>
		<td><input type="text" name="id")>&nbsp;<input type="button" value="중복체크" id="id_check" onclick="return duplicate()">
		<span id="idMessage"></span>
		</td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center"> * 비밀 번호</th>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center"> * 비밀 번호 확인</th>
		<td><input type="password" name="repassword" id="repassword">
			<span id="pwmessage" style="display:none;"></span></td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center"> E-Mail </th>
		<td>
			<input type="text" name="email" value="gildong@naver.com"> 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" bgcolor="#FFCC00">
			<font size="3" color="#5D1900"><b>◈ 개인 신상 정보 ◈</b></font>
		</td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center">한글 이름</th>
		<td><input type="text" name="name" value="홍길동"> 성과 이름을 붙여주세요 (예)홍길동</td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center">주민 등록 번호</th>
		<td>
			<input type="text" name="rrn1" maxlength="6" size="6" value="123456">
			- 
			<input type="text" name="rrn2" maxlength="7" size="7" value="1234567">
		</td>				
	</tr>
	<tr>
		<th bgcolor="yellow" align="center">전화 번호</th>
		<td>
			<select name="phone1">
				<option value="02">02</option>
				<option value="051">051</option>
			</select>
			- 
			<input type="text" name="phone2" size="4" maxlength="4" value="1111"> - 
			<input type="text" name="phone3" size="4" maxlength="4" value="2222"> 예) 051-000-0000
		</td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center">휴대 전화 번호</th>
		<td>
			<select name="hp1">
				<option value="010">010</option>
				<option value="011">011</option>
			</select>
			- 
			<input type="text" name="hp2" size="4" maxlength="4" value="1234"> - 
			<input type="text" name="hp3" size="4" maxlength="4" value="5678"> 예) 011-000-0000
		</td>
	</tr>
	<tr>
		<th bgcolor="yellow" align="center">가입 일자</th>
		<td>
			<input type="text" name="joindate" size="10" value="2020/01/01" onBlur="datecheck()"> 예)2000/05/22
		</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="#FFCC00"  align="center">
			<input type="submit" value="가입 하기" id="sub">&nbsp;&nbsp;
			<input type="reset" value="취소">
		</td>
	</tr>	
</table>
</form>