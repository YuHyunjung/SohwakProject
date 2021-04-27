<%@page import="java.util.Enumeration"%>
<%@page import="product.ProductDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	
		String filename = "";
		String realFolder = "C:\\sohwak\\demo\\src\\main\\webapp\\file";
		int maxsize = 100 * 1024 * 1024; // 최대 업로드 크기(100mb)
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request,realFolder,maxsize,encType,new DefaultFileRenamePolicy());
		
		String product_name = multi.getParameter("pruduct_name");
		String user_id = (String)session.getAttribute("idKey");
		int category_no = Integer.parseInt(multi.getParameter("category_option"));
		int min_price = Integer.parseInt(multi.getParameter("min_price"));
		int max_price = Integer.parseInt(multi.getParameter("max_price"));
		int current_price = Integer.parseInt(multi.getParameter("min_price"));
		String regist_date = multi.getParameter("now_date");
		String end_time = multi.getParameter("end_time");
		String end_date = multi.getParameter("end_date");
		String product_discription = multi.getParameter("description");
		
		String fname="";
		String fileName="";
		
		Enumeration files = multi.getFileNames();	//file 속성으로 지정된 input 파라미터 태그의 이름을 Enumeration 타입으로 변환
		while(files.hasMoreElements()){
			fname = (String)files.nextElement();
			fileName = multi.getFilesystemName(fname); //서버상에 실제로 업로드된 파일 이름을 저장한다.
		}

		ProductDAO dao = new ProductDAO();
		boolean result = dao.registProduct(product_name, user_id, category_no, min_price, max_price, current_price, regist_date, end_time, end_date, product_discription, fileName);
		String message = "상품등록이 실패하였습니다. 다시 시도해주세요.";
		if(result){
			message ="상품등록 완료";
		}
%>
</body>
	<script>
		alert("<%=message%>"); 
		location.href="./list.jsp"; 
	</script>
</html>