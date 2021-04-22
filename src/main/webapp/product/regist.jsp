<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>상품등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
		<style>
		.titleArea{
			margin-top: 30px;
		}
		.titleArea>h2{
			border-bottom: 3px solid #999999; 
		}
		table{
			margin: 30px auto;
			border-spacing: 0 10px;
		}
		.regist th{
			text-align: left;
			padding-right: 100px;
		}
		.regist input, .regist select{
			width: 380px;
			height: 30px;
			border-radius: 10px;
   			border: 1px solid #999999;
		}
		.regist input[type=file]{
			border-style: none;
			border-radius: unset;
		}
		.regist input[type=date]{
			width: 190px;
		}
		td>span{
			font-size: 9pt;
		}
		button{
			width: 200px;
			height: 45px;
			border: none;
			color: white;
		}
		.btn_area{
			margin: 0 auto;
			width: 406px;
		}
		#cancel{
			background-color: #999999;
		}
		#submit{
			background-color: #668efd;
		}

	</style>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<!--메인컨텐츠-->
	<div class="container">
		<div class="titleArea">
			<h2>상품등록</h2>
		</div>
		<div class="regist">
			<table>
				<tr>
					<th>이미지(최대10장)</th>
					<td>
						<input type="file" accept="image/*" id="thumbnail_img" name="thrumbnail_img" multiple>
						<!-- 이미지 미리보기로 뜨게 해야함-->
						<img id="load_img">
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>
						<input type="text" id="pruduct_name" name="pruduct_name">
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="category_option" id="category_option">
							<option value="" selected disabled>카테고리선택</option>
							<%for(int i=0;i<categories.size();i++){ %>
							<option value="<%=categories.get(i).getCategoryNo()%>"><%=categories.get(i).getCategory()%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>최저가</th>
					<td>
						<input type="number" id="min_price" name="min_price">
					</td>
				</tr>
				<tr>
					<th>최고가</th>
					<td>
						<input type="number" id="max_price" name="max_price">
					</td>
				</tr>
				<tr>
					<th>경매종료일</th>
					<td>
						<input type="date" id="max_price" name="max_price">
						<span>등록일로부터 최대 7일</span>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: top;">상품설명</th>
					<td>
						<textarea name="description" id="description" cols="55" rows="10"></textarea>
					</td>
				</tr>
			</table>
			<div class="btn_area">
				<button type="button" onclick="location.href='/html/index.html'" id="cancel">취소</button>
				<button type="submit" onclick="" id="submit">등록</button>
			</div>
		</div>
	</div>
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>