<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sogong.domain.*" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>과외시스템</title>
</head>
<body>
   <!-- 네비게이션 바 -->
   <jsp:include page="../include/navbar.jsp" />
   <div class="container" >


      <div class="row" >
         <div class="col-md-6 col-md-offset-3">
             <h3>수강 신청</h3>
             <hr></hr>
             <div class="row">
                
                <!-- 이미지-->
               <img src="http://www.iworldtoday.com/news/photo/201604/191386_65700_410.jpg" height="auto" width="100%">
                  
          
      
            <div class="row" style="margin-top:30px">
               <table class="table">
               <tr>
                  <th>선생정보</th>
                  <th>과목</th>
                  <th>날짜</th>
                  <th>가격</th>
               </tr>
                  <!-- 값-->
               <tr>
                  <td>${lesson.teacherName}(${lesson.teacherID})</td>
                  <td>${lesson.subject}</td>
                  <td>${lesson.date}</td>
                  <td>${lesson.price}</td>
               </tr>
               </table>
            </div>
               <div class="row" align="right" >
                  <!-- c:if문-->
                  <c:if test="${ loginUser ne null and loginUser.type eq 1 and lesson.contact eq 0}"  >
                  	 <c:if test="${sugang eq true}">
                     	<button type="button" class="btn btn-success" style="margin-right:10px" onclick="reading()" disabled>수강</button>
                  	 </c:if>
                  	 <c:if test="${sugang eq false}">
                     	<button type="button" class="btn btn-success" style="margin-right:10px" onclick="reading()" >수강</button>
                  	 </c:if>        
                  </c:if>
               </div>      
            </div>   
                  
         </div>
      </div>
      
   </div>

      
   <jsp:include page="../include/footer.jsp" />

   
</body>
   
   <script>

function reading() {
   if (confirm("수강신청을 하시겠습니까?") ){
      $.ajax({
         type: "post",
         url: "/sugang/register",
         data: {
            userID : "${loginUser.id}" ,
            lessonID : "${param.id}"
            
         },
         success: function(result) {
            
            if (result == "SUCCESS") {
               alert("수강신청이 완료되었습니다.");
               
            } else {
               alert("수강신청이 취소되었습니다.");
               
            }
            location.reload() ;
         }
      });
   }
};


</script>
</html>