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
		
		UserDAO dao = new UserDAO();
		ProductDAO dao1 = new ProductDAO();
		CashDAO dao2 = new CashDAO();
		int result = dao.deleteMember(userID,password); //성공하면 1 반환되고, 실패를 -1반환
		int result2 = dao1.auctioning(userID,password);
		int result3 = dao2.cashing(userID,password);
		String message = "비밀번호가 일치하지않습니다 다시 시도해주세요";
		if(result == 1){
			message = "탈퇴가 완료되었습니다.";
		
			//세션에 저장된 idKey를 제거 
			session.removeAttribute("idKey"); 
			//현재 세션을 서버에서 제거 
			session.invalidate(); 

			//로그아웃 후 로그인 폼으로 돌아가기 
	 	} if(result2 == 1) {
	 		message ="현재 경매중인 상품이 남아있습니다.";
	 		
	 	} if(result3 == 1) {
	 		message = "현재 캐시가 남아있습니다.";
	 	}
		
	%>
	<script>
		alert("<%=message %>");
		location.href="./login.jsp"; 
	</script>
</body>
</html>