<%@page import="wish.WishDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wish.WishDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>장바구니</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		
		.allDelButton{
            float: right;
			margin-top: 10px;
        }
        .contents img{
		    width: 195px;
	}
	</style>
<script>
	function fn_deleteAll(){
		$("#wish_form").submit();
	}
</script>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<!--메인컨텐츠-->
	<form id="wish_form" action="wish_delete.jsp">
		<input type="hidden" id="user_id" name="user_id" value="<%=id%>">;
	</form>
	<div class="container">
		<div class="titleArea">
			<h2>장바구니</h2>
		</div>
		<div class="contents">
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>현재입찰가</th>
						<th>낙찰 남은 시간</th>
						<th>입찰 참가 여부</th>
						<th>판매자</th>
					</tr>
				</thead>
				<tbody>
				<%
				WishDAO wishDAO = new WishDAO();
				List<WishDTO> products = new ArrayList<WishDTO>();
				products = wishDAO.wishList(id);
				for(int i =0; i< products.size(); i++){
				%>

					<tr>
						<td><img src="../file/<%=products.get(i).getThumnail() %>" alt="상품이미지" ></td>
						<td><%=products.get(i).getCurrent_price()%></td>
						<td style="font-size:9pt;"><div class="timer" attr-enddate="<%=products.get(i).getEnd_date()%>" style="display:none;"><%=products.get(i).getEnd_date()%></div></td>
						<td><button type="button" onclick="location.href='../product/detail.jsp?product_code=<%=products.get(i).getProduct_code()%>'">링크로이동</button></td>
						<td><%=products.get(i).getUser_id() %></td>
					</tr>
					
				</tbody>
				<%} %>
			</table>
		</div>
		<button type="button" onclick="javascript:fn_deleteAll();" class="allDelButton">전체삭제</button>
	</div>
	
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>