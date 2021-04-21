<!-- login Process.jsp --> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<jsp:useBean id="dao" class="user.UserDAO" /> 
<% 
	request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id"); 
	String password = request.getParameter("password"); 
	boolean result = dao.loginCheck(id, password); 
	String message = "로그인에 실패하였습니다."; 
	if(result) {
		message = "로그인에 성공하였습니다."; 
		session.setAttribute("idKey", id);//id를 세션 안에 넣어 두겠음 
		
	} 
%> 
<script> 
	alert("<%=message%>"); 
	location.href="login.jsp"; 
</script>

