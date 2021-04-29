<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
</head>
<script>
	function Insert(){
		var insertFrame = document.insertFrame;
		if(!insertFrame.board_title.value){
			alert("글 제목을 작성해주세요");
			insertFrame.board_title.focus();
			return;
		}
		
		if(!insertFrame.board_content.value){
			alert("글 내용을 작성해주세요");
			insertFrame.board_content.focus();
			return;
		}
		
		insertFrame.submit();
	}
	
</script><!-- 일단 냅둠 -->
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>

	<!-- 공지사항 -->
	
	<%
		String userID = null;
		if (session.getAttribute("idkey") != null) {
			userID = (String)session.getAttribute("idkey");
		}
	%>
	<div class="container">
		<div class="titleArea">
			<h2>공지사항작성</h2>
		</div>
		<form action="board_AddAction.jsp" method="POST">
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
				<input type="submit" class="submit" Onclick="insert()" value="등록">
				<input type="reset" name="reset" id="reset" value="다시작성하기">
            </div>
		</form>
	</div>
	
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>