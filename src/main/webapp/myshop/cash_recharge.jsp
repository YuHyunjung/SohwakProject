<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="cash.CashDTO" %>
<%@ page import="cash.CashDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Vector"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>캐시충전</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	
	<style>
        .recharge_main{
            text-align: center;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        .recharge_content{
            margin-top: 40px;   
        }
        .chk_amount{
        width: 30px;
        }
        .submit{
        width: 200px;
	    height: 40px;
	    margin: 0 auto;
	    color: white;
	    border: none;
	    background-color: #668efd;
	    }
	</style>
</head>

<body>
<!--헤더-->
<%@ include file="../common/header.jsp" %>
<!-- 로그인이 안되어있다면 index.jsp로 이동 -->
<%	
	UserDAO userDAO = new UserDAO();
	UserDTO userDTO = userDAO.info(id);
	
	if (id == null) { 
		response.sendRedirect("../index.jsp"); 
	} else {
		
%>
	<div class="container">
	    <div class="recharge_main">
	          <h2>캐시충전</h2>
	        <div class="recharge_content">
	
	        	<form action="cash_recharge_result.jsp" method="post" >
	                <p>예금주 <%=userDTO.getName() %></p>
	                <p>계좌번호 <%=userDTO.getAccountNum() %></p>
	
	                <input class="chk_amount" type="radio" name="amount" value=50000>5만원
	                <input class="chk_amount" type="radio" name="amount" value=100000>10만원
	                <input class="chk_amount" type="radio" name="amount" value=150000>15만원
	                <input class="chk_amount" type="radio" name="amount" value=200000>20만원<br>
	                
	                <%
	                	CashDAO cashDAO = new CashDAO();
	                	CashDTO cashDTO = cashDAO.infoCash(id);
	                	String total = String.valueOf(cashDTO.getTotal());
	                	if(total == null){
	                		total = "0";
	                	}
	                %>
	                <input type="hidden" name="user_id" value="<%=id %>">
	                <input type="hidden" name="time" value="">
	                <input type="hidden" name="total" value="<%=total%>">
	                <input type="hidden" name="charge_withdraw" value="충전">
	                <button type="submit" class="submit">충전하기</button>
	
				</form>
				
	        </div>
	    </div>
    </div>
<% 		
		}
%>

 	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>