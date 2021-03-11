<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
  
myshop.display.mall.jsp<br>일반사용자용 첫페이지<br>
<%@include file="mall_top.jsp" %>
<h3>WELCOME TO MY MALL</h3>
	<%
		String [] spec={"HIT","NEW","BEST","NORMAL"};
		ProductDao pdao = ProductDao.getInstance();
		int count=0;
		DecimalFormat df = new DecimalFormat("###,###");
	
		for(int i=0;i<spec.length;i++){
			ArrayList<ProductBean> plist =  pdao.selectByPspec(spec[i]);
		%>
			<hr color=green width="80%">
			<font color="red" size="3"><%=spec[i] %></font>
			
			
			<hr color=green width="80%">
		<%	
			if(plist.size()==0){
				out.print("<b>" +spec[i] + " 상품은 없습니다</b>");
			}else{
				%>
				<br>
				<table border="0">
				<tr>
					<%
						for(int x=0;x<plist.size();x++){
							count++;
							ProductBean pbean = plist.get(x);
							String pimage = pbean.getPimage();
							//System.out.println(pimage);
							String pname = pbean.getPname();
							int price =pbean.getPrice();
							int point= pbean.getPoint();
							int pnum = pbean.getPnum();
							
							String requestFolder = request.getContextPath() + "/myshop/images";
							
							%>
							
							<td>
								<a href="mall_prodView.jsp?pnum=<%=pbean.getPnum()%>"><img src="<%=requestFolder %>/<%=pbean.getPimage()%>" width="100" height="100"></a><br>
								<%=pname %><br>
								<font color="red"><%=df.format(price)  %>원</font><br>
								<font color="blue"><%=df.format(point) %>point</font><br>
							</td>
							
							
							<%
							if(count%3==0){
								out.print("</tr><tr>");
							}
						}
					
					
					%>
				
				</tr>
				
				
				</table>
				
				<%
			}
			
			
		} 
	
	
	%>

<%@include file="mall_bottom.jsp" %>