<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8"); 
	String id = (String) session.getAttribute("idKey");
	
	//세션에서 idkey를 가져온다
	String filename = "";
	String realFolder = "C:\\sohwak\\demo\\src\\main\\webapp\\file";
	int maxsize = 100 * 1024 * 1024; // 최대 업로드 크기(100mb)
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxsize,encType,new DefaultFileRenamePolicy());
	
	String product_name = multi.getParameter("pruduct_name");
	String product_discription = multi.getParameter("description");
	int product_code = Integer.parseInt(request.getParameter("product_code"));
	
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.getProduct(product_code);
	Enumeration files = multi.getFileNames();	//file 속성으로 지정된 input 파라미터 태그의 이름을 Enumeration 타입으로 변환
	String fname3 = (String)files.nextElement();
	String fileName3 = multi.getFilesystemName(fname3); //서버상에 실제로 업로드된 파일 이름을 저장한다.

	String fname2 = (String)files.nextElement();
	String fileName2 = multi.getFilesystemName(fname2);
	
	String fname1 = (String)files.nextElement();
	String fileName1 = multi.getFilesystemName(fname1);
	if(fname1 == null){
		fileName1 = dto.getThumnail();
	}
	
	int result = dao.update(product_code, product_name, product_discription, fileName1, fileName2, fileName3);
	if(result == 1){
		out.println("<script>alert('수정완료')");
		out.println("location.href='../index.jsp'");
		out.println("</script>");
	}else{
		out.println("<script>alert('실패')");
		out.println("location.href='../index.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>