<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>경매참여내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<link rel="stylesheet" href="../css/common.css">
<script type="text/javascript" src="../javascript/countdown.js"></script>
<style>
	.titleArea {
		margin-top: 30px;
		border-bottom: 3px solid #999999;
		margin-bottom: 2px;
	}

	.titleArea>h2 {
		display: inline-block;
	}

	.titleArea>span {
		float: right;
		font-size: 8pt;
		margin-top: 14px;
	}

	.titleArea::after {
		clear: both;
		content: "";
		display: block;
	}

	table {
		text-align: center;
		width: 100%;
		border-collapse: separate;
		border-spacing: 0 10px;
		border-bottom: 2px solid #999999;
	}
	thead {
		background-color: #999999;

	}
	th {
		height: 35px;
		width: 20%;
		color: black;
		margin: 0px;
		font-size: 11pt;
	}
	.product_img {
		width: 135px;
	}
	td {
		font-size: 10pt;
	}
	td:first-child {
		border-right: 2px solid #999999;
	}
	td:last-child {
		border-left: 2px solid #999999;
	}
</style>
</head>
<body>
<!--헤더-->
<%@ include file="../common/header.jsp" %>
<!-- 로그인이 안되어있다면 index.jsp로 이동 -->

	<!--메인컨텐츠-->
	<div class="container">
		<div class="titleArea">
			<!--h2안에 제목만 바꿔주세요-->
			<h2>경매참여내역</h2>
		</div>
		<div class="contents">
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>최저가/최고가</th>
						<th>낙찰 남은 시간</th>
						<th>MY 경매금액</th>
						<th>판매자</th>
					</tr>
				</thead>
				<tbody>
				<%
					if (id == null) { 
						response.sendRedirect("../index.jsp"); 
					} 
					ProductDAO productDAO = new ProductDAO();
					List<ProductDTO> productDTO = productDAO.attendAuction(id);
					for(int i=0; i<productDTO.size();i++){
				%>
					<tr>
						<td><img src="../file/<%=productDTO.get(i).getThumnail() %>" alt="상품이미지" class="product_img"></td>
						<td><%=productDTO.get(i).getMin_price() %>원/<%=productDTO.get(i).getMax_price() %>원</td>
						<td><div class="timer" attr-enddate="<%=productDTO.get(i).getEnd_date()%>"></div></td>
						<td><%=productDTO.get(i).getCurrent_price() %>원<br><button type="button" onclick="location.href='../product/detail.jsp?product_code=<%=productDTO.get(i).getProduct_code()%>'">링크로이동</button>
						</td>
						<td><%=productDTO.get(i).getUser_id() %></td>
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