<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>    
<%
	UserDAO dao = new UserDAO();
	request.setCharacterEncoding("utf-8"); 
	String userID = request.getParameter("userID");
	boolean result = dao.confirmID(userID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<body>
	<%=userID%>
	<%
		if(result){
			out.println("는 이미 존재하는 아이디 입니다.");
		}else{
			out.println("는 사용가능한 아이디입니다.");
			out.println(userID);
		}
	%>
	<a href="#" onclick="self.close()">닫기</a>
</body>
</html>