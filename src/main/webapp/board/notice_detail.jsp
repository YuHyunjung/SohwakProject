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
	<link rel="stylesheet" href="../css/notice_detail.css">
</head>
<script></script>
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
               <th>작성자</th>
			   <th>작성일</th>
           </tr></thead>
		   <tbody>
           <tr>
               <td>사이트리뉴얼로 로그인방법 변경</td>
               <td>관리자</td>
			   <td>2021-03-01</td>
           </tr></tbody>
		   
       </table>
	   <div class="description">
		<p>사이트디자인 리뉴얼로 인해 로그인이 안되시는 분들이 계실 수 있습니다.</p>
		<p>사이트디자인 리뉴얼로 인해 로그인이 안되시는 분들이 계실 수 있습니다.</p>
		<p>사이트디자인 리뉴얼로 인해 로그인이 안되시는 분들이 계실 수 있습니다.</p>
		<p>사이트디자인 리뉴얼로 인해 로그인이 안되시는 분들이 계실 수 있습니다.</p>
	</div>

        <fieldset>
            <input type="button" id="submit" name="submit" value="목록" onclick="location.href='/html/board/notice.html'">
			<input type="button" id="modify" name="modify" value="수정" onclick="location.href='/html/board/notice_modify.html'">
        </fieldset>
    </form>
    </div>
	</div>


	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>