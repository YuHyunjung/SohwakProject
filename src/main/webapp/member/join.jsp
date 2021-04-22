<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
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
	<script>
		function checkID(){
		    //아이디 정규식
			
		      
			//중복확인 결과
			url = "confirmId.jsp?userId="+document.joinform.userID.value;
			window.open(url,"confirm","width=300,height=150");
		}
	   function checkform() {
		   	  //아이디 정규식
		   	var userIdCheck = RegExp(/^[a-z0-9]{5,20}$/);
		      //비밀번호 정규식 
		    var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
		      //이름 정규식
		    var nameCheck = RegExp(/^[가-힣]{2,6}$/);
		      //이메일 정규식
		    var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		      //핸드폰 번호 정규식
		    var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
		      //계좌번호 정규식
		    var accountCheck = RegExp(/^[0-9_\-]{5,30}$/);
		 		 //id가 공란일때
			   if($("#main_id").val()==""){
			    	  alert("아이디를 입력해 주세요.");
			    	  $("#main_id").focus();
			    	  return;
					}
			      //아이디 유효성 검사
			   if(!userIdCheck.test($("#main_id").val())){
			    	  alert("아이디에 영문 소문자와 숫자를 포함하여 5자에서 20자 사이로 입력해 주세요.");
			    	  $("#main_id").focus();
			    	  return;
			      }
		      //비밀번호, 비밀번호 확인 동일값인지 확인
		      if($("#password").val() != $("#passwordConfirm").val()){
		    	  alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		    	  return;
		      }
		      //비밀번호 유효성
		      if(!passwdCheck.test($("#password").val())){
		    	  alert("비밀번호를 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16로 입력해 주세요.");
		    	  $("#password").focus();
		    	  return;
		      }
		      
		      //이메일 유효성
		      if(!emailCheck.test($("#main_email").val())){
		    	  alert("이메일 형식에 맞게 입력해주세요.");
		    	  $("#main_email").focus();
		    	  return;
		      }
		      
		      //전화번호 유효성
		      if(!phonNumberCheck.test($("#phone").val())){
		    	  alert("전화번호 형식에 맞게 입력해주세요.(- 빼고 입력해주세요)");
		    	  $("#phone").focus();
		    	  return;
		      }
		      
		     //이름 유효성
		      if(!nameCheck.test($("#name").val())){
		    	  alert("이름을 한글로 입력해주세요.");
		    	  $("#name").focus();
		    	  return;
		      }
		    	//계좌번호 유효성
		      if(!accountCheck.test($("#account").val())){
		    	  alert("계좌번호를 정확하게 입력해주세요");
		    	  $("#account").focus();
		    	  return;
		      }
		      
		     $("#join").attr("action","join_result.jsp");
	   }
	</script>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<!-- 로그인이 되어있다면 index.jsp로 이동 -->
	<%	
		if (id != null) { 
			response.sendRedirect("../index.jsp"); 
		}
	%>
    <!--회원가입-->
    <div class="container">
        <fieldset>
            <div class="titleArea">
                <!--h2안에 제목만 바꿔주세요-->
                <h2>회원가입</h2>
            </div>

            <!--첫번째 문단-->
            <div class="basicinfo">
                <h3>기본정보</h3>
            </div>
			<form method="post" id="join" name="joinform">
            	<div class="basicinfo_main">
	                <table class="basicinfo_main_table">
	                    <tr>
	                        <th>아이디 *</th>
	                        <td>
								<input type="text" id="main_id" name="userID" style="width:168px;">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 *</th>
	                        <td>
	                            <input type="password" id="password" name="userPassword">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 확인*</th>
	                        <td>
	                            <input type="password" id="passwordConfirm" name="confirmPWD">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 확인 질문*</th>
	                        <td>
	                            <select id="hint" name="hint">
									<option value="1">기억에 남는 추억의 장소는?</option>
									<option value="2">자신의 인생 좌우명은?</option>
									<option value="3">자신의 보물 제1호는?</option>
									<option value="4">가장 기억에 남는 선생님 성함은?</option>
									<option value="5">타인이 모르는 자신만의 신체비밀이 있다면?</option>
								</select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 확인 답변 *</th>
	                        <td>
	                            <input type="text" id="answer" name="answer">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>이름 *</th>
	                        <td>
	                            <input type="text" id="name" name="name">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>전화번호 *</th>
	                        <td>
	                            <input type="text" id="phone" name="phone" size="11" maxlength="11">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>이메일 *</th>
	                        <td>
	                            <input type="text" id="main_email" name="email">
	                        </td>
	                    </tr>
	                    <tr>
	                    	<th>계좌번호 *</th>
	                    	<td>
	                    		<select id="bank" name="bank">
									<option value="1">우체국</option>
									<option value="2">국민</option>
									<option value="3">농협</option>
								</select>
	                   			<input type="text" id="account" name="account">
	                    	</td>
	                    </tr>
	                </table>
                
            </div>

            <div class="option">
                <button type="button" onclick="location.href='../index.jsp'" class="cancel">취소</button>
                <button type="submit" class="submit" onclick="checkform()">회원가입</button>
            </div>
			</form>
        </fieldset>
    </div>
    <!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>