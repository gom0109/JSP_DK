
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%java.util.Calendar cal = java.util.Calendar.getInstance(); %>
	<!-- new Calendar() 카렌다 생성자는 퍼블릭이아니라 부를수가없다. protected -->
	오늘은
	<%=cal.get(java.util.Calendar.YEAR) %>년
	<%=cal.get(java.util.Calendar.MONTH)+1 %>월 <!-- 월은 0부터 시작하므로 +1을해준다 -->
	<%=cal.get(java.util.Calendar.DATE) %>일
	
</body>
</html>