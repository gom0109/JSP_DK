<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_updateproc.jsp<br>

<%
	String uploadDir = config.getServletContext().getRealPath("/myshop/images");
	String requestFolder = request.getContextPath() + "/myshop/images";
	MultipartRequest mr = new MultipartRequest(request, uploadDir, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
	String Pcategory_fk =mr.getParameter("Pcategory_fk");
	String pnum =mr.getParameter("pnum");
	String pname =mr.getParameter("pname");
	String pcompany =mr.getParameter("pcompany");
	String pimage =mr.getFilesystemName("pimage");
	String pimage2 =mr.getParameter("pimage2");
	String pqty =mr.getParameter("pqty");
	String price =mr.getParameter("price");
	String pspec =mr.getParameter("pspec");
	String pcontents =mr.getParameter("pcontents");
	String point =mr.getParameter("point");
	ProductBean pbean = new ProductBean();
	pbean.setPcategory_fk(Pcategory_fk);
	pbean.setPnum(Integer.parseInt(pnum));
	pbean.setPname(pname);
	pbean.setPcompany(pcompany);
	
	File delFile = null;//java.io패키지의 File클래스
	File dir = new File(uploadDir);
	
	if(pimage==null){
		if(pimage2 !=null){
			pimage= pimage2;
		}
		
	}else{
		if(pimage2!=null){
			delFile = new File(dir, pimage2);
			//uploadDir = C:\JSP_DK\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_Minimall\myshop\images
			delFile.delete();
		}
	}
	
	
	pbean.setPimage(pimage);
	
	pbean.setPqty(Integer.parseInt(pqty));
	pbean.setPrice(Integer.parseInt(price));
	pbean.setPspec(pspec);
	pbean.setPcontents(pcontents);
	pbean.setPoint(Integer.parseInt(point));
	ProductDao pdao = ProductDao.getInstance();
	
	/* int cnt = pdao.updateByNum(mr);  */
	int cnt = pdao.updateByNum(pbean); 

	
	if(cnt>0){
		response.sendRedirect("prod_list.jsp");
		
	}else{
		%>
			<script type="text/javascript">
				alert("수정 실패");
			</script>
		<%		
		response.sendRedirect("prod_update.jsp?pnum="+pnum);
	}
	
/* 	System.out.println("Pcategory_fk: "+Pcategory_fk);
	System.out.println("pname: "+pname);
	System.out.println("pimage: "+pimage);
	System.out.println("pimage2: "+pimage2);
	System.out.println("pnum: "+pnum); */

%>