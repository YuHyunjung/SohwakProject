<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>


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
				BoardDAO dao = new BoardDAO();	//BoardDAO 불러오려면 import 해야하는데 안했어
				
				List<BoardDTO> boardList = dao.findBoard();	//BoardDTO 도 import안하고 findBoard()메소드 자체를 호출안함..
				for(int i=0;i<boardList.size();i++){	//for문써서 list로 받았으니까 (배열이랑비슷) 그럼 그 순서대로뽑아와야하니까 boardList사이즈만큼
			%>
           <tr>
               <td><%=boardList.get(i).getBoard_code() %></td>
               <td><a href="./notice_deetail.jsp?board_code=<%=boardList.get(i).getBoard_code()%>"><%=boardList.get(i).getTitle() %></a></td>
               <td><%=boardList.get(i).getBoard_date() %></td>
           </tr>//각각에 해당하는 값들을 가져와라 가 get(i)쓰면 i번째 인덱스에 들어있는 아이들을꺼내옴
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
        <fieldset>
            <input type="button" id="submit" name="submit" value="글쓰기" onclick="location.href='./notice_write.html'">
        </fieldset>
    </div>
    
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>