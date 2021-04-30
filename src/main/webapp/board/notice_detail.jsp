<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.io.PrintWriter" %>
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
       <table>
		   <thead>
           <tr>
               <th>제목</th>
               <th>내용</th>
			   <th>작성일</th>
           </tr></thead>
		   <tbody>
		   <%
			String userID = null;
			if(session.getAttribute("idKey") != null){ 
			userID = (String) session.getAttribute("idKey");
			}	
		
			int board_code = 0;
			if(request.getParameter("board_code") != null){ 
			board_code = Integer.parseInt(request.getParameter("board_code")); 
			}
		
			if( board_code == 0){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')"); 
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
			}
			BoardDTO dto = new BoardDAO().getDetail(board_code);
			%>
           <tr>
               <td><%=dto.getTitle() %></td>
               <td><%=dto.getDiscriprion() %></td>
			   <td><%=dto.getBoard_date() %></td>
           </tr></tbody>
		   
       </table>
        <fieldset>
            <input type="button" value="목록" onclick="location.href='notice.jsp'"/>
            <%
				if(userID != null && userID.equals(session.getAttribute("idkey"))){
			%>
			<input type="button" value="수정" onclick="location.href='update.jsp?board_code=<%=board_code%>'"/>
			<input type="button" value="삭제" onclick="confirm('글을 삭제하시겠습니까?');location.href=notice_delete.jsp?board_code=<%=board_code%>'"/>
        </fieldset>
        <%
        }
        %>
    </div>
	</div>


	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>