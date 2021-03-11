<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_delete.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String pimage = request.getParameter("pimage");
	String uploadDir = config.getServletContext().getRealPath("/myshop/images");
	//System.out.println(pnum);
	//System.out.println(pimage);
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.deleteByNum(pnum);
	File delFile = null;
	File dir = new File(uploadDir);
	
	if(pimage != null){
		delFile = new File(dir,pimage);
		delFile.delete();
	}
	if(cnt>0){
		response.sendRedirect("prod_list.jsp");
	}else{
		%>
			<script type="text/javascript">
				alert("삭제실패")
			</script>
		<%
		response.sendRedirect("prod_list.jsp");
	}
%>