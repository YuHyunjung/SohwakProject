<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원정보 수정</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/member.css">
	<script>
	
	   function checkform() {
		      //비밀번호 정규식 
		      var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
		      //이메일 정규식
		      var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		      
		      if($("#password").val()==""){
		    	  alert("비밀번호를 입력하세요.");
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
		      
		     $("#modify").attr("action","modify_result.jsp");
	   }
	</script>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>

	<%
		if (id == null) { 
			response.sendRedirect("./login.jsp"); 
		}
	
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.info(id);
	%>
    <!--회원수정-->
    <div class="container">
        <fieldset>
            <div class="titleArea">
                <!--h2안에 제목만 바꿔주세요-->
                <h2>회원정보수정</h2>
            </div>

            <!--첫번째 문단-->
            <div class="basicinfo">
                <h3>기본정보</h3>
            </div>
			<form method="post" id="modify">
            	<div class="basicinfo_main">
	                <table class="basicinfo_main_table">
	                    <tr>
	                        <th>아이디 *</th>
	                        <td>
								<%=dto.getId()%>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 *</th>
	                        <td>
	                            <input type="password" id="password" name="userPassword" >
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
                    	     <% if((dto.getPwdCode())==1){
	                    				out.println("기억에 남는 추억의 장소는?");
	                    			}else if((dto.getPwdCode())==2){
	                    				out.println("자신의 인생 좌우명은?");
	                    			}else if((dto.getPwdCode())==3){
	                    				out.println("자신의 보물 제1호는?");
	                    			}else if((dto.getPwdCode())==4){
	                    				out.println("가장 기억에 남는 선생님 성함은?");
	                    			}else{
	                    				out.println("타인이 모르는 자신만의 신체비밀이 있다면?");
	                    			}
	                    		%>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 확인 답변 *</th>
	                        <td>
	                            <input type="text" id="answer" name="answer" value="<%=dto.getAnswer()%>">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>이름 *</th>
	                        <td>
	                           <%=dto.getName()%>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>전화번호 *</th>
	                        <td>
	                            <%=dto.getPhone()%>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>이메일 *</th>
	                        <td>
	                            <input type="text" id="main_email" name="email" value="<%=dto.getEmail()%>">
	                        </td>
	                    </tr>
	                    <tr>
	                    	<th>계좌번호 *</th>
	                    	<td>
	                    		<% if((dto.getBankCode())==1){
	                    				out.println("우체국");
	                    			}else if((dto.getBankCode())==2){
	                    				out.println("국민");
	                    			}else{
	                    				out.println("농협");
	                    			}
	                    		%>
	                    		<br>
	                   			<%=dto.getAccountNum() %>
	                    	</td>
	                    </tr>
	                </table>
                
            </div>

            <div class="option">
                <button type="button" onclick="location.href='../index.jsp'" class="cancel">취소</button>
                <button type="submit" class="submit" onclick="checkform()">회원 정보 수정</button>
                <button type="button" class="delete" onclick="location.href='./delete.jsp'">회원 탈퇴</button>
            </div>
			</form>
        </fieldset>
    </div>
    <!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>