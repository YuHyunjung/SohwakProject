<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../css/common.css">
	<style>
		/*member폴더*/
		fieldset{
			border: none;
			/*각 메인컨텐츠 들어가는 가로 사이즈만 조정해주면 가운데 정렬들어가요*/
			width: 300px;
			margin: 0 auto;
		}
		/*바로하단 .titleArea>h2 css는 안건들여서도되용 통일감위해서*/
		.titleArea>h2{
			text-align: center;
			margin-bottom: 15px;
		}
		input{
			width: 316px;
			height: 40px;
			margin: 3px 0px;
		}
		input[type="checkbox"]{
			width: 15px;
			height: 15px;
		}
		.option{
			margin: 15px 0px;
		}
		.option>span>label{
			font-size: 11px;
			line-height: 1.5em;
			color: #999999;
		}
		.submit{
			width: 320px;
			height: 40px;
			background-color: #668efd;
			color: white;
			border: none;
		}
		.find{
			width: 54px;
			margin: 0 auto;
		}
		.find>a{
			font-size: 10pt;
		}
	</style>
   <script type="text/javascript">
    
		function checkValue() {
			if (document.loginFrm.id.value == "") {
				alert("아이디를 입력해 주세요."); 
				document.loginFrm.id.focus(); 
				return; 
			} 
			if (document.loginFrm.password.value == "") {
				alert("비밀번호를 입력해 주세요."); 
				document.loginFrm.password.focus(); 
				return; 
			} 
			
			document.loginFrm.submit();
		}

	</script>

</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	
	<!--메인컨텐츠-->
	<div class="container">
	<% if (id != null) { 	//로그인이 되어있다
		response.sendRedirect("../index.jsp"); 
		} else { //id = request.getParameter("id"); 
	 %>

		<fieldset>
			<div class="titleArea">
				<h2>로그인</h2>
			</div>
			<form method="post" name="loginFrm" action="./login_result.jsp">
				<input type="text" id="id" name="id" placeholder="아이디">
				<input type="password" id="password" name="password" placeholder="비밀번호">
				<button type="button" class="submit" onclick="checkValue()">로그인</button>
			</form>
			<div class="find">
				<a href="./join.jsp">회원가입</a>
			</div>
		</fieldset>
		<%
			 }
		%>
	</div>

	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>