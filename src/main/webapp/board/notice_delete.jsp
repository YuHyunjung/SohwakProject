<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 기능</title>
</head>
<body>
		<%
			request.setCharacterEncoding("UTF-8"); 
			String id = (String) session.getAttribute("idKey");  //세션에서 idkey를 가져온다
			if(id!=null && id.equals("admin1")){
			
		} else if(id !=null && !id.equals("admin1")) {
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");  
			script.println("location.href = './notice.jsp'");
			script.println("</script>");
		}
		if (id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = '../member/login.jsp'");
			script.println("</script>");
		}
		
		int board_code = 0;
		if(request.getParameter("board_code") != null){
			board_code = Integer.parseInt(request.getParameter("board_code")); 
		}
		
		if( board_code == 0){
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')"); 
			script.println("location.href = './notice.jsp'");
			script.println("</script>");
		}
		BoardDTO dto = new BoardDAO().getDetail(board_code); 
		
		if(id!=null && !id.equals("admin1")){ 
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");  
			script.println("location.href = ../'index.jsp'");
			script.println("</script>");
		} else{
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.delete(board_code); 
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글삭제에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href ='./notice.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>