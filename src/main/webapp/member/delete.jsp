<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원탈퇴</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/member.css">
</head>
<body>
<script>
	var message = confirm("회원탈퇴하시겠습니까?");
	if(message==true){
		location.href="./delete_result.jsp";
	}else{
		location.href="./modify.jsp";
	}
</script>
</body>
</html>