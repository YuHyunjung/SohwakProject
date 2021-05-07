<%@page import="delivery.DeliveryDTO"%>
<%@page import="delivery.DeliveryDAO"%>
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
	 <script type="text/javascript" src="../javascript/countdown.js"></script>
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
		button{
			
			margin: 0 auto;
			
		}
</style>
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
						<th>최종낙찰자정보</th>
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
						DeliveryDAO deliDAO = new DeliveryDAO();
						DeliveryDTO deliDTO = deliDAO.deliveryHistory(productDTO.get(i).getProduct_code());
						int count = deliDAO.count(productDTO.get(i).getProduct_code());
				%>
					<tr>
						<td><img src="../file/<%=productDTO.get(i).getThumnail() %>" alt="상품이미지" class="product_img"></td>
						<td><%=productDTO.get(i).getCurrent_price() %><br>
							(<%=productDTO.get(i).getMin_price() %>원/<%=productDTO.get(i).getMax_price() %>)원</td>
						<td><div class="timer" attr-enddate="<%=productDTO.get(i).getEnd_date()%>" style="display:none;"><%=productDTO.get(i).getEnd_date()%></div></td>
						<td>
							<%
							if(productDTO.get(i).getState().equals("경매전")){
							%>
							입찰전<br>
							<a href="../product/regist_modify.jsp?product_code=<%=productDTO.get(i).getProduct_code()%>"><button type="submit" class="submit">상품수정</button></a>
							<a href="../product/product_delite.jsp?product_code=<%=productDTO.get(i).getProduct_code()%>"><button type="submit" class="submit">상품삭제</button></a>
							<%
							}else if(productDTO.get(i).getState().equals("경매중")){
							%>
							경매진행중<br>
							<a href="../product/detail.jsp?product_code=<%=productDTO.get(i).getProduct_code()%>">링크로이동</a>
							<a href="../product/regist_modify.jsp?product_code=<%=productDTO.get(i).getProduct_code()%>"><button type="submit" class="submit">상품수정</button></a>
							<%}else if(productDTO.get(i).getState().equals("경매종료")){ 
								if(count == 0){
									out.println("경매종료(배송지입력전)");
								}else if(deliDTO.getState().equals("배송지입력완료")){
							%>
								<p>송장번호입력</p>
								<form method="post" action="./post.jsp">
									<select name="delivery_company" id="delivery">
				                        <option value="대한통운" selected>대한통운</option>
				                        <option value="우체국">우체국</option>
				                        <option value="한진택배">한진택배</option>
				                     </select>
				                     <input type="text" placeholder="송장번호입력" name="tracking_no" required><br>
				                     <input type="hidden" value="<%=deliDTO.getProduct_code()%>" name="product_code">
				                     <button type="submit">등록</button>
			                     </form>
								<%}else if(deliDTO.getState().equals("송장입력완료")){	//송장입력완료
									out.println("배송중");
								}else if(deliDTO.getState().equals("구매확정")){	//구매확정
									out.println("판매완료");
								}
								}%>
						</td>
						<td>
						<%if(productDTO.get(i).getState().equals("경매종료")){ 
							if(count == 0){
								out.println("경매종료(배송지입력전)");
							}else if(deliDTO.getState().equals("배송지입력완료")){%>
						<p> 구매자이름 : <%=deliDTO.getReceiver() %><br>
							주소 : <%=deliDTO.getDelivery_address() %><br>
							전화번호 : <%=deliDTO.getDelivery_phone() %><br>
							배송메세지 : <%=deliDTO.getMessage() %>
						</p>
						<%}
							}%>
						</td>
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