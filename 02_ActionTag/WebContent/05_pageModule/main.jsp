<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
main.jsp
<br>
<form method="post" action="control.jsp">
	<table border="2" width="500px" height="250px"
		style="text-align: center;">
		<tr>
			<td colspan="2"><h2>제품을 선택해 주세요</h2></td>
		</tr>
		<tr>
			<td><h2>제품</h2></td>
			<td style="text-align: left;"><input type="radio" name="product"
				value="1">텔레비전<br> <input type="radio" name="product"
				value="2">디지털카메라<br> <input type="radio" name="product"
				value="3">mp3 플레이어<br></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="확인"> <input
				type="reset" value="취소"></td>
		</tr>
	</table>

</form>