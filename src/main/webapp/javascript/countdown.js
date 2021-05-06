
   $(document).ready(function(){
     setTimerrr();
   })
   
   function setTimerrr() {
      var timers = $(".timer")
      timers.each(function(index,timer) {
         tid=setInterval(msg_time, 1000, timer);
      })
   }
   
   function msg_time(timer){
      var nowDate = new Date().getTime();
      var endDate = new Date($(timer).attr("attr-enddate")).getTime();
      var RemainDate = endDate - nowDate;
      
     var days = Math.floor(RemainDate / (1000 * 60 * 60 * 24));
     var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
     var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
     var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
   
     m = days+"일 "+hours + "시 "+miniutes+"분 " + seconds+"초";
     
     $(timer).html(m);   // div 영역에 보여줌 
     
     if (RemainDate < 0) {      
       //clearInterval(tid);   // 타이머 해제
       $(timer).text("경매 종료");
       $(timer).css("color","red");
     }else{
       RemainDate = RemainDate - 1000; // 남은시간 -1초
     }
   }
function fn_submit(){
   var keyword = $("#keyword").val();
   if(keyword == ''){
      alert('검색어를 입력해주세요.');
      return;
   }
   $("#search_box").submit();
}