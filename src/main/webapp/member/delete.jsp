<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원탈퇴</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<style>
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
			width: 215px;
			height: 40px;
			margin: 3px 0px;
		}
		.delete>button{
			width: 147px;
			height: 40px;
			background-color: #668efd;
			color: white;
			border: none;
			margin-bottom : 20px;
		}
		.submit{
			background-color: #668efd;
			
		}
		.cancel{
			background-color: #999999;
		}
	</style>
<!-- %
	request.setCharacterEncoding("UTF-8"); 
	String id = (String) session.getAttribute("idKey");  //세션에서 idkey를 가져온다
%> -->
<script>
 function deleteID(){
	 if($("#password").val()==" "){
		 alert("비밀번호를 입력해주세요");
		 return
	 }
	 $("#deleteForm").attr("action","delete_result.jsp");
 }
</script>

<!-- 해당상품이 경매중이면, select *  from product where user_id=? or bidder=? and state =='경매중' -- ProductDAO
	그 유저가 캐쉬가 남아있거나, select * from cash where user_id=? and total != 0 order by time desc limit 1; -- CashDAO
 -->
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<div class="container">
	<fieldset>
	<div class="titleArea">
		<h2>회원탈퇴</h2>
	</div>
	<form method="post" id="deleteForm">
			아이디 : <%=id %> <br>
			비밀번호 : <input type="password" id="password" name="password" placeholder="비밀번호">
	
		<div class="delete">
		    <button type="submit" class="submit" onclick="deleteID()">회원탈퇴</button>
			<button type="button" class="cancel" onclick="location.href='../index.jsp'" class="cancel">취소</button>
		</div>
	</form>
	</fieldset>
	</div>
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>