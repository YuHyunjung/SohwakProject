<%@page import="wish.WishDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wish.WishDAO"%>
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
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>장바구니</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/common.css">
	<style>
		.titleArea{
			margin-top: 30px;
			border-bottom: 3px solid #999999; 
			margin-bottom: 2px;
		}
		.titleArea>h2{
			display: inline-block;
		}
		.titleArea>span{
			float: right;
			font-size: 8pt;
			margin-top: 14px;
		}
		.titleArea::after{
			clear: both;
			content: "";
			display: block;
		}
		table{
			text-align: center;
			width: 100%;
			border-collapse: separate;
			border-spacing: 0 10px;
			border-bottom: 2px solid #999999;
		}
		thead{
			background-color: #999999;
			
		}
		th{
			height: 35px;
			width: 20%;
			color: black;
			margin: 0px;
			font-size: 11pt;
		}
		.product_img{
			width: 135px;
		}
		td{
			font-size: 10pt;
		}
		td:first-child{
			border-right: 2px solid #999999;
		}
		td:last-child{
			border-left: 2px solid #999999;
		}
		
		.allDelButton{
            float: right;
			margin-top: 10px;
        }
        .contents img{
		max-width: 100%;
	}
	</style>
<script>
	$(document).ready(function(){
	  setTimerrr();
	})
	
	function setTimerrr() {
		var timers = $(".timer")
		timers.each(function(index,timer) {
			tid=setInterval(msg_time, 1000, timer);
		})
	}
	
	function msg_time(timer){
		var nowDate = new Date().getTime();
		var endDate = new Date($(timer).attr("attr-enddate")).getTime();
		var RemainDate = endDate - nowDate;
		
	  var days = Math.floor(RemainDate / (1000 * 60 * 60 * 24));
	  var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
	  var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
	  var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
	
	  m = days+"일 "+hours + "시 "+miniutes+"분 " + seconds+"초";
	  
	  $(timer).html(m);   // div 영역에 보여줌 
	  
	  if (RemainDate < 0) {      
		 //clearInterval(tid);   // 타이머 해제
		 $(timer).text("경매 종료");
		 $(timer).css("color","red");
	  }else{
	    RemainDate = RemainDate - 1000; // 남은시간 -1초
	  }
	}
	function fn_deleteAll(){
		$("#wish_form").submit();
	}
</script>
</head>
<%
WishDAO wishDAO = new WishDAO();
String user_id2 = request.getParameter("user_id");
if(user_id2 != null){
	wishDAO.deleteWish(user_id2);
}
String user_id = String.valueOf(session.getAttribute("idKey"));
if(request.getParameter("product_code") != null){
	int product_code = Integer.parseInt(request.getParameter("product_code"));
	int rs = wishDAO.wish(product_code, user_id);
}


%>
<body>
	<!--헤더-->
	<header>
	<div class="logobox">
		<a href="../index.jsp"><img src="../img/logo_gray.png" alt="로고" id="logo"></a>
		<div class="subNav">
			<ul>
				<%
				if (id != null) {
				%>
				<li><a href="../member/logout.jsp">로그아웃</a></li>
				<li><a href="../member/modify.jsp">회원수정</a></li>
				<%
				} else {
				%>
				<li><a href="../member/login.jsp">로그인</a></li>
				<li><a href="../member/join.jsp">회원가입</a></li>
				<%
				}
				%>
				<li><a href="../myshop/wish_list.jsp">장바구니</a></li>
				<li><a href="../myshop/mypage.jsp">마이페이지</a></li>
			</ul>
		</div>
	</div>
	<!--메인 네비게이션-->
	<div class="mainNav">
		<ul>
		<!--메인 네비게이션-->
			<li><a href="#" class="tab navi1"><span>카테고리&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
				<ul class="sub_navi_tool">
				<%
					CategoryDAO cateDAO = new CategoryDAO();
					List<CategoryDTO> categories = cateDAO.findCategory();
					for(int i=0;i<categories.size();i++){
				%>
					<li class="sub_navi"><a href="../product/list.jsp?categoryNo=<%=categories.get(i).getCategoryNo()%>"><%=categories.get(i).getCategory()%></a></li>
				<%} %>
				</ul>
			</li>
			<li><a href="../myshop/mypage.jsp" class="tab navi2"><span>마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
			<li><a href="../shopinfo/company.jsp" class="tab navi3"><span>회사소개&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
			<li><a href="../board/notice.jsp" class="tab navi4"><span>공지사항&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
			<li><a href="tel:000-0000-0000" class="tab navi5"><span>고객센터&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
		</ul>
	</div>
</header>
	<form id="wish_form" action="wish_list.jsp">
		<input type="hidden" id="user_id" name="user_id" value="<%=user_id%>">
	</form>
	<!--메인컨텐츠-->
	<div class="container">
		<div class="titleArea">
			<h2>장바구니</h2>
			<span>장바구니 상품은 최근 90일동안 저장</span>
		</div>
		<div class="contents">
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>현재입찰가</th>
						<th>낙찰 남은 시간</th>
						<th>입찰 참가 여부</th>
						<th>판매자</th>
					</tr>
				</thead>
				<tbody>
				<%

				List<WishDTO> products = new ArrayList<WishDTO>();
				products = wishDAO.wishList(user_id);
				for(int i =0; i< products.size(); i++){
				%>

					<tr>
						<td><img src="../file/<%=products.get(i).getThumnail() %>" alt="상품이미지" ></td>
						<td><%=products.get(i).getCurrent_price()%></td>
						<td style="font-size:9pt;"><div class="timer" attr-enddate="<%=products.get(i).getEnd_date()%>"></div></td>
						<td><button type="button" onclick="location.href='../product/detail.jsp?product_code=<%=products.get(i).getProduct_code()%>'">링크로이동</button></td>
						<td><%=products.get(i).getUser_id() %></td>
					</tr>
					
				</tbody>
				<%} %>
			</table>
		</div>
		<button type="button" onclick="javascript:fn_deleteAll();" class="allDelButton">전체삭제</button>
	</div>
	
<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>