<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.io.PrintWriter" %>



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
				
				List<BoardDTO> boardList = dao.findBoard();	
				for(int i=0;i<boardList.size();i++){	
			%>
           <tr>
               <td><%=i+1 %></td>
               <td><a href="./notice_detail.jsp?board_code=<%=boardList.get(i).getBoard_code()%>"><%=boardList.get(i).getTitle() %></a></td>
               <td><%=boardList.get(i).getBoard_date() %></td>
           </tr>
           <%
			}
           %>
			
       </table>
       
       
		<div class="paging">
			<a href="#none" class="prev"><img src="../img/prev_btn.png" alt="이전페이지"></a>
			<ol>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ol>
			<a href="#none" class="next"><img src="../img/next_btn.png" alt="다음페이지"></a>
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