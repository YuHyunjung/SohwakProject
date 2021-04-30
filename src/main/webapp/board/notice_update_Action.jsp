<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("idKey") != null){
			userID = (String) session.getAttribute("idKey");
		}
		
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
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
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
		BoardDTO dto = new BoardDAO().getDetail(board_code);  
		if(!userID.equals(session.getAttribute("idKey"))){ 
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");  
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
			
			
		} else{
			if(request.getParameter("title") == null||request.getParameter("discriprion") == null ||
					request.getParameter("title").equals("")||request.getParameter("discriprion").equals("")){
				//입력받은 사항에 null이나 ""이 있는 경우 다시 입력하도록 수정페이지로 돌아감
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.update(board_code, request.getParameter("title"), request.getParameter("discriprion"));
				
			
				if (result == -1) { //수정 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else { 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'notice.jsp'");
					script.println("</script>");
				}
			}
		}
	%>

</body>
</html>