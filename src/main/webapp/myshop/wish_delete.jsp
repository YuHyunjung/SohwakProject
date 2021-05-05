<%@page import="wish.WishDAO"%>
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
	String user_id = request.getParameter("user_id");
	WishDAO wish = new WishDAO();
	wish.deleteWish(user_id);
	out.println("<script>"
			  + "alert('장바구니 상품이 삭제되었습니다.');"
			  + "location.href = '../myshop/wish_list.jsp'"
			  + "</script>");
%>
</body>
</html>