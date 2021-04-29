<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		BoardDAO dao = new BoardDAO();
		int result = dao.board_AddAction(board_title, board_content);
		String message ="게시물 등록에 실패하였습니다.";
		if(result == 1){
			message = "게시물 등록에 성공하였습니다.";
		}
		%> 
	<script>
    alert("<%=message%>");
    window.location.href="./notice.jsp";
  </script>
</body>
</html>