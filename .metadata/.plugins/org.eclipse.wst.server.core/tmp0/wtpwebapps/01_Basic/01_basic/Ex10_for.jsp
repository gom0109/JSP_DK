<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	int sum=0;
	for(int i=1;i<=10;i++){
		sum = sum+i;
		
	}
	
%>
1~10까지의 합은 <%=sum%><br>
1~10까지의 합은 <% out.print(sum);%>
<br><br><br>
<%	int sum2=0;
	for(int i=1;i<=10;i++){
		sum2 = sum2+i;
		%>
		1부터 <%=i %> 까지의 합은 <%=sum2 %><br>
		
	<%}
	
%>
