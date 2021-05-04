<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	int product_code = Integer.parseInt(request.getParameter("product_code"));
	
	String filename = "";
	String realFolder = "C:\\sohwak\\demo\\src\\main\\webapp\\file";
	int maxsize = 100 * 1024 * 1024; // 최대 업로드 크기(100mb)
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxsize,encType,new DefaultFileRenamePolicy());
	
	String product_name = multi.getParameter("pruduct_name");
	String user_id = (String)session.getAttribute("idKey");
	String product_discription = multi.getParameter("description");
	
	
	Enumeration files = multi.getFileNames();	//file 속성으로 지정된 input 파라미터 태그의 이름을 Enumeration 타입으로 변환
	String fname3 = (String)files.nextElement();
	String fileName3 = multi.getFilesystemName(fname3); //서버상에 실제로 업로드된 파일 이름을 저장한다.

	String fname2 = (String)files.nextElement();
	String fileName2 = multi.getFilesystemName(fname2);
	
	String fname1 = (String)files.nextElement();
	String fileName1 = multi.getFilesystemName(fname1);

	ProductDAO dao = new ProductDAO();
	int result = dao.update(product_code, product_name, product_discription, fileName1, fileName2, fileName3);
	if(result == 1){
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('상품수정완료')");  
		script.println("location.href = '../myshop/sale_history.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('상품수정실패')");  
		script.println("location.href = '../myshop/sale_history.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>