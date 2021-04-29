<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String id = (String) session.getAttribute("idKey");  //세션에서 idkey를 가져온다
%>
<%@ page import="product.CategoryDTO"%>
<%@ page import="product.CategoryDAO"%>

<%@ page import="product.ProductDTO"%>
<%@ page import="product.ProductDAO"%>
<jsp:useBean id="dao" class="product.ProductDAO" /> 

<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="..javascript/slideShow.js"></script>
	<link rel="stylesheet" href="..css/common.css">
	<link rel="stylesheet" href="..css/index.css">
</head>
<body>
	<!--헤더-->
		<header>
		<div class="logobox">
			<a href="..index.jsp"><img src="..img/logo_gray.png" alt="로고" id="logo"></a>
			<div class="subNav">
				<ul>
					<%
				if (id != null) { 
				%>
					<li><a href="member/logout.jsp">로그아웃</a></li>
					<li><a href="member/modify.jsp">회원수정</a></li>
				<%
					} else {
				
				%>
					<li><a href="member/login.jsp">로그인</a></li>
					<li><a href="member/join.jsp">회원가입</a></li>
				<%} %>
					<li><a href="myshop/wish_list.jsp">장바구니</a></li>
					<li><a href="myshop/mypage.jsp">마이페이지</a></li>
				</ul>
			</div>
		</div>
		<!--메인 네비게이션-->
		<div class="mainNav">
			<ul>
			<!--메인 네비게이션-->
				<li><a href="#" class="tab navi1"><span>카테고리&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
					<ul class="sub_navi_tool">
						<li class="sub_navi"><a href="product/list.jsp">디지털/가전</a></li>
						<li class="sub_navi"><a href="product/list.jsp">가구/인테리어</a></li>
						<li class="sub_navi"><a href="product/list.jsp">유아동</a></li>
						<li class="sub_navi"><a href="product/list.jsp">생활/가공식품</a></li>
						<li class="sub_navi"><a href="product/list.jsp">스포츠/레저</a></li>
						<li class="sub_navi"><a href="product/list.jsp">패션</a></li>
						<li class="sub_navi"><a href="product/list.jsp">뷰티/미용</a></li>
						<li class="sub_navi"><a href="product/list.jsp">반려동물용품</a></li>
						<li class="sub_navi"><a href="product/list.jsp">기타중고물품</a></li>
					</ul>
				</li>
				<li><a href="myshop/mypage.jsp" class="tab navi2"><span>마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
				<li><a href="shopinfo/company.jsp" class="tab navi3"><span>회사소개&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
				<li><a href="board/notice.jsp" class="tab navi4"><span>공지사항&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
				<li><a href="tel:000-0000-0000" class="tab navi5"><span>고객센터&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
			</ul>
		</div>
	</header>
	
	<!--메인컨텐츠-->
<%

			String keyword = request.getParameter("keyword");
			if(keyword != null){
				List<ProductDTO> list = dao.findSearchProducts(keyword);
				if(list.size() != 0){
					out.println("<table>");
					out.println("<tr>");
					out.println("<th>product_code</th>");
					out.println("<th>상품명</th>");
					out.println("<th>등록자</th>");
					out.println("<th>최소금액</th>");
					out.println("<th>최대금액</th>");
					out.println("<th>현재금액</th>");
					out.println("<tr>");
					for(int i = 0; i<list.size(); i++){
						
						out.println("<tr>");
						out.println("<td>"+list.get(i).getProduct_code()+"</td>");
						out.println("<td>"+list.get(i).getProduct_name()+"</td>");
						out.println("<td>"+list.get(i).getUser_id()+"</td>");
						out.println("<td>"+list.get(i).getMin_price()+"</td>");
						out.println("<td>"+list.get(i).getMax_price()+"</td>");
						out.println("<td>"+list.get(i).getCurrent_price()+"</td>");
						out.println("<tr>");
					}
					out.println("</table>");
				}
				
			}

		%>
	
	<!--푸터-->
		<footer>
		<div class="footer_btn">
			<a href="product/regist.jsp"><img src="img/register_btn.png" alt="상품등록" class="register_btn"></a>
		</div>
		<div class="footer">
			<div class="footer_box">
				<div class="img_area">
					<img src="img/logo_2layer.png" alt="푸터로고" class="footer_logo">
				</div>
				<div class="com_info">
					<span>회사명 : 소확마켓</span>&nbsp;&nbsp;&nbsp;
					<span>주소 : 서울특별시 관악구 봉천로 227 보라매 샤르망</span><br>
					<span>전화번호 : 02-1234-5678</span>&nbsp;&nbsp;&nbsp;<span>팩스 : 02-4567-8900</span><br>
					<span>이메일 : sohwag@sohwag.co.kr</span>&nbsp;&nbsp;&nbsp;<span>사업자번호 : 602-0000-0000</span>
				</div>
				<div class="sns">
					<a href="https://www.facebook.com/" target="_blank"><img src=".img/fb.png" alt="fb"></a>
					<a href="https://www.kakaocorp.com/" target="_blank"><img src="..img/kakao.png" alt="kakao"></a>
					<a href="https://www.instagram.com/" target="_blank"><img src="..img/insta.png" alt="insta"></a>
					<a href="https://www.naver.com/" target="_blank"><img src="..img/naver.png" alt="naver"></a>
					<a href="https://line.me/ko/" target="_blank"><img src="..img/line.png" alt="line"></a>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>