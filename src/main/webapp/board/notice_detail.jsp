<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>게시판 상세보기</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/notice_detail.css">
</head>
<script></script><!-- 일단 냅둠 -->
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>

	<!-- 게시판 상세보기 -->
	<div class="container">
	<div class="titleArea">
 	  <h2>Notice</h2>
   		<br>
    <form action="" method="POST" target="">
       <table>
		   <thead>
           <tr>
               <th>제목</th>
               <th>내용</th>
			   <th>작성일</th>
           </tr></thead>
		   <tbody>
		   	<%
				BoardDAO dao = new BoardDAO();	//BoardDAO 불러오려면 import 해야하는데 안했어
				BoardDTO dto = new BoardDAO().getDetail(board_code);
			
			%>
           <tr>
               <td><a href="./notice_deetail.jsp?board_code=>"/><%=dto.getTitle() %></td>
               <td><%=dto.getDiscriprion() %></td>
			   <td><%=dto.getBoard_date() %></td>
           </tr></tbody>
		   <%
				
		   %>
       </table>
        <fieldset>
            <input type="button" id="submit" name="submit" value="목록" onclick="../board/notice.jsp'">
			<input type="button" id="update" name="update" value="수정" onclick="../board/notice_modify.jsp'">
			<input type="button" id="delete" name="delete" value="삭제" onclick="../board/notice_modify.jsp'">
        </fieldset>
    </form>
    </div>
	</div>


	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>