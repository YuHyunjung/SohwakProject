<%@page import="delivery.DeliveryDAO"%>
<%@page import="cash.CashDAO"%>
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
	int product_code=Integer.parseInt(request.getParameter("product_code"));
	
	CashDAO cashDAO = new CashDAO();
	DeliveryDAO deliDAO = new DeliveryDAO();
	int deliResult = deliDAO.confirm(product_code);
	if(deliResult==1){
		int cashResult = cashDAO.saleMoney(product_code);
	}
%>
</body>
</html>