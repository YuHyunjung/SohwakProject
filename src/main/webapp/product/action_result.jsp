<%@page import="product.AuctionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); 
	String id = (String) session.getAttribute("idKey"); 
	AuctionService service = new AuctionService();
	int product_code = Integer.parseInt(request.getParameter("product_code"));
	int new_price = Integer.parseInt(request.getParameter("price"));
	
	service.auction(product_code, new_price, id);
%>
</body>
</html>