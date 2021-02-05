<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_proc.jsp<br>
<%
	/* HttpServletRequest request = new HttpServletRequest(); */
	request.setCharacterEncoding("UTF-8");//의미없음
	
	String configFolder = "";
	int maxSize = 1024 * 1024 * 5;//5MB 업로드할 파일의 크기@@@@@@@@@@@@@@@@@
	String saveFolder = "img";
	String encoding = "UTF-8";
	//configFolder = config.getServletContext().getRealPath("/");로 경로 알아낸후 이미지폴더 만들어놓기
	configFolder = config.getServletContext().getRealPath("img");//파일을 업로드할 웹서버 폴더의 위치@@@@@@@@@@@@@@@
	//System.out.println(configFolder);
	//C:\JSP_DK\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\14_Upload\
	//C:\JSP_DK\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\14_Upload\img

	//String requestFolder = request.getContextPath();
	String requestFolder = request.getContextPath()+"/"+saveFolder;
	//System.out.println(requestFolder); // /14_Upload/img
	
	String name = request.getParameter("name");
	MultipartRequest multi = new MultipartRequest(
			request, //요청한쪽의 정보
			configFolder,
			maxSize,
			encoding, //한글처리
			new DefaultFileRenamePolicy()//같은이름의 파일을 올릴수있다
			);// 폼에서 넘어오는데이터에 파일이있으면 이것을쓴다.
	
			
	Enumeration<String> e = multi.getFileNames();//넘어오는 파일들의 이름을 가져온다
	String fileName=null;
	while(e.hasMoreElements()){
		String e1=  e.nextElement();
		//System.out.println(e1); //filename
		fileName = multi.getFilesystemName(e1);
		//System.out.println(fileName); hot1.gif
		
		//String ofn = multi.getOriginalFileName(e1);
		//System.out.println(ofn);
		
		
	}
	//String fullPath1 = configFolder + "\\" + fileName; //업로드
	//System.out.println(fullPath1);
	String fullPath2 = requestFolder + "\\" + fileName;//다운로드
	System.out.println(fullPath2);
%>

이름 : <%= multi.getParameter("name")%><br>
<%-- 파일 : <img src="<%=fullPath1%>" width="100" height="100"> --%>
파일 : <img src="<%=fullPath2%>" width="100" height="100">

