<%@page import="java.io.PrintWriter"%>
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
	String id = (String) session.getAttribute("idKey"); 
	int product_code = Integer.parseInt(request.getParameter("product_code"));
	WishDAO wishDAO = new WishDAO();
	int check = wishDAO.check(product_code, id);
	if(check==1){
		int result = wishDAO.wish(product_code, id);
		if(result == 1){
			PrintWriter script = response.getWriter(); 
			script.println("<script>");
			script.println("alert('장바구니에 등록되었습니다.')");  
			script.println("location.href = '../myshop/wish_list.jsp'");
			script.println("</script>");
		}else{
			out.println("<script>"
					  + "alert('장바구니등록에 실패하였습니다. 다시이용해주세요');"
					  + "history.go(-1);"
					  + "</script>");
		}
	}else if(check == 0){
		out.println("<script>"
					  + "alert('이미 장바구니에 해당 상품이 존재합니다.');"
					  + "history.go(-1);"
					  + "</script>");
	}else{
		out.println("<script>history.go(-1)</script>");
	}
	
%>
</body>
</html>