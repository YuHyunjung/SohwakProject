<%@page import="java.util.ArrayList"%>
<%@ page import="product.ProductDTO"%>
<%@ page import="product.ProductDAO"%>
<jsp:useBean id="dao" class="product.ProductDAO" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="product.CategoryDTO"%>
<%@ page import="product.CategoryDAO"%>

<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title>상품리스트</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <link rel="stylesheet" href="../css/common.css">
   <script type="text/javascript" src="../javascript/countdown.js"></script>
<style>
   .titleArea{
      margin-top: 30px;
   }
   .titleArea>h2{
      border-bottom: 3px solid #999999; 
   }
   #search_box{
      width: 980px;
      
      margin: 0 auto;
   }
   #keyword{
      width: 500px;
      height: 40px;
      border-radius: 10px;
     border : 2.5px solid #999999;        
      color: #999999;
      font-size: 16pt;
      padding-left:15px;
   }
   input#submit_btn{
      background-image: url(../img/search_btn.png);
      background-repeat: no-repeat;
      background-size: 40px;
      width: 40px;
      height:40px;
      border: none;
      text-indent: -1000px;
      background-color: white;
   }
   .product_list{
      margin: 15px -2px;
   }
   .item{
      display: inline-block;
      margin: 0px 0px 30px 0px;
      width: 232px;
      padding: 0 4px;
   }
   .thumbnail{
      width: 100%;
      position: relative;
   }
   .thumbnail>a{
      display: block;
   }
   .thumbnail>a>img{
      max-width: 100%;
   }
   .description td{
      padding-left: 20px;
   }
   .product_name{
      margin: 0 auto;
      width: 215px;
      display: inline-block;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
   }
</style>
<script>
function fn_submit(){
   var keyword = $("#keyword").val();
   if(keyword == ''){
      alert('검색어를 입력해주세요.');
      return;
   }
   var categoryNo = "<%=request.getParameter("categoryNo")%>";
   if(categoryNo != 'null'){
      $("#categoryNo").val(categoryNo);
   }
   $("#search_box").submit();
}
</script>
</head>
<body>
   <!--헤더-->
   <%@ include file="../common/header.jsp" %>
   
   <!--메인컨텐츠-->
   <div class="container">
      <form action="list.jsp" method="get" id="search_box" onsubmit="fn_submit();">
      <div style="text-align:center;">
         <input type="search" id="keyword" name="keyword">
         <input type="submit" id="submit_btn"></div>
         <input type="hidden" name="categoryNo" id="categoryNo" />

      
      <div class="titleArea">
      <!--h2안에 제목만 바꿔주세요-->
         <h2>상품리스트</h2>
      </div>
      <ul class="product_list">
            <%
               String str_categoryNo = request.getParameter("categoryNo");
               
               String keyword = request.getParameter("keyword");
               ProductDAO productDAO = new ProductDAO();
            List<ProductDTO> products = new ArrayList<ProductDTO>();
            if(str_categoryNo != null && !str_categoryNo.equals("")){
               int category_no = Integer.parseInt(str_categoryNo);
               if(keyword != null){
                  products = productDAO.findProducts(category_no,keyword);
               }else{
                     products = productDAO.findProducts(category_no);
                  }
               }else{
                  products = productDAO.findSearchProducts(keyword);
               }
               
               
               for(int i=0;i<products.size();i++){
            %>
         <!--상품리스트-->
         <li class="item">
            <div class="thumbnail">
               <a href="./detail.jsp?product_code=<%=products.get(i).getProduct_code()%>">
                  <img src="../file/<%=products.get(i).getThumnail() %>" alt="상품이미지" >
                  <div class="description">
                     <table>
                        <tr>
                           <th colspan="2" style="text-align: center;"><div class="product_name"><%=products.get(i).getProduct_name()%></div></th>
                        </tr>
                        <tr>
                           <th>경매종료</th>
                           <td style="font-size:9pt;"><%if(products.get(i).getState().equals("경매종료")){ %>
                              <p style="color:red;">경매종료</p>
                           <%} else{%>
                           <div class="timer" attr-enddate="<%=products.get(i).getEnd_date()%>" style="display:none;"><%=products.get(i).getEnd_date()%></div>
                           <%} %>
                           </td>
                        </tr>
                        <tr>
                           <th>최저가</th>
                           <td><%=products.get(i).getMin_price()%></td>
                        </tr>
                        <tr>
                           <th>최고가</th>
                           <td><%=products.get(i).getMax_price()%></td>
                        </tr>
                        <tr>
                           <th>현재입찰가</th>
                           <td><%=products.get(i).getCurrent_price()%></td>
                        </tr>
                     </table>
                  </div>
               </a>
            </div>
         </li>
         <%} %>
      </ul>
      </form>
   </div>
   
   <!--푸터-->
   <%@ include file="../common/footer.jsp" %>
</body>
</html>