<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cgList.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String cname = request.getParameter("cname");
	String code = request.getParameter("code");
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> plist = pdao.selectByCate(code);
	String reqPath = request.getContextPath()+"/myshop/images";
	int count=0;
	DecimalFormat df = new DecimalFormat("###,###");//세자리마다 ,를찍어준다
	
%> 

<%@include file="mall_top.jsp" %>
	<hr color=green width="80%">
	<font color="red" size="3"><%=cname %></font>
	<hr color=green width="80%">
	<%
	if(plist.size()==0){
		out.print("등록된 "+cname+"이 없습니다.");
	}else{
		%>
		<table border="0" width=90%>
		<tr>
			<%
				
			
				for(int i=0;i<plist.size();i++){
					count++;
					ProductBean pbean = plist.get(i);
					%>
						<td align="center">
							<a href="mall_prodView.jsp?pnum=<%=pbean.getPnum()%>"><img src="<%=reqPath%>/<%=pbean.getPimage()%>" width="100" height="100"></a><br>
							<%=pbean.getPname() %><br>
							<font color="red"><%=df.format(pbean.getPrice()) %>원</font><br>
							<font color="blue" >[<%=df.format(pbean.getPoint())  %>]point</font><br>
							
						</td>
					
					<%
					
					if(count%3==0){
						%></tr><tr><%
					}
				}
			
			
			%>
		
		
		
		
		</tr>
	</table>
	<%
	}
	%>
	
	
	

<%@include file="mall_bottom.jsp" %>