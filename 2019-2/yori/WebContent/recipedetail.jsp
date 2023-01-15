<%@page import="com.yori.domain.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.yori.domain.MemberDTO" %>
<%@ page import="com.yori.domain.RecipeDTO" %>
<!DOCTYPE html>
<html lang="en" >

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>레시피 상세정보</title>
<%
    MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
	String loginMemberId = loginMember.getMemId();
    
    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    String currentDate = simpleDate.format(date);
    
%>
 
 <link rel="stylesheet" href="css/main.css">
<meta charset="utf-8">
<title>레시피상세정보</title>
<style>
   #ta {
      align:center;
   }
   table {
      align:center;
   }
   .input {
      width:50%
   }


</style>
</head>
<body>

   <jsp:include page="./nav.jsp"/>

   <h1 align="center"> 레시피상세정보</h1>
   <br>
   
   <div align="center">
   <form name="cmtform">
   <table class="table" style="width:40%">
 
     <tr>
       <th>레시피이미지등록</th>
     </tr>
     <tr>
       <th>
         <input type= "file" name = "recImage" id="recImage">
         <br>
         <img id="frame" style="width:350px" src="${recipedetail.recImage.split('@')[0]}"> 
       </th>
     </tr>
     <tr>
       <th>레시피이름</th>
     </tr>
     <tr>
       <th><input class="form-control" type="text" id="recName" name="recName" style="width:50%" value="${recipedetail.recName}"></th>
       
     </tr>
     <tr>
       <th>요리종류</th>
       </tr>
     <tr>
       <th>
           <select name="recCategory" id="recCategory">
           <option value="pizza">피자</option>
           <option value="hambuger">햄버거</option>
           <option value="고기">고기</option>
           <option value="채소">채소</option>
           </select>
       </th>
     </tr>
     <tr>
       <th>요리설명</th>
     </tr>
     <tr>
       <th>
         <textarea class="form-control" rows="5" id="recText" name="recText" style="height:130px; width:90%;">${recipedetail.recText}</textarea>
          
       </th>
     </tr>
     <tr>
       <th>요리순서</th>
     </tr>
   <c:forEach var="i" begin="0" end="4" step="1">
      <tr>
          <th>
          <c:if test="${recipedetail.recOrder.split('@')[i] != 'null'}">
              <textarea class="form-control" rows="5" id="recOrder" name="recOrder" style="height:300px; width:90%;">
                    ${recipedetail.recOrder.split("@")[i]}
              </textarea>
          </c:if>
          </th>
          <c:if test="${recipedetail.recImage.split('@')[i+1] != '/yori/upload/null'}">
          <th style="width:30%;">
            <img id="frame1" src="${recipedetail.recImage.split('@')[i+1]}">
          </th>
          </c:if>
        </tr>
   </c:forEach>
        
   </table>
   <br>
   <div align="center">
      
   <c:if test="${recipedetail.memId == loginMember.getMemId()}">
      <button type="submit" name="submit" class="btn btn-outline-primary" onclick="change()">수정</button>
      <button type="submit" name="submit" class="btn btn-danger" onclick="return delete_()">삭제</button>
   </c:if>
   </div>

	<span>
		<input type="button" class="btn btn-warning" name="minus" id="minus" value="-">
		<img id=image1 src="/yori/upload/staroff.png">
		<img id=image2 src="/yori/upload/staroff.png">
		<img id=image3 src="/yori/upload/staroff.png">
		<img id=image4 src="/yori/upload/staroff.png">
		<img id=image5 src="/yori/upload/staroff.png">
		<input type="button" class="btn btn-warning" name="plus" id="plus" value="+">

	</span>
	<input type="hidden" name="star" id="star"/>
   </form>
   </div>
   
   <div class="w3-main w3-margin-bottom" style="margin-left: 340px; margin-right: 40px; width: 60%;">
      
      <!-- 댓글 기능 -->
      <div>
         <div class="w3-border w3-padding">댓글</div>
         <div class="w3-border w3-padding"> 
            <c:if test="${ empty loginMember }">
               <textarea rows="5" cols="50" class="w3-input w3-border newLogin" readonly>로그인 후 댓글 달기</textarea>
            </c:if>
            <c:if test="${ !empty loginMember }">
               <i class="fa fa-user w3-padding-10"></i> <%= loginMemberId %>
               <form>                  
                  <textarea rows="5" cols="100" class="w3-input w3-border" placeholder="댓글 작성" name="reply_content" id="reply_content"></textarea>
                  <input type="button" class="btn btn-warning" id="reply_btn" value="댓글 등록">
               </form>
            </c:if>
         </div>
         <div>
            <div class="w3-border w3-padding">댓글목록(<i class="fa fa-commenting"></i><span>${fn:length(replyList)}</span>)</div>
            <div class="w3-border w3-padding">
               <c:forEach items="${replyList}" var="reply">
                  <div class="row">
                     <div class="col-md-5">               
                        <i class="fa fa-user w3-padding-13"></i> ${reply.memId} &nbsp;
                        <i class="fa fa-calendar"></i>
                        
                        <fmt:parseDate value="${reply.rpDate}" var="parseDate" pattern="yyyy-MM-dd hh:mm" type="both" />
                        <fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd hh:mm" type="both" />
                       <p>별점 : 
                        <c:set var="star" value="${reply.rpStar}"></c:set>
                        	<c:choose>
                        		<c:when test="${star==0}">0점입니다.</c:when>
                        		<c:when test="${star==1}"><img src="/yori/upload/staron.png"></c:when>
                        		<c:when test="${star==2}"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"></c:when>
                        		<c:when test="${star==3}"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"></c:when>
                        		<c:when test="${star==4}"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"></c:when>
                        		<c:when test="${star==5}"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"><img src="/yori/upload/staron.png"></c:when>
                        	</c:choose>
                        </p>
                        <p>${reply.rpContent}</p>   
                     </div>
                  </div>
            </c:forEach>
            </div>
         </div>
      </div>
   </div>
   
  <script>
  var locked = 0;
  var i = 0; 
  document.cmtform.star.value=i;
		
	$(document).ready(function(){
	     $("#plus").click(function(){
	    	i++;
	    	document.cmtform.star.value=i;
	    	var image;
	 		var el;
	    	if(i>5){
	    		alert("5점이 끝입니다.");
	    		i=5;
	    	}else{
				image = 'image' + i;
				el = document.getElementById(image);
				el.src="/yori/upload/staron.png"
				
	    	}
	     });
	   });
		
	$(document).ready(function(){
	     $("#minus").click(function(){
	    	var image;
		 	var el;
	    	if(i<0){
	    		alert("0점이끝입니다.");
	    	}else{
	    		image = 'image' + i;
				el = document.getElementById(image);
				el.src="/yori/upload/staroff.png"
				i--;
	    	}
	    	document.cmtform.star.value=i;
	     });
	   });

	
	$(document).ready(function(){
	     $("#addbtn").click(function(){
	        if(i > 4){
	           alert("더 이상 추가할 수 없습니다.");
	        }
	        else{
	           $("#add").append("<tr><th style='width:70%;'><textarea class='form-control' rows='3' id='recOrder"+(i)+"' name='recOrder"+(i++)+"' style='height:250px;'></textarea></th><th style='width:30%;'><input type='file' name='recImage"+(j)+"' id='recImage"+(j)+"' value='사진 입력'><br><img id='frame"+(j++)+"'></th></tr>");  
	        }
	      
	     });
	   });
	
	
	
	$("#reply_btn").click(function(){
    	if($("#reply_content").val().trim() === ""){
    		alert("댓글을 입력하세요.");
    		$("#reply_content").val("").focus();
    	}else{
    		$.ajax({
    			url: "/yori/reply/insert",
                type: "POST",
                data: {
                   	memId : "<%= loginMemberId %>",
                    reply_content : $("#reply_content").val(),
                    recNum : ${recipedetail.recNum},
                    star : $("#star").val(),
                    date : "<%= currentDate %>"
                },
                success: function () {
                	alert("댓글 등록 완료");
                	$("#reply_content").val("");
                	location.reload();
                },
    		})
    	}
    })
  
  	function change(){
        $.ajax({
           type : "POST",
           url : "/yori/recipe/recipeupdate",
           enctype: "multipart/form-data",
           data : {
              recNum : ${recipedetail.recNum},
              recName : $("#recName").val(),
              recText : $("#recText").val(),
              recImage : $("#recImage").val(),
              recCategory : $("#recCategory").val(),
              recOrder : $("#recOrder").val(),
              memId : "${recipedetail.memId}"
           },
           success : function(result){
              if(result == "SUCCESS"){
                 alert("수정성공");
                 location.href = "/yori/recipe/list"
              }else{
                 alert("변경실패");
                 location.reload();
                 }

              }
           });
        }
   
   function delete_() {     
       $.ajax({
            type: "POST",
            url: "/yori/recipe/delete",
            data: {
               recNum: ${recipedetail.recNum},
               memId: "<%= loginMemberId %>"
            },
            success: function(result) {
               if (result == "SUCCESS") {
                  alert("레시피 삭제완료");
                  location.href = "/yori/recipe/list";
               } else {
                  alert("레시피 삭제실패");
                  location.reload();
               }
            }   
       });
   }
  
  </script>
  
<script>
  let imageup = document.getElementById('recImage');
  let frame = document.getElementById('frame');
  imageup.addEventListener('change', function(e) {
    let file = e.target.files[0]
    // Do something with the image file.
    frame.src = URL.createObjectURL(file);
  });


</script>
</body>
</html>
