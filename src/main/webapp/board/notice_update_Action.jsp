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

		request.setCharacterEncoding("UTF-8"); 
		String id = (String) session.getAttribute("idKey");  //세션에서 idkey를 가져온다
		if(id!=null && id.equals("admin1")){
			int board_code = Integer.parseInt(request.getParameter("board_code"));
			String title = request.getParameter("board_title");
			String description = request.getParameter("board_content");
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.update(board_code, title, description);
			if(result == 1){
				out.println("<script>alert('수정완료')");
				out.println("location.href='./notice.jsp';");
				out.println("</script>");
			}else{
				out.println("<script>alert('실패')");
				out.println("location.href='./notice.jsp';");
				out.println("</script>");
			}
			
		} else if(id !=null && !id.equals("admin1")) {
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");  
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
		}
		if (id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = './login.jsp'");
			script.println("</script>");
		}
		
		%>

</body>
</html>