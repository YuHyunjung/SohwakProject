<%@page import="sun.java2d.pipe.SpanShapeRenderer.Simple"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>상품등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <link rel="stylesheet" href="/resources/demos/style.css">
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		.regist input[name=end_date]{
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
		#end_time{
			width:183px;
		}
	</style>
<script>
$( function() {
	var start = $( "#datepicker" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "7d" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });
	
});
function regist(){
	  if($("#min_price").val()<0){
		  alert("최저가를 잘못 입력하셨습니다. 다시 입력해주세요.");
		  return
	  }
	  if($("#max_price").val()<0){
		  alert("최저가를 잘못 입력하셨습니다. 다시 입력해주세요.");
		  return
	  }
	  if(($("#min_price").val()-$("#max_price").val())>0){
		  alert("최저가가 최고가보다 높습니다 다시 입력해주세요");
		  return;
	  }
	  $("#regist").attr("action","regist_result.jsp");  
 }
 
 
</script>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
</head>
<body>
	<!--헤더-->
	<%@ include file="../common/header.jsp" %>
	<!--메인컨텐츠-->
	<%if(id == null){
		response.sendRedirect("../member/login.jsp");
	}%>
	<div class="container">
		<div class="titleArea">
			<h2>상품등록</h2>
		</div>
		<div class="regist">
		<form method="post" id="regist" enctype="multipart/form-data">
			<table>
				<tr>
					<th>대표이미지</th>
					<td>
						<input type="file" accept="image/*" id="thumbnail_img" name="thrumbnail_img">
						<img id="load_img">
					</td>
				</tr>
				<tr>
					<th>이미지1</th>
					<td>
						<input type="file" accept="image/*" id="product_img1" name="product_img1" >
						<img id="load_img">
					</td>
				</tr>
				<tr>
					<th>이미지2</th>
					<td>
						<input type="file" accept="image/*" id="product_img2" name="product_img2" >
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
						<input type="number" id="min_price" name="min_price" step="100">
						<span>최소 100단위 입력</span>
					</td>
				</tr>
				<tr>
					<th>최고가</th>
					<td>
						<input type="number" id="max_price" name="max_price" step="100">
						<span>최소 100단위 입력</span>
					</td>
				</tr>
				<tr>
					<th>경매종료일</th>
					<td>
						<input type="hidden" id="now_date" name="now_date" value="<%=sf.format(nowTime)%>"/>
						<input type="text" id="datepicker" name="end_date" onlyread/>
						<input type="time" name="end_time" id="end_time"/>
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
				<button type="button" onclick="location.href='../index.jsp'" id="cancel">취소</button>
				<button type="submit" onclick="regist()" id="submit">등록</button>
			</div>
		</form>
		</div>
	</div>
	<!--푸터-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>