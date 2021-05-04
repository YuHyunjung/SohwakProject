<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="cash.CashDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<!-- 해당상품이 경매중이건,
	그 유저가 캐쉬가 남아있거나,
	경매에 참여중이거나
 -->
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userID = (String)session.getAttribute("idKey");
		String password = request.getParameter("password");
		
		CashDAO cashDAO = new CashDAO();
		ProductDAO productDAO = new ProductDAO();
		UserDAO userDAO = new UserDAO();
		int cashHistory = cashDAO.count(userID);
		//0 이면캐쉬테이블에 이름없고
		if(cashHistory == 0){
			int auctioning = productDAO.auctioning(userID);
			if(auctioning == 1){
				//탈퇴가능
				int deleteMember = userDAO.deleteMember(userID, password);
				if(deleteMember == 1){
					PrintWriter script = response.getWriter(); 
					script.println("<script>");
					script.println("alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.')");  
					script.println("location.href = '../index.jsp'");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter(); 
					script.println("<script>");
					script.println("alert('다시시도해주세요')");  
					script.println("location.href = '../index.jsp'");
					script.println("</script>");
				}
				
			}else if(auctioning == 0){
				PrintWriter script = response.getWriter(); 
				script.println("<script>");
				script.println("alert('경매중인 상품이 있어 탈퇴가 불가능합니다.')");  
				script.println("location.href = '../index.jsp'");
				script.println("</script>");
			}
			
		}else if(cashHistory == 1){					//1이면 캐쉬테이블존재 있음;
			int cashing = cashDAO.cashing(userID);
			int auctioning = productDAO.auctioning(userID);
			if(cashing == 1 && auctioning==1){
				//탈퇴가능
				int deleteMember = userDAO.deleteMember(userID, password);
				if(deleteMember == 1){
					PrintWriter script = response.getWriter(); 
					script.println("<script>");
					script.println("alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.')");  
					script.println("location.href = '../index.jsp'");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter(); 
					script.println("<script>");
					script.println("alert('다시시도해주세요')");  
					script.println("location.href = '../index.jsp'");
					script.println("</script>");
				}
				
			}else if(cashing == 0 ){
				PrintWriter script = response.getWriter(); 
				script.println("<script>");
				script.println("alert('캐쉬에 잔액이 남아있어 탈퇴가 불가능합니다.')");  
				script.println("location.href = '../index.jsp'");
				script.println("</script>");
			}else if(auctioning ==0){
				PrintWriter script = response.getWriter(); 
				script.println("<script>");
				script.println("alert('경매중인 상품이 있어 탈퇴가 불가능합니다.')");  
				script.println("location.href = '../index.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>