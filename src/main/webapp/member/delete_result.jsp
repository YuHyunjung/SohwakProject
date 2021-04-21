<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userID = (String)session.getAttribute("idKey");
		
		UserDAO dao = new UserDAO();
		int result = dao.deleteUser(userID); //성공하면 1 반환되고, 실패를 -1반환될꺼에요
		String message = "비밀번호가 일치하지않습니다 다시 시도해주세요";
		if(result == 1){	//탈퇴성공
			message = "탈퇴가 완료되었습니다.";
		}
	%>
	<%=message %>
</body>
</html>