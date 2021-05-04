<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.io.PrintWriter"%>
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
	ProductDAO productDAO = new ProductDAO();
	ProductDTO productDTO = productDAO.getProduct(product_code);
	String saler = productDTO.getUser_id();
	
	CashDAO cashDAO = new CashDAO();
	DeliveryDAO deliDAO = new DeliveryDAO();
	int deliResult = deliDAO.confirm(product_code);
	if(deliResult == 1){
		int wallet = cashDAO.count(saler);
		if(wallet == 1){
			int haveMoney = cashDAO.saleMoney1(product_code);
			if(haveMoney == 1){
				PrintWriter script = response.getWriter(); 
				script.println("<script>");
				script.println("alert('구매확정이되었습니다.')"); 
				script.println("location.href = './purchase_history.jsp'");
				script.println("</script>");
			}
		}else if(wallet == 0){
			int dhaveMoney = cashDAO.saleMoney2(product_code);
			if(dhaveMoney == 1){
				PrintWriter script = response.getWriter(); 
				script.println("<script>");
				script.println("alert('구매확정이되었습니다.')"); 
				script.println("location.href = './purchase_history.jsp'");
				script.println("</script>");
			}
		}
	}else{
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('구매확정에 실패하였습니다..')"); 
		script.println("location.href = './purchase_history.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>