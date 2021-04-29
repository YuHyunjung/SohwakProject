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
		
		//Class.forName("com.mysql.jdbc.Driver");
		//String dbURL = "jdbc:mysql://localhost:3306/sohwak?useSSL=false&serverTimezone=UTC";
		//String dbID = "root";
		//String dbPassword="my1234";
		
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		BoardDAO dao = new BoardDAO();
		int result = dao.board_AddAction(board_title, board_content);
		String message ="게시물 등록에 실패하였습니다.";
		if(result == 1){
			message = "게시물 등록에 성공하였습니다.";
		}
		//try{
		//      Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword); //실제연동시도
		//	   String sql = "INSERT INTO BOARD(title, discriprion) VALUES(?, ?)";
		//      PreparedStatement pstmt = conn.prepareStatement(sql);
		//       pstmt.setString(1, board_title);
		//       pstmt.setString(2, board_content);
		//       pstmt.execute();
		//       pstmt.close();
		//
		//    }catch(SQLException e){
		//      out.println(e.toString());
		//    }
		%> 
	<script>
    alert("<%=message%>");
    window.location.href="./board_List.jsp";
  </script>
</body>
</html>