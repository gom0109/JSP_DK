<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex01_result.jsp <br>
<!-- HttpServletRequest request = new HttpServletRequest()이런식으로 미리 객체를 만들어놓음 내장객체 -->
<%
	request.setCharacterEncoding("UTF-8");
	/* post method사용시 한글을 사용하는 줄을 작성하기 전에 적어야 한글이깨져나오지않는다 */
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	//age는 숫자이지만 문자열로 넘어오기때문에 String으로 받는다.
	/* 내장객체 이미 객체를만들고 변수를 선언하였기때문에 request.이런방식으로 가져다 사용하면된다 */
	
	
%>
이름: <%=name%><br>
나이: <%=age%> <br>


전송방식 : <%=request.getMethod() %><br>
요청 URI : <%= request.getRequestURI() %><br><!-- 요청한 파일 -->
컨텍스트 : <%= request.getContextPath() %><br><!-- 프로젝트이름 -->
<!-- Class Person{
	private String name;
	private String age;
	
	public void setName(String name){
		this.name=name;
	}
	public int getAge(){
		return age;
	}
	
}

Person p = new Person();
p.setName("윤아");

내장객체 이미 객체를만들고 변수를 선언하였기때문에 request.이런방식으로 가져다 사용하면된다


C:\JSP_DK\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\01_Basic\02_request웹서버 폴더의 위치
 -->








