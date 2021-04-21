<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	UserDTO userDTO = new UserDTO();
	
		String userID = (String)session.getAttribute("idKey");
		userDTO.setId(userID);
		
		String userPassword = request.getParameter("userPassword");
		userDTO.setPwd(userPassword);
		
		String answer = request.getParameter("answer");
		userDTO.setAnswer(answer);
		
		String email = request.getParameter("email");
		userDTO.setEmail(email);
		
		UserDAO dao = new UserDAO();
		
		int result = dao.modify(userDTO);
		String message = "수정이 실패하였습니다. 다시 시도해 주세요"; 
		if(result == 1){
			message = "수정에 성공하였습니다.";
		}
%>
<script>
	alert("<%=message%>"); 
	location.href="../index.jsp"; 
</script>

</body>
</html>