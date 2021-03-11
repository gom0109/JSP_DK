<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function check(){
		
		if(myform.id.value.length<4 || myform.id.value.length>6 ){
			alert(1)
			return false;
		}
		
		
	}
</script>


<form method="post" action="asd" name="myform">
	<input type="text" name="id">
	<input type="submit" value="등록" onclick="return check()">

</form>