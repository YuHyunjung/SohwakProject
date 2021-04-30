<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>게시판 작성</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/notice_write.css">
	<style>
		.submit{
		    width: 200px;
		    height: 40px;
		    margin: 0 auto;
		    color: white;
		    border: none;
		    background-color: #668efd;
	    }
	</style>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>

	<!-- 공지사항 -->
	
	<%
		if(id==null){
			response.sendRedirect("../member/login.jsp");
		}
		if(id!=null && !id.equals("admin1")){
			out.println("<script>alert('접근할수없습니다.')</script>");
			response.sendRedirect("../index.jsp");
		}
	%>
	<div class="container">
		<div class="titleArea">
			<h2>공지사항수정</h2>
		</div>
		<%
		int board_code = Integer.parseInt(request.getParameter("board_code"));
		
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		BoardDAO dao = new BoardDAO();
		int result = dao.board_AddAction(board_title, board_content);
		
		%>
		<form action="notice_update_Action.jsp?board_code=<%=board_code%>" method="POST">
            <table>
            	<tr>
            		<th>제목</th>
            		<td><input type="text" name="board_title" id="board_title"></td>
            	</tr>
            	<tr>
            		<th>내용</th>
            		<td><textarea name="board_content" id="board_content" cols="55" rows="20"></textarea></td>
            	</tr>
			</table>
           <div class="btn_area">
				<input type="submit" class="submit" value="수정하기" >
				<input type="button" class="cancel" value="취소하기" Onclick="location.href='./notice.jsp'">
            </div>
		</form>
	</div>
		
	
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>