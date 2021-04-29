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
</style>

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
					for(int i=0;i<products.size();i++){
				%>
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
									<td style="font-size:9pt;"><%=products.get(i).getEnd_date()%></td>
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
			<a href="#none" class="prev"><img src="../img/prev_btn.png" alt="이전페이지"></a>
			<ol>
				<li><a href="./list.jsp?categoryNo=<%=category_no%>&page="></a></li>
			</ol>
			<a href="#none" class="next"><img src="../img/next_btn.png" alt="다음페이지"></a>
		</div>
	</div>
	
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>