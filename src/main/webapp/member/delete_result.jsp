<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %>
<%@ page import="user.UserDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userID = (String)session.getAttribute("idKey");
		String password = request.getParameter("password");
		
		UserDAO dao = new UserDAO();
		int result = dao.deleteMember(userID,password); //성공하면 1 반환되고, 실패를 -1반환
		String message = "비밀번호가 일치하지않습니다 다시 시도해주세요";
		if(result == 1){
			message = "탈퇴가 완료되었습니다.";
		
			//세션에 저장된 idKey를 제거 
			session.removeAttribute("idKey"); 
			//현재 세션을 서버에서 제거 
			session.invalidate(); 

			//로그아웃 후 로그인 폼으로 돌아가기 
	 	}
	%>
	<script>
		alert("<%=message %>");
		location.href="./login.jsp"; 
	</script>
</body>
</html>