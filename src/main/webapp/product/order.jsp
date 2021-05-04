<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>주문하기</title>
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
		.container{
			width: 860px;
			margin: 0 auto;
		}
		table{
			width: 100%;
			margin: 20px auto;
			text-align: center;
		}
		.product_img{
			width: 150px;
		}
		.info table{
			border-spacing: 0 10px;
		}
		.info th{
			text-align: left;
			font-size: 13pt;
			padding-right: 40px;
		}
		.payment>h3{
			border-bottom: 2px solid #999999;
			margin-bottom: 10px;
		}
		.payment span{
			float: right;
			font-weight: bolder;
			font-size: 15pt;
		}
		.order{
			width: 300px;
			height: 45px;
			color: white;
			background-color: #668efd;
			border: none;
			margin: 40px auto;
			display: block;
		}
		input[type=text]{
			width: 313px;
			height: 30px;
		}
		input[type=tel]{
			width: 90px;
			height: 30px;
		}
	</style>

</head>
<body>
	<!-- 헤더 -->
	<%@ include file="../common/header.jsp" %>
	<%
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		ProductDAO productDAO = new ProductDAO();
		ProductDTO productDTO = productDAO.getProduct(product_code);
		if(id!=null && !id.equals(productDTO.getBidder())){
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");  
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
		}
		if(id == null){
			response.sendRedirect("../index.jsp");
		}
		if(!productDTO.getState().equals("경매종료")){
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");  
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
		}
	%>	
	<div class="container">
		<div class="titleArea">
			<h2>주문하기</h2>
		</div>
		<div class="order_method">
			<div class="product_area">
				<table>
					<thead>
						<tr class="top_table">
							<th width="20%">상품이미지</th>
							<th width="55%">상품명</th>
							<th width="20%">최종낙찰가</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="../file/<%=productDTO.getThumnail() %>" alt="상품이미지" class="product_img"></td>
							<td><%=productDTO.getProduct_name() %></td>
							<td><%=productDTO.getCurrent_price() %>원</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<form class="info" method="post" action="order_result.jsp">
				<table>
					<tr>
						<th>주문자*</th>
						<td><input type="text" name="name" id="name" value="<%=productDTO.getBidder() %>" required></td>
					</tr>
					<tr>
						<th>주소*</th>
						<td>						
						<input type="text" class="zip_code" id="zipNo" readonly style="width:250px!important;" name="zipNo" > 
						<button type="button" class="zip_code_btn" onclick="javascript:goPopup();">우편번호</button><br/> 
						<input type="text" placeholder="기본 주소를 입력해 주세요" id="addr" name="addr" readonly required><br/> 
						<input type="text" placeholder="나머지 주소를 입력해 주세요" id="addrDetail" name="addrDetail" required>
							<script>
								var goPopup = function(){ 
									var pop = window.open("./address.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
								} 
								var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){ 
									document.getElementById("zipNo").value = zipNo; 
									document.getElementById("addr").value = roadAddrPart1; 
									if(addrDetail.length>30){ 
										alert('상세주소가 너무 길어 다시 입력해야 합니다.'); 
										return; 
									} 
									document.getElementById("addrDetail").value = addrDetail; 
								} 
							</script>
						</td>
					</tr>
					<tr>
						<th>전화번호*</th>
						<td>
							<input type="text" id="phone" name="phone" size="11" maxlength="11" placeholder="-빼고 입력해주세요" required>
						</td>
					</tr>
					<tr>
						<th style="vertical-align:top">배송메세지</th>
						<td><textarea name="message" id="message" cols="45" rows="10"></textarea></td>
					</tr>
				</table>
				<input type="hidden" value="<%=productDTO.getProduct_code()%>" name="product_code">
				<button type="submit" class="order">주문서작성완료</button> 
			</form>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>