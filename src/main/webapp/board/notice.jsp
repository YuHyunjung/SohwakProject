<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Vector" %>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>게시판 리스트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/notice_main.css">
</head>
<script></script> <!-- 일단 냅둠 -->
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	
	<!-- 게시판 메인 -->
	
	<div class="container">
		<div class="titleArea">
			<h2>Notice</h2>
		</div>
	
       <table>
           <tr>
               <th>번호</th>
               <th class="B">제목</th>
               <th>작성일</th>
           
           </tr>
           <%
           BoardDAO dao = new BoardDAO();
           int count = dao.SelectCnt("board");
           String tempStart = request.getParameter("page");
           
           int startPage = 0;
           int onePageCnt =10;
           count =(int)Math.ceil((double)count/(double)onePageCnt);
           
           if(tempStart != null){
        	   startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
           }
           
           Vector<BoardDTO> vdo =dao.selectPage("board", startPage, onePageCnt);
           
           %>
           <%
           for(int i=0; i<vdo.size();i++){
           %>
           <tr>
               <td><%=vdo.get(i).getBoard_code()%></td>
               <td><a href="./notice_detail.jsp?board_code=<%=vdo.get(i).getBoard_code()%>"><%=vdo.get(i).getTitle() %></a></td>
               <td><%=vdo.get(i).getBoard_date() %></td>
           </tr>
			<%} %>
          		
       </table>
    
       	
		<div class="paging">
			
			<ol>
		<%
       		for(int i=1; i<=count; i++){
       	%>
				<li><a href="notice.jsp?page=<%=i%>"><%=i%></a></li>
		<%}; %>
			</ol>
		</div>
		
		<%if(id!=null && id.equals("admin1")){%>
        <fieldset>
        	<a href="./notice_write.jsp" id="submit">글쓰기</a>
        </fieldset>
		<%}%>
    </div>
    
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>