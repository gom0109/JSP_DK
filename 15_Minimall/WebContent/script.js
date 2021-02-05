/**
 * 
 */
var isCheck=false;
var use = "";
$(document).ready(function(){
	$('input[name="id"]').keydown(function(){
		isCheck=false;
		$("#idMessage").empty();
	})
});
function duplicate(){
	
	if($('input[name="id"]').val()==""){
		alert("아이디를 입력해주세요");
		$('input[name="id"]').focus();
		return false;
	}
	isCheck=true;
	
	$.ajax({
		url: "id_check_proc.jsp",
		data:({
			userid : $('input[name="id"]').val()
		}),
		success:function(data){
			if($.trim(data)=='YES'){
				$("#idMessage").empty().append("<font color = green>사용할수있는 아이디입니다.</font>");
				use = "possible";
			}else{
				$("#idMessage").empty().append("<font color = red>중복되는아이디입니다.</font>");
				use = "impossible";
			}
			
		}
		
	})
}
function writeSave(){
	if(isCheck==false){
		alert("중복체크를하세요")
		return false;
	}
	if(use=="impossible"){
		alert("이미 사용중인 아이디입니다.")
		return false;
	}
}
	