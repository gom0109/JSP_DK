<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){//document영역이 준비되었을때
		var isCheck = false;
		isChange = false;
		use="";
		//alert(1);
		$("#id_check").click(function(){//id가 id_check인것을 클릭했을때
			isCheck=true;
			
			//alert(2);
			if($('input[name="id"]').val() == ""){
				alert("아이디를 입력하세요");
				return
			}
			$.ajax({
				url : "id_check_proc.jsp",/* 입력한 아이디의 중복확인을 판단하기위한 jsp */
				data : ({
					userid : $('input[name="id"]').val()
					
					/* id_check_proc.jsp 에 넘길값을 userid에 담아넘긴다 */
				}),
				success : function(data){
					//alert(data);
					if($.trim(data) == 'YES'){
						$("#idmessage").empty().append("<font color = green>사용 가능한 id입니다");
						$("#idmessage").show();
						use = "possible";
					}else{
						$("#idmessage").empty().append("<font color = red>이미 사용중인 id입니다");						
						$("#idmessage").show();
						use = "impossible";
					}
					
				}//success
								
			})//ajax
			
		});//click
		
		$("input[name='id']").keydown(function(){			
			$("#idmessage").empty()
			//isChange = true;?????
			isCheck =false;
			/* use=""; ?????????*/
			
			/* $("#idmessage").css('display','none'); */
		})
		
		$("#sub").click(function(){
			if($('input[name="id"]').val() == ""){
				alert("아이디를 입력하세요");
				return false;
			}
			else if(use == "impossible"){
				alert("이미 사용중인 아이디입니다.")
				return false;
			}
			else if(isCheck ==false){
				alert("중복체크를 해주세요.")
				return false;
			}
			 
			/* else if(isCheck ==false || isChange== true){
				alert("중복체크를 해주세요.")
				return false;
			} */
		})
		
		
	});//ready

</script>


<form method="post" action="insertProc.jsp">
<h2>영화 선호도 조사</h2>
<table border="1" width = "700px">
<%
	String [] genre = {"공포","다큐","액션","애니메이션"};
	String [] time = {"08~10","10~12","12~14","14~16","16~18","18~20","20~22","22~24"};

%>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" >
			<input type="button" id="id_check" value="중복체크">
			<span id="idmessage" style="display: none;"></span>
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age"></td>
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
		<td colspan="2"><input type="submit" value="가입하기" id="sub"></td>
		
	</tr>

</table>
</form>