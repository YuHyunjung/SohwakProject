<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>마이페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<style>
		.titleArea{
			margin-top: 30px;
		}
		.titleArea>h2{
			border-bottom: 3px solid #999999;
			margin-bottom: 15px;
		}
		.contents{
			width: 900px;
			margin: 50px auto;
		}
		.btn{
			width: 145px;
			text-align: center;
		}
	</style>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<% if(id==null){
		response.sendRedirect("../member/login.jsp"); 
	}%>
	
	<div class="container">
		<div class="titleArea">
			<!--h2안에 제목만 바꿔주세요-->
			<h2>마이페이지</h2>
		</div>
		<div class="contents">
			<a href="../member/modify.jsp"><img src="../img/modify.png" alt="회원정보수정" class="btn"></a>
			<a href="./wish_list.jsp"><img src="../img/wishlist.png" alt="관심목록" class="btn"></a>
			<a href="./purchase_history.jsp"><img src="../img/purchase_history.png" alt="구매내역" class="btn"></a>
			<a href="./sale_history.jsp"><img src="../img/sale_history.png" alt="판매내역" class="btn"></a>
			<a href="./auction_history.jsp"><img src="../img/aution_history.png" alt="경매참여내역" class="btn"></a>
			<a href="./cash_recharge.jsp"><img src="../img/cash_history.png" alt="캐쉬관리" class="btn"></a>
		</div>
	</div>
	<!--푸터 -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>