<%@page import="java.io.PrintWriter"%>
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
	
	boolean result = service.auction(product_code, new_price, id);
	if(result){
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('입찰되었습니다.')"); 
		script.println("location.href = '../myshop/auction_history.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')"); 
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>