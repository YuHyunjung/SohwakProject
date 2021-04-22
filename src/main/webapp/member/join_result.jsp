<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원가입</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/member.css">
	<style>
        /*member폴더*/
        fieldset {
            border: none;
            /*각 메인컨텐츠 들어가는 가로 사이즈만 조정해주면 가운데 정렬들어가요*/
            width: 300px;
            margin: 0 auto;
        }
      
        /*바로하단 .titleArea>h2 css는 안건들여서도되용 통일감위해서*/
        .titleArea>h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .titleArea>h5 {
            margin-bottom: 15px;
            text-align: center;
        }

        .titleArea_question {
            height: 80px;
            width: 300px;
            margin-top: 10px;
            text-align: center;
        }

        .titleArea_question>p {
            color: #668efd;
            font-size: 12px;
        }
        .submit {
            width: 304px;
            height: 40px;
            background-color: #668efd;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		int hint = Integer.parseInt(request.getParameter("hint"));
		String answer = request.getParameter("answer");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int bankCode = Integer.parseInt(request.getParameter("bank"));
		String account = request.getParameter("account");
		String joinDate = "";
		UserDAO userDAO = new UserDAO();
		if(userDAO.check(userID)){
			out.println("<script>");
			out.println("alert('아이디가 중복됩니다. 다른아이디를 선택해주세요')");
			out.println("location.href='./join.jsp'");
			out.println("</script>");
		}else{
		
		
			//userDAO 객체 생성
		int result = userDAO.join(userID, userPassword,hint,answer,name,phone,email,bankCode,account,joinDate);		//1이면 성공 -1이면 실패 
	%>
    <div class="container">
        <fieldset>
            <div class="titleArea">
                <!--h2안에 제목만 바꿔주세요-->
                <h2>회원가입완료</h2>
             
                <h5>소확마켓 회원가입이 완료되었습니다.</h5>
             
            </div>
            <div class="titleArea_question">
                <p><%=userID %>회원님, 소확마켓을 서비스를 다양하게 이용해보세요.</p>
                 <p>고객님, 즐거운 쇼핑하세요!</p>
            </div>
            <div class="option1">
                <a href="/html/member/login.html"><button type="button" class="submit">로그인</button></a>
            </div>
        </fieldset>
    </div>
    <!--푸터-->
	<%@ include file="../common/footer.jsp" %>
	<%} %>
</body>
</html>