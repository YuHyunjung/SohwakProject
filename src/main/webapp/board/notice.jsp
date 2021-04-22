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
	<link rel="stylesheet" href="../css/notice_main.css">
</head>
<script></script>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	
	<!-- 게시판 메인 -->
	<div class="container">
		<div class="titleArea">
			<h2>Notice</h2>
		</div>
	
    <form action="" method="POST" target="">
       <table>
           <tr>
               <th>번호</th>
               <th class="B">제목</th>
               <th>작성자</th>
               <th>작성일</th>
               <th>조회</th>
           </tr>
           <tr>
               <td>1</td>
               <td><a href="notice_detail.html">사이트리뉴얼로 로그인방법 변경</a></td>
               <td>소확마켓</td>
               <td>2021-02-15</td>
               <td>123</td>
           </tr>
           <tr>
               <td>2</td>
               <td><a href="notice_detail.html">2021년 회원등급별 혜택</a></td>
               <td>소확마켓</td>
               <td>2021-02-15</td>
               <td>123</td>
           </tr>
           <tr>
               <td>3</td>
               <td><a href="/html/board/notice_detail.html">역대급할인 이벤트</a></td>
               <td>소확마켓</td>
               <td>2021-02-15</td>
               <td>123</td>
           </tr>
       </table>
		<div class="paging">
			<a href="#none" class="prev"><img src="/img/prev_btn.png" alt="이전페이지"></a>
			<ol>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ol>
			<a href="#none" class="next"><img src="/img/next_btn.png" alt="다음페이지"></a>
		</div>
        <fieldset>
            <span>검색어</span>
            <select name="searchType" id="searchType">
	            <option value="제목">제목</option>
                <option value="글쓴이">글쓴이</option>
                <option value="아이디">아이디</option>
            </select>

            <input type="text" name="searchType1" id="searchType1" size="30">
            <input type="submit" id="submit" name="submit" value="찾기">
            <input type="button" id="submit" name="submit" value="글쓰기" onclick="location.href='/html/board/notice_write.html'">
        </fieldset>
    </form>
    </div>
    
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>