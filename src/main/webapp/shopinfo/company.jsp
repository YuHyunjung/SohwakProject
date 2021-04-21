<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원가입</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<link rel="stylesheet" href="../css/common.css">
	<style>
		.container>img{
			width: 100%;
		}
		.titleArea{
			margin-top: 30px;
		}
		.titleArea>h2{
			border-bottom: 3px solid #999999;
			margin-bottom: 15px;
		}
	</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!--메인컨텐츠-->
	<div class="container">
		<div class="titleArea">
			<!--h2안에 제목만 바꿔주세요-->
			<h2>소확마켓</h2>
		</div>
		<img src="../img/company.png" alt="회사소개">
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>