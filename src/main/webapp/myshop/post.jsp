<%@page import="java.io.PrintWriter"%>
<%@page import="delivery.DeliveryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("idKey");
	int product_code = Integer.parseInt(request.getParameter("product_code"));
	String delivery_company = request.getParameter("delivery_company");
	String tracking_no = request.getParameter("tracking_no");
	DeliveryDAO dao = new DeliveryDAO();
	int result = dao.inputTracking(tracking_no, delivery_company, product_code);
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('������ �ԷµǾ����ϴ�.')"); 
		script.println("location.href = './sale_history.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�����Է��� �����Ͽ����ϴ�.')"); 
		script.println("location.href = './sale_history.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>