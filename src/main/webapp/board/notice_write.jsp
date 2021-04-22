<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원가입</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/notice_write.css">
</head>
<script></script>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>

	<!-- 공지사항 -->
	<div class="container">
		<div class="titleArea">
			<h2>공지사항작성</h2>
		</div>
		<form action="" method="POST" target="">
            <table>
            	<tr>
            		<th>제목</th>
            		<td><input type="text" name="intro" id="intro"></td>
            	</tr>
            	<tr>
            		<th>내용</th>
            		<td><textarea name="contents" id="" cols="55" rows="20"></textarea></td>
            	</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="addfile" id="addfile"> *2MB까지 가능</td>
				</tr>
			</table>
           <div class="btn_area">
				<input type="submit" name="submit" id="submit" value="등록">
				<input type="reset" name="reset" id="reset" value="다시작성하기">
            </div>
		</form>
	</div>

	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>