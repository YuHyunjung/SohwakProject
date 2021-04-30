<%@ page import="product.ProductDTO"%>
<%@ page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>상품리스트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" href="../css/common.css">
<style>
	.titleArea{
		margin-top: 30px;
	}
	.titleArea>h2{
		border-bottom: 3px solid #999999; 
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
		padding-left:15px;
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
	.product_list{
		margin: 15px -2px;
	}
	.item{
		display: inline-block;
		margin: 0px 0px 30px 0px;
		width: 232px;
		padding: 0 4px;
	}
	.thumbnail{
		width: 100%;
		position: relative;
	}
	.thumbnail>a{
		display: block;
	}
	.thumbnail>a>img{
		max-width: 100%;
	}
	.description td{
		padding-left: 20px;
	}
	.product_name{
		margin: 0 auto;
		width: 215px;
		display: inline-block;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	.noProduct{
	    min-height: 300px;
    	line-height: 300px;
	}
	.noProduct>h1{
		text-align:center;
	}
</style>
<script>
	$(document).ready(function(){
	  tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
	})
</script>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	
	<!--메인컨텐츠-->
	<div class="container">
		<form action="" method="post" id="search_box">
			<input type="search" id="keyword" name="keyword">
			<input type="submit" id="submit_btn">
		</form>
		<div class="titleArea">
		<!--h2안에 제목만 바꿔주세요-->
			<h2>상품리스트</h2>
		</div>
		<ul class="product_list">
				<%
					int category_no = Integer.parseInt(request.getParameter("categoryNo"));
					ProductDAO productDAO = new ProductDAO();
					List<ProductDTO> products = productDAO.findProducts(category_no);
					if(products.size()==0){
				%>
					<div class="noProduct">
						<h1>등록된 상품이 없습니다.</h1>
					</div>
				<%	
					}
					for(int i=0;i<products.size();i++){
				%>
				<script>
					var stDate = new Date().getTime();
					var edDate = new Date("<%=products.get(i).getEnd_date()%>").getTime();
					var RemainDate = edDate - stDate;
					
					function msg_time(){
					  var days = Math.floor(RemainDate / (1000 * 60 * 60 * 24));
					  var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
					  var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
					  var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
					
					  m = days+"일 "+hours + "시 "+miniutes+"분 " + seconds+"초";
					  
					  document.all.timer.innerHTML = m;   // div 영역에 보여줌 
					  
					  if (RemainDate < 0) {      
						  clearInterval(tid);   // 타이머 해제
						    document.all.timer.innerHTML = "경매 종료";
						  	$('#timer').css("color","red");
					  }else{
					    RemainDate = RemainDate - 1000; // 남은시간 -1초
					  }
					}
				</script>
			<!--상품리스트-->
			<li class="item">
				<div class="thumbnail">
					<a href="./detail.jsp?product_code=<%=products.get(i).getProduct_code()%>">
						<img src="../file/<%=products.get(i).getThumnail() %>" alt="상품이미지" >
						<div class="description">
							<table>
								<tr>
									<th colspan="2" style="text-align: center;"><div class="product_name"><%=products.get(i).getProduct_name()%></div></th>
								</tr>
								<tr>
									<th>경매종료</th>
									<td style="font-size:9pt;"><div id="timer"></div></td>
								</tr>
								<tr>
									<th>최저가</th>
									<td><%=products.get(i).getMin_price()%></td>
								</tr>
								<tr>
									<th>최고가</th>
									<td><%=products.get(i).getMax_price()%></td>
								</tr>
								<tr>
									<th>현재입찰가</th>
									<td><%=products.get(i).getCurrent_price()%></td>
								</tr>
							</table>
						</div>
					</a>
				</div>
			</li>
			<%} %>
		</ul>
		<div class="paging">
		<!-- 
			<a href="#none" class="prev"><img src="../img/prev_btn.png" alt="이전페이지"></a>
			<ol>
				<li><a href="./list.jsp?categoryNo=<%=category_no%>&page="></a></li>
			</ol>
			<a href="#none" class="next"><img src="../img/next_btn.png" alt="다음페이지"></a> -->
		</div>
	</div>
	
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>