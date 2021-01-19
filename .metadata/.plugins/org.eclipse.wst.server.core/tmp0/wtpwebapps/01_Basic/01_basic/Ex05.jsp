<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int value1 = 3;
int value2 = 10;
int addResult = add(value1,value2);
int subtractResult =  subtract(value1,value2);
%>
<%! int add(int x , int y){
		return x+y;
	}
%>

<%! int subtract(int x , int y){
		return x - y;
	}
%>

결과1 : <%=value1 %> + <%=value2 %> = <%= addResult %><br>
결과2 : <%=value1 %> - <%=value2 %> = <%= subtractResult  %><br>
결과3 : <%=value1 %> - <%=value2 %> = <%= subtract(value1,value2)  %>