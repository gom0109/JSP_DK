<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../display/mall_top.jsp" %>
<style type="text/css">
	body{
		text-align: center;
	}
	
	table {
		margin: auto;
		
	}
</style>

<%
	int pageSize = 10;//한페이지당 보이는 글(레코드)의갯수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//글 작성 날짜와 시간표시를위한 포멧 설정MM월 대문자 mm분 소문자
	String pageNum = request.getParameter("pageNum");//넘어오는 페이지넘버를 받는다
if (pageNum == null) {
	pageNum = "1";//처음시작시 넘어오는 페이지넘버가없으므로 1로 설정해준다
}
int currentPage = Integer.parseInt(pageNum);//내가 클릭한 페이지번호
int startRow = (currentPage-1)*pageSize+1;//(2-1)*10+1;rank 1번
int endRow = currentPage*pageSize;//2*10 rank 10번
int number=0;
BoardDao dao = BoardDao.getInstance();
int count = dao.getArticleCount(); //테이블에있는 레코드의 갯수


ArrayList<BoardBean> list = dao.getArticles(startRow,endRow);

number = count-(currentPage-1)*pageSize;//14-(2-1)*10=4
%>


<%@ include file="color.jsp"%> <!-- color.jsp가져와서 붙혀넣기 -->
<link rel="stylesheet" type="text/css" href="style.css"/><!-- 미리 지정해놓은 style.css불러온다 -->
<body bgcolor="<%=bodyback_c%>"> <!-- bgcolor대입 -->
	<b>글목록(전체 글 :<%=count%>)</b>
	
	<table width="700">
		<tr>
			<td align="right" bgcolor="<%=value_c %>"><a href="writeForm.jsp">글쓰기</a>
			</td>
		</tr>
	</table>

	<table width="700" align="center">
		<tr bgcolor="<%=value_c %>" align="center">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회</td>
			<td>IP</td>
		</tr>
		<%
			for (int i = 0; i < list.size(); i++) {
			BoardBean bean = list.get(i);
		%>
		<tr>
			<td><%=number--%></td>
			<td>
				<% 
					int wid = 0;
					if(bean.getRe_level() >0){
						wid = 20*bean.getRe_level();
					%>
						<img src="images/level.gif" width="<%=wid%>" height="16">
						<img src="images/re.gif" height="16">
					<%
					}
				%>
			<a href="content.jsp?num=<%=bean.getNum()%>&pageNum=<%=currentPage%>"><%=bean.getSubject()%></a>
				<%
					if(bean.getReadcount()>10){
						%>
							<img src="images/hot.gif" height="16">
						<%
					}
				
				%>
			
			</td>
			<td><%=bean.getWriter()%></td>
			<td><%=sdf.format(bean.getReg_date())%></td> <!-- sdf안에 format이라는 메소드 -->
			<td><%=bean.getReadcount()%></td>
			<td><%=bean.getIp()%></td>
		</tr>
		<% 
			}
		%>

	</table>
	
	<%
		if(count>0){//글이 하나이상있을때
			int pageCount = count/pageSize+ (count%pageSize == 0 ? 0 : 1);//전체 필요한 페이지 갯수 나머지가 0이아니면 페이지를 하나 더해준다
			int pageBlock = 10;//한페이지에 10개의 페이지번호가 보이도록 설정
			int startPage = ((currentPage-1)/pageBlock*pageBlock)+1;//시작페이지번호
			//System.out.println(startPage);
			int endPage = startPage+pageBlock-1;
			if(endPage>pageCount){//내용이없을때 30페이지까지 나오는것이 아니라 마지막 페이지번호가 나온다
				endPage=pageCount;
			}
			if(startPage>10){
				%>
					<a href="list.jsp?pageNum=<%=startPage-10%>">[이전]</a>
				<%
			}
			for(int i=startPage;i<=endPage;i++){
				%>
					<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
				<%
			}
			if(endPage<pageCount){
				%>
				<a href="list.jsp?pageNum=<%=startPage+10%>">[다음]</a>
				<%
				
			}
		}
	
	%>

</body>

<%@include file="../display/mall_bottom.jsp" %>