<%@page import="delivery.DeliveryDTO"%>
<%@page import="delivery.DeliveryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDTO"%>
<%@ page import="product.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>구매내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<link rel="stylesheet" href="../css/common.css">
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
						<th>최종 낙찰가</th>
						<th>낙찰 시간</th>
						<th>송장번호</th>
						<th>판매자</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (id == null) { 
							response.sendRedirect("../index.jsp"); 
						} 
						ProductDAO productDAO = new ProductDAO();
						List<ProductDTO> productDTO = productDAO.purchaseHistory(id);
						for(int i=0; i<productDTO.size();i++){
					%>
					<tr>
						<td><img src="../file/<%=productDTO.get(i).getThumnail() %>" alt="상품이미지" class="product_img"></td>
						<td><%=productDTO.get(i).getCurrent_price() %>원</td>
						<td><%=productDTO.get(i).getEnd_date()%></td>
						<!-- 수정해야함 -->
						<td>
							<%
								DeliveryDAO deliDAO = new DeliveryDAO();
								DeliveryDTO deliDTO = deliDAO.deliveryHistory(productDTO.get(i).getProduct_code());
								if(deliDTO.getState() == null){
							%>
								 <a href="../product/order.jsp?product_code=<%=deliDTO.getProduct_code()%>">배송지입력</a>
							<%}else if(deliDTO.getState().equals("배송지입력완료")){
								out.println("송장입력대기");
							}else if(deliDTO.getState().equals("송장입력완료")){
							%>
							<%=deliDTO.getDelivery_company() %><br>
	                        <%=deliDTO.getTracking_no() %><br>
                        	<button type="button" onclick="confirm('구매확정하시겠습니까?');location.href='./confirm_purchase.jsp?product_code=<%=deliDTO.getProduct_code()%>'">구매확정</button>
							<%
							}else{
								out.println("구매확정완료");
							}
							%>
							
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