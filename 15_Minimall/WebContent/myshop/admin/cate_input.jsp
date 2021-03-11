<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function getInput(){
		if(document.myform.code.value == ""){
			alert("카테고리 코드를 입력하세요")
			document.myform.code.focus();
			return false;
		}
		if(document.myform.cname.value == ""){
			alert("카테고리 이름을 입력하세요")
			document.myform.cname.focus();
			return false;
		}
		
	}


</script>
<link rel="stylesheet" type="text/css" href= "../../style.css"/>

<%@include file="top.jsp"%>
	<td colspan="6" align="center">
	<form action="cate_inputProc.jsp" method="post" name="myform">
		<table border="1" width="350" align="center">
			<caption><b>카테고리 등록</b></caption>
			
			<tr>
				<td bgcolor="yellow" align="left">카테고리 코드</td>
				<td><input type="text" name="code"></td>
			</tr>
			
			<tr>
				<td bgcolor="yellow" align="left">카테고리 이름</td>
				<td><input type="text" name="cname"></td>
			</tr>
			
			<tr>
				<td bgcolor="yellow" align="center" colspan="2">
				<input type="submit" value="등록" onclick="return getInput()">
				<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
		
	</td>

<%@include file="bottom.jsp"%>