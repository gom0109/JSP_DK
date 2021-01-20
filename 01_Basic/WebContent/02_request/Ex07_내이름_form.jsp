<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title></title>
<style type="text/css">
span{
	float:left;
	display:block;
	width:150px;
	color:red;
}

</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1)
	})
	function check(){
		//alert(1)
		if($("INPUT[NAME='id']").val()==""){
			alert("아이디를 입력해 주세요");
			$("INPUT[NAME='id']").focus();
			return false;
		}
		if($('input[name="pw"]').val()==""){
			alert("패스워드를 입력해주세요");
			$("INPUT[NAME='pw']").focus();
			return false;
		}
		if(isNaN($('input[name="pw"]').val())){
			alert("비밀번호는 숫자로 입력해주세요.");
			$('input[name="pw"]').val("")
			$("INPUT[NAME='pw']").focus();
			return false;
		}
		if($('input[name="product"]:checked').val()==null){
			alert("구매 상품중 최소 하나를 선택해주세요")
			return false;
		}
		if($('option:selected').val()=="선택"){
			alert("배송시간을 선택해주세요")
			return false;
		}
		if($('input[name="approve"]:checked').val()==null){
			alert("결재 방법을 선택해주세요")
			return false;
		}
		if($('input[name="agree"]:checked').val()==null){
			alert("결재 동의를 해주세요")
			return false;
		}
		
		
	}


</script>


<body>
<h2> 이마트 상품 구매 내역 </h2>
<FORM name="myform" METHOD="post" ACTION="Ex07_김동욱_result.jsp">

 <span>아이디 :</span> <INPUT TYPE="text" NAME="id"><br>
 <span>비번 :</span> <INPUT TYPE="text" NAME="pw"><br>
  <p> 
 
<span>구매상품:</span>
	<input type="checkbox" name="product" value="식품">식품
	<input type="checkbox" name="product" value="의류">의류
	<input type="checkbox" name="product" value="도서">도서
	<input type="checkbox" name="product" value="가구">가구
<p>

<span>배송시간 :</span> 
 	<SELECT NAME="time">
 		<OPTION VALUE="선택">선택</OPTION>
		<OPTION VALUE="9시~11시">9시~11시</OPTION>
		<OPTION VALUE="11시~1시">11시~1시</OPTION>
		<OPTION VALUE="1시~5시">1시~5시</OPTION>
		<OPTION VALUE="5시~9시">5시~9시</OPTION>
	</SELECT>
<p>

<span>결재방법:</span>
카드 <INPUT TYPE="radio" NAME="approve" VALUE="카드">
핸드폰 <INPUT TYPE="radio" NAME="approve" VALUE="핸드폰">
<p>
<span>결재 동의합니다. </span>  <INPUT TYPE="checkbox" NAME="agree" id="agree"> <!-- value="동의~" 써도 됨-->
<p>

<INPUT TYPE="submit" value="보내기" onClick="return check()">
</FORM>
</body>
</html>


