<!-- logout.jsp --> 
<%@ page contentType="text/html; charset=UTF-8"%> 
<% 
	//세션에 저장된 idKey를 제거 
	session.removeAttribute("idKey"); 
	//현재 세션을 서버에서 제거 
	session.invalidate(); 
	response.sendRedirect("../index.jsp"); 
	//로그아웃 후 메인페이지로 돌아가기 
%>

