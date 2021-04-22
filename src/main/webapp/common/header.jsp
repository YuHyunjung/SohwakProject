<%@page import="product.CategoryDTO"%>
<%@page import="product.CategoryDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); 
	String id = (String) session.getAttribute("idKey");  //세션에서 idkey를 가져온다
%>
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
					<li class="sub_navi"><a href="../product/list.jsp?cate_no=<%=categories.get(i).getCategoryNo()%>"><%=categories.get(i).getCategory()%></a></li>
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