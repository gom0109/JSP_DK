<%@page import="my.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
prod_inputproc.jsp
<br>
<%
	/* request.setCharacterEncoding("UTF-8"); 의미없음 */
String uploadDir = config.getServletContext().getRealPath("/myshop/images");
//System.out.println("uploadDir " + uploadDir);
/* uploadDir C:\JSP_DK\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_Minimall\myshop\images 위치로가서 images폴더 만들기*/
String requestFolder = request.getContextPath() + "/myshop/images";
//System.out.println("requestFolder " + requestFolder);
/* requestFolder /15_Minimall/myshop/images == uploadDir */

MultipartRequest mr = new MultipartRequest(request, uploadDir, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
/* 넘어오는것들은 전부다 mr에 담겨있다 @@@@@@@@@@@@@@@@@@@@@ */
/* String pname = request.getParameter("pname");
System.out.println("pname =" +pname); 안됨!!!!!!!!!!!!!!!!!!!!!!!!!! null나옴*/
//String pname = mr.getParameter("pname");
//System.out.println("pname = " +pname);
/* String pimage = mr.getParameter("pimage");
System.out.println("pimage = " +pimage); 안됨!!!!!!!!!!!!!!!!!!!!!!!!!! null나옴 파일은 getFilesystemName사용해야함*/
//String pimage = mr.getFilesystemName("pimage");
/* mr.getOriginalFileName("pimage"); 원래이름 가져오기 */
//System.out.println("pimage2 = " +pimage2);

	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.insertProduct(mr); 
	if(cnt>0){
		response.sendRedirect("prod_list.jsp");
	}
	else{
		%>
			<script type="text/javascript">
				alert("삽입실패")
				location.href="prod.input.jsp"
			</script>
		<%
				
	}
	
%>
