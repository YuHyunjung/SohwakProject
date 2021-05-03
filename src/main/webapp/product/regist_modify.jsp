<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="sun.java2d.pipe.SpanShapeRenderer.Simple"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>상품수정</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="../css/common.css">
	<style>
		.titleArea{
			margin-top: 30px;
		}
		.titleArea>h2{
			border-bottom: 3px solid #999999; 
		}
		table{
			margin: 30px auto;
			border-spacing: 0 10px;
		}
		.regist th{
			text-align: left;
			padding-right: 100px;
		}
		.regist input, .regist select{
			width: 380px;
			height: 30px;
			border-radius: 10px;
   			border: 1px solid #999999;
		}
		.regist input[type=file]{
			border-style: none;
			border-radius: unset;
		}
		.regist input[name=end_date]{
			width: 190px;
		}
		td>span{
			font-size: 9pt;
		}
		button{
			width: 200px;
			height: 45px;
			border: none;
			color: white;
		}
		.btn_area{
			margin: 0 auto;
			width: 406px;
		}
		#cancel{
			background-color: #999999;
		}
		#submit{
			background-color: #668efd;
		}
		#end_time{
			width:183px;
		}
	</style>
	
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<!--메인컨텐츠-->
	<%
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	int product_code = Integer.parseInt(request.getParameter("product_code"));
	ProductDAO productDAO = new ProductDAO();
	ProductDTO productDTO = productDAO.getProduct(product_code);
	%>
	<div class="container">
		<div class="titleArea">
			<h2>상품수정</h2>
		</div>
		<div class="regist">
		<form method="post" id="modify" enctype="multipart/form-data" action="./registmodify_result.jsp?product_code=<%=productDTO.getProduct_code()%>">
			<table>
				<tr>
					<th>대표이미지</th>
					<td>
						<input type="file" accept="image/*" id="thumbnail_img" name="thrumbnail_img">
						<img id="load_img">
						<span>*필수 항목입니다.</span>
					</td>
				</tr>
				<tr>
					<th>이미지1</th>
					<td>
						<input type="file" accept="image/*" id="product_img1" name="product_img1" >
						<img id="load_img">
					</td>
				</tr>
				<tr>
					<th>이미지2</th>
					<td>
						<input type="file" accept="image/*" id="product_img2" name="product_img2" >
						<img id="load_img">
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>
						<input type="text" id="pruduct_name" name="pruduct_name" value="<%=productDTO.getProduct_name()%>">
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<%if(productDTO.getCategory_no()==1){
							out.println("디지털/가전");
						}else if(productDTO.getCategory_no()==2){
							out.println("생활/가공식품");
						}else if(productDTO.getCategory_no()==3){
							out.println("유아동");
						}else if(productDTO.getCategory_no()==4){
							out.println("생활/가공식품");
						}else if(productDTO.getCategory_no()==5){
							out.println("스포츠/레저");
						}else if(productDTO.getCategory_no()==6){
							out.println("패션");
						}else if(productDTO.getCategory_no()==7){
							out.println("뷰티/미용");
						}else if(productDTO.getCategory_no()==8){
							out.println("반려동물용품");
						}else if(productDTO.getCategory_no()==9){
							out.println("기타중고물품");
						}
						%>
					</td>
				</tr>
				<tr>
					<th>최저가</th>
					<td>
						<%=productDTO.getMin_price()%>
					</td>
				</tr>
				<tr>
					<th>최고가</th>
					<td>
						<%=productDTO.getMax_price() %>
					</td>
				</tr>
				<tr>
					<th>경매종료일</th>
					<td>
						<%=productDTO.getEnd_date() %>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: top;">상품설명</th>
					<td>
						<textarea name="description" id="description" cols="55" rows="10">
							<%=productDTO.getDiscription() %>
						</textarea>
					</td>
				</tr>
			</table>
			<div class="btn_area">
				<button type="button" onclick="location.href='../index.jsp'" id="cancel">취소</button>
				<button type="submit" onclick="modify()" id="submit">수정</button>
			</div>
		</form>
		</div>
	</div>
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>