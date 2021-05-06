<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="cash.CashDTO" %>
<%@ page import="cash.CashDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>캐쉬관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<link rel="stylesheet" href="../css/common.css">
<style>
		.titleArea{
			margin-top: 30px;
		}
		.titleArea>h2{
			border-bottom: 3px solid #999999;
			margin-bottom: 15px;
		}
		.contents{
			width: 873px;
			margin: 50px auto;
		}
		table{
			width: 100%;
			text-align: center;
			border-top: 1px solid #999999;
			border-collapse: collapse;
		}
		thead{
			border-bottom: 3px solid #668efd!important;
		}
		th,td{
			border-bottom: 1px solid #999999;
			padding: 10px;
		}
		.btn_area{
			float: right;
		}
		.btn{
			display: inline-block;
			width: 130px;
			height: 30px;
			background-color: #668efd;
			line-height: 30px;
			text-align: center;
			color: white;
			font-weight: bold;
			margin-bottom: 15px;
		}
	</style>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<% if(id==null){
		response.sendRedirect("../member/login.jsp"); 
	}%>
	
	
	<%
		ProductDAO productDAO = new ProductDAO();
		CashDAO cashDAO = new CashDAO();
		Vector<CashDTO> v = cashDAO.chargeCashList(id);
		
	%>
	<!--메인컨텐츠-->
	<div class="container">
		<div class="titleArea">
			<h2>캐쉬관리</h2>
		</div>
		<div class="contents">
			<div class="btn_area">

				<a href="./cash_recharge.jsp"><div class="btn deposit">충전</div></a>
				<a href="./cash_withdrawal.jsp"><div class="btn withdraw">출금</div></a>
			</div>
			<table>
			
				<thead>
					<th>일자</th>
					<th>충전/출금</th>
					<th>금액</th>
					<th>총액</th>
				</thead>
				<tbody>
				<%
           		for(int i=0; i<v.size();i++){
           			ProductDTO producDTO = productDAO.getProduct(v.get(i).getProduct_code());
          		 %>
					<tr>
						<td><%=v.get(i).getDatetime()%></td> <!-- 날짜,시간 -->
						<td><%if(v.get(i).getCharge_withdraw().equals("입찰 보증금") || v.get(i).getCharge_withdraw().equals("보증금 환불")){
								out.println("상품명: \'"+producDTO.getProduct_name()+"\'");
							}
							%>
							<%=v.get(i).getCharge_withdraw()%>
						</td>  <!-- 충전, 출금 -->
						<td><%
							if(!v.get(i).getCharge_withdraw().equals("입찰 보증금")){
						%>+<%}%><%=v.get(i).getAmount()%></td>  <!-- 금액 -->
						<td><%=v.get(i).getTotal()%></td>  <!-- 총액 -->
					</tr>
				<%
				}
				%>
				</tbody>
			</table>
		</div>
	</div>

<!--푸터-->
<%@ include file="../common/footer.jsp" %>

</body>
</html>