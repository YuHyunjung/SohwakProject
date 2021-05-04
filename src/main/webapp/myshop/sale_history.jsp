<%@page import="java.util.ArrayList"%>
<%@ page import="product.ProductDTO"%>
<%@ page import="product.ProductDAO"%>
<jsp:useBean id="dao" class="product.ProductDAO" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="product.CategoryDTO"%>
<%@ page import="product.CategoryDAO"%>

<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>판매내역</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" href="../css/common.css">
<style>
	.titleArea{
			margin-top: 30px;
			border-bottom: 3px solid #999999; 
			margin-bottom: 2px;
		}
		.titleArea>h2{
			display: inline-block;
		}
		.titleArea>span{
			float: right;
			font-size: 8pt;
			margin-top: 14px;
		}
		.titleArea::after{
			clear: both;
			content: "";
			display: block;
		}
		table{
			text-align: center;
			width: 100%;
			border-collapse: separate;
			border-spacing: 0 10px;
			border-bottom: 2px solid #999999;
		}
		thead{
			background-color: #999999;
			
		}
		th{
			height: 35px;
			width: 20%;
			color: black;
			margin: 0px;
			font-size: 11pt;
		}
        tr{
            border-left: 2px solid #999999;
        }
		.product_img{
			width: 135px;
		}
		td{
			font-size: 10pt;
		}
		td:first-child{
			border-right: 2px solid #999999;
		}
		td:last-child{
			border-left: 2px solid #999999;
		}
</style>
<script>
$(document).ready(function(){
	  setTimerrr();
	})
	
	function setTimerrr() {
		var timers = $(".timer")
		timers.each(function(index,timer) {
			tid=setInterval(msg_time, 1000, timer);
		})
	}
	
	function msg_time(timer){
		var nowDate = new Date().getTime();
		var endDate = new Date($(timer).attr("attr-enddate")).getTime();
		var RemainDate = endDate - nowDate;
		
	  var days = Math.floor(RemainDate / (1000 * 60 * 60 * 24));
	  var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
	  var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
	  var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
	
	  m = days+"일 "+hours + "시 "+miniutes+"분 " + seconds+"초";
	  
	  $(timer).html(m);   // div 영역에 보여줌 
	  
	  if (RemainDate < 0) {      
		 //clearInterval(tid);   // 타이머 해제
		 $(timer).text("경매 종료");
		 $(timer).css("color","red");
	  }else{
	    RemainDate = RemainDate - 1000; // 남은시간 -1초
	  }
	}
</script>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	
	<!--메인컨텐츠-->
	<div class="container">
		<div class="titleArea">
			<!--h2안에 제목만 바꿔주세요-->
			<h2>판매내역</h2>
		</div>
		<div class="contents">
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>현재입찰가(최저가/최고가)</th>
						<th>낙찰 남은 시간</th>
						<th>현재 상태</th>
						<th>현재 입찰구매자</th>
					</tr>
				</thead>
				<tbody>
				<%
					if (id == null) { 
						response.sendRedirect("../index.jsp"); 
					} 
					ProductDAO productDAO = new ProductDAO();
					List<ProductDTO> productDTO = productDAO.purchaseList(id);
					for(int i=0; i<productDTO.size();i++){
				%>
					<tr>
						<td><img src="../file/<%=productDTO.get(i).getThumnail() %>" alt="상품이미지" class="product_img"></td>
						<td><%=productDTO.get(i).getMin_price() %>원/<%=productDTO.get(i).getMax_price() %>원</td>
						<td><div class="timer" attr-enddate="<%=productDTO.get(i).getEnd_date()%>"></div></td>
						<td><p>경매진행중</p><button type="button" onclick="location.href='/html/product/detail.html'">링크로이동</button>
						<br>
						<button type="button" onclick="location.href='/html/product/regist_modify.html'">상품수정</button></td>
						<td>입찰자입니당</td>
					</tr>
					<tr>
						<td><img src="/img/examlist.jpg" alt="상품이미지" class="product_img"></td>
						<td>100,000원/200,000원</td>
						<td>00일 00시 00분</td>
						<td><p>경매완료(결제전)</p></td>
						<td>입찰자입니당</td>
					</tr>
					<tr>
						<td><img src="/img/examlist.jpg" alt="상품이미지" class="product_img"></td>
						<td>100,000원/200,000원</td>
						<td>00일 00시 00분</td>
						<td><p>경매완료(결제완료)</p>
							<select name="delivery" id="delivery">
								<option value="" selected disabled>택배사선택</option>
								<option value="대한통운">대한통운</option>
								<option value="우체국">우체국</option>
								<option value="한진택배">한진택배</option>
							</select>
							<input type="text" placeholder="송장번호입력"><br>
							<button>등록</button></td>
							
						<td>입찰자입니당</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</div>
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>