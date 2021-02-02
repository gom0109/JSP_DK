<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		use = "";
		checkflag = false;
		
		$("#idcheck").click(function(){
			checkflag = true;
			if($("input[name='id']").val()==""){
				alert("아이디를 입력하세요")
				
				return;
			}
			$.ajax({
				url : "id_check_proc.jsp",
				data : ({
					userid : $("input[name='id']").val()
				}),
				success: function(data){
					//alert(data);
					if($.trim(data) == "YES"){
						$("#idmessage").empty().append("<font color = blue>사용가능한 아이디입니다")
						use = "possible";
					}else{
						$("#idmessage").empty().append("<font color = red>이미 사용중인 아이디입니다.")
						use = "impossible";
					}
				}				
			})
		})
		
		$("input[name='id']").keydown(function(){
			$("#idmessage").empty()
			checkflag = false;
			/* use=""; 이미 존재하는 아이디를 중복체크하고 다른아이디를 입력할경우 use에는 이전 중복되는 아이디에 대한 값이 들어있다 그러므로 초기화를해준다
			하지만 다른아이디를 입력하면 어짜피 중복체크를 다시 해야하므로 필요없다 생각됨. */
		})
		
		$("#sub").click(function(){
			if($("input[name='id']").val()==""){
				alert("아이디를 입력하세요");
				return false;
			}else if(checkflag == false){
				alert("중복체크를 해주세요");
				return false;
			}else if (use == "impossible"){
				alert("이미 사용중인 아이디입니다.");
				return false;
			}
		})
	})
</script>
	<h2>회원가입 insertForm.jsp</h2>
	<form action=insertProc.jsp method="post">
		아이디 : <input type="text" name="id" ><input type="button" value="중복체크" id="idcheck">
		<span id="idmessage"></span><br><br>  
		비밀번호 :
		<input type="password" name="passwd"><br><br>  
		이름
		: <input type="text" name="name"><br><br>  
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
		<input type="submit" value="가입하기" id = "sub">
	</form>

