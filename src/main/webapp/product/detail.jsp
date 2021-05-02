<%@page import="cash.CashDTO"%>
<%@page import="cash.CashDAO"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>상품상세보기</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script type="text/javascript" src="../javascript/slideShow.js"></script>
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" href="../css/common.css">
	<style>
		.titleArea{
			margin-top: 30px;
		}
		.titleArea>h2{
			border-bottom: 3px solid #999999;
			margin-bottom: 15px;
		}
		#search_box{
			width: 600px;
			margin: 0 auto;
		}
		#keyword{
			width: 500px;
			height: 40px;
			border-radius: 10px;
			border: none;
			background-color: #999999;
			color: white;
			font-size: 16pt;
			padding-left: 15px;
		}
		input#submit_btn{
			background-image: url(../img/search_btn.png);
			background-repeat: no-repeat;
			background-size: 40px;
			width: 40px;
			height:40px;
			border: none;
			text-indent: -1000px;
			background-color: white;
		}
		.top{
			height: 450px;
		}
		.imgArea{
			display: inline-block;
			float: left;
			width: 45%;
		}
		.slideshow-container {
		  width: 100%;
		  margin: 0 auto;
		}
		.dots_box{
			text-align: center;
		}
		.dot {
		  height: 15px;
		  width: 15px;
		  margin: 0 2px;
		  background-color: #999999;
		  border-radius: 50%;
		  display: inline-block;
		  transition: background-color 0.4s ease;
			cursor: pointer;
		}
		.dot.active{
			background-color: #668efd;
		}
		.slide>a>img{
			width:100%;
			max-height:380px;
		}
		.sub_detail{
			display: inline-block;
			float: right;
			width: 50%;
			margin-top: 38px;
		}
		table{
			border-collapse: separate;
			border-spacing: 0 16px;
		}
		.sub_detail th{
			text-align: left;
			padding-right: 40px;
			width: 35%
		}
		.sub_detail th, .sub_detail td{
			font-size: 15pt
		}
		.product_name{
			width: 100%;
			display: inline-block;
			overflow:hidden;
			text-overflow:ellipsis;
			white-space:nowrap;
			font-size: 19pt;
  			color: #757575
		}
		#price{
			height: 40px;
			width: 200px;
			border-radius: 10px;
		}
		.submit, .wish_list{
			width: 100px;
			height: 40px;
			background-color: #668efd;
			border-style: none;
			color: white;
		}
		.submit:hover, .wish_list:hover{
			background-color: #999999;
		}
		.top::after{
			clear: both;
			content: "";
			display: block;
		}
		.description{
			width: 90%;
			margin: 0 auto;
			border: 1px solid #999999;
			margin-top: 30px;
			padding: 20px;
		}
	</style>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<%			
		request.setCharacterEncoding("utf-8");
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		ProductDAO productDAO = new ProductDAO();
		ProductDTO productDTO = productDAO.getProduct(product_code);
		
		CashDAO cashDAO = new CashDAO();
		CashDTO cashDTO = cashDAO.infoCash(id);
	
		
	%>
	<script>
		function auction(){
			if($("#price").val() == ""){
				alert("입찰가를 입력해 주세요");
				return
			}
			if($("#price").val() < "<%=productDTO.getCurrent_price()%>"){
				alert("현재입찰가보다 낮게 입력 할 수 없습니다.");
				return;
			}
			if($("#price").val() == "<%=productDTO.getCurrent_price()%>"){
				alert("현재입찰가와 같게 입력 할 수 없습니다.");
				return;
			}
			if($("#price").val() > "<%=productDTO.getMax_price()%>"){
				alert("최고가보다 높게 입력할 수 없습니다.");
				return;
			}
			if($("#price").val() > "<%=cashDTO.getAmount()%>"){
				alert("금액이 부족합니다 충전 후 다시 이용해주세요.");
				return;
			}
			$("#auction").attr("action","./action_result.jsp");
		}
	</script>
	<!--메인컨텐츠-->
	<div class="container">
		<form action="" method="post" id="search_box">
			<input type="search" id="keyword" name="keyword">
			<input type="submit" value="제출" id="submit_btn">
		</form>
		<div class="titleArea">
			<h2>상품상세</h2>
		</div>
		<div class="detail">
			<div class="top">
				<div class="imgArea">
					<div class="slideshow-container">
						<div class="slide fade">
							<a href="#">
								<img src="../file/<%=productDTO.getThumnail()%>" alt="슬라이드1">
							</a>
						</div>
						<%if(productDTO.getImg1()!=null){ %>
						<div class="slide fade">
							<a href="#">
								<img src="../file/<%=productDTO.getImg1()%>" alt="슬라이드2">
							</a>
						</div>
						<%}
						if(productDTO.getImg2()!=null){ 
						%>
						<div class="slide fade">
							<a href="#">
								<img src="../file/<%=productDTO.getImg2()%>" alt="슬라이드2">
							</a>
						</div>
						<%} %>
					</div>
					<div class="dots_box">
						<span class="dot" onclick="current(0)"></span>
						<%if(productDTO.getImg1()!=null){ %>
						<span class="dot" onclick="current(1)"></span>
						<%}
						if(productDTO.getImg2()!=null){ 
						%>
						<span class="dot" onclick="current(2)"></span>
						<% }%>
					</div>
				</div>
				<div class="sub_detail">
					<table>
						<tr>
							<th colspan="2"><div class="product_name"><%=productDTO.getProduct_name() %></div></th>
						</tr>
						<tr>
							<th>판매자</th>
							<td><%=productDTO.getUser_id()%></td>
						</tr>
						<tr>
							<th>타임</th>
								<script>
									$(document).ready(function(){
									  tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
									});
									 
									var stDate = new Date().getTime();
									var edDate = new Date("<%=productDTO.getEnd_date()%>").getTime();
									var RemainDate = edDate - stDate;
									
									function msg_time(){
									  var days = Math.floor(RemainDate / (1000 * 60 * 60 * 24));
									  var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
									  var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
									  var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
									
									  m = days+"일 "+hours + "시 "+miniutes+"분 " + seconds+"초";
									  
									  document.all.timer.innerHTML = m;   // div 영역에 보여줌 
									  
									  if (RemainDate < 0) {      
									    // 시간이 종료 되었으면..
									    clearInterval(tid);   // 타이머 해제
									    $('#price').css("display","none");
									    $('#submit').css("display","none");
									    $('#wish_list').css("display","none");
									    document.all.timer.innerHTML = "경매가 종료되었습니다.";
									  }else{
									    RemainDate = RemainDate - 1000; // 남은시간 -1초
									  }
									}
								</script>
							<td><div id="timer"></div></td>
						</tr>
						<tr>
							<th>최저가</th>
							<td><%=productDTO.getMin_price() %></td>
						</tr>
						<tr>
							<th>최고가</th>
							<td><%=productDTO.getMax_price() %></td>
						</tr>
						<tr>
							<th>현재입찰가</th>
							<td><%=productDTO.getCurrent_price() %></td>
						
						</tr>
					</table>
					<%if(id == null){ %>
						<p>로그인 후 경매 참여가능합니다.</p>
					<% }else if(id !=null && id.equals(productDTO.getUser_id())){%>	
						<p>해당 상품 판매자는 경매에 참여 하실 수 없습니다.</p>
					<% }else{%>
					<form method="post" style="display:inline;" id="auction">
						<input type="hidden" name="product_code" value="<%=productDTO.getProduct_code() %>">
						<input type="number" placeholder="희망입찰가" name="price" id="price" step="100">
						<button type="submit" class="submit" onclick="auction()" id="submit">입찰하기</button>
						<button type="button" class="wish_list" onclick="location.href='./myshop/wish_list.jsp'" id="wish_list">장바구니</button>
					</form>
					<%} %>
				</div>
			</div>
			<div class="description">
				<%=productDTO.getDiscription()%> 
			</div>
		</div>
	</div>
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>