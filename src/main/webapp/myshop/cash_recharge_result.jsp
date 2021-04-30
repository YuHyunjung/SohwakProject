<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="cash.CashDAO" %>
<%@ page import="cash.CashDTO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>캐시충전</title>
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
	
		String user_id = request.getParameter("user_id");
		String time = request.getParameter("time");
		String charge_withdraw = request.getParameter("charge_withdraw");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int total = Integer.parseInt(request.getParameter("total")) + amount;

		CashDAO cashDAO = new CashDAO();
		
		//userDAO 객체 생성
		int result = cashDAO.chargeCash(user_id,time,charge_withdraw,amount,total); //1이면 성공 -1이면 실패 
		if(result == 1) {
	%>
    <div class="container">
        <fieldset>
            <div class="titleArea">
                <!--h2안에 제목만 바꿔주세요-->
                <h2>충전완료</h2>
                <h5>충전이 완료되었습니다.</h5>
             
            </div>
            <div class="titleArea_question">
                <p><%=user_id %>회원님, <%=amount %>원 충전이 완료되었습니다.</p>
                <p>총 금액은 <%=total %>입니다.</p>
                <p>고객님, 즐거운 거래하세요!</p>
            </div>
            <div class="option1">
                <a href="cash_recharge.jsp"><button type="button" class="submit">돌아가기</button></a>
            </div>
        </fieldset>
    </div>
    
    <!--푸터-->
	<%@ include file="../common/footer.jsp" %>
	<%} %>
</body>
</html>