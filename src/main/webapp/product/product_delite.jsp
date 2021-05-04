<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품삭제</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); 
		String id = (String) session.getAttribute("idKey");  //세션에서 idkey를 가져온다
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		ProductDAO productDAO = new ProductDAO();
		int result = productDAO.deleteProduct(product_code, id);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품 삭제에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품이 삭제되었습니다.')");
			script.println("location.href ='../myshop/sale_history.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>