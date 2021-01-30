
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	
%>
<jsp:useBean id="dao" class="DTO.BookDao"></jsp:useBean>

<jsp:useBean id="bean" class="DTO.BookBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
	String temp="";
	String [] bs = request.getParameterValues("bookstore");
	for(int i=0;i<bs.length;i++){
		temp += bs[i]+" ";
	}
	bean.setBookstore(temp);
	
int cnt = dao.insertData(bean);

if(cnt>0){
	response.sendRedirect("select.jsp");
}
else{
	response.sendRedirect("insertForm.jsp");
}
%>
