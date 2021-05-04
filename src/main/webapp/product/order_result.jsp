<%@page import="java.io.PrintWriter"%>
<%@page import="delivery.DeliveryDAO"%>
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
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		String name = request.getParameter("name");
		
		String zipNo = request.getParameter("zipNo");
		String addr = request.getParameter("addr");
		String addrDetail = request.getParameter("addrDetail");
		String address = zipNo+" " +addr+" " +addrDetail;
		
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		
		DeliveryDAO deliveryDAO = new DeliveryDAO();
		int result = deliveryDAO.infoDelivery(product_code, name, address, phone, message);
		if(result == 1){
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('배송지를 입력하였습니다.')");  
			script.println("location.href = '../myshop/purchase_history.jsp'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('배송지 입력에 실패하였습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>