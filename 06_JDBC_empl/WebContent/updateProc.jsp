
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp -> updateProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myPkg.EmplDao"></jsp:useBean>
<jsp:useBean id="bean" class="myPkg.EmplBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<% 
	String msg;
	String url;
	int count = dao.updateData(bean);
	if(count>0){
		msg="수정 성공";
		url = "select.jsp";
	}
	else{
		msg="수정 실패";
		url = "updateForm.jsp?mid="+bean.getMid();
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = '<%=url%>';

</script>
