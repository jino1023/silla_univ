<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.yori.domain.MemberDTO" %>
<%@ page import="com.yori.domain.CategoryhDTO" %>
<%@ page import="com.yori.domain.CategorykDTO" %>
<!DOCTYPE html>
<html lang="UTF-8" >

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 등록페이지</title>

<%
   MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
   String loginMemberId = loginMember.getMemId();
   String imageFile = (String)request.getSession().getAttribute("image");
   int i = 0;
%>

<title>레시피등록</title>
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
   <br>
   <div align="center">
   <form id="uploadForm" method="post" action="/yori/recipe/register" enctype="multipart/form-data">
   <input type="hidden" name="memId" value=<%= loginMemberId %>>
   <table class="table" style="width:40%" id="add">
     <tr>
       <th>레시피이미지등록</th>
     </tr>
     <tr>
       <th>
         <input type="file" name ="recImage0" id="recImage0" value="사진 입력">
         <br>
         <img id="frame0" style="width:350px">
       </th>
     </tr>
     <tr>
       <th>레시피이름</th>
     </tr>
     <tr>
       <th><input class="form-control" type="text" id="recName" name="recName" style="width:50%"></th>
     </tr>
     <tr>
       <th>요리종류</th>
       </tr>
     <tr>
       <th>
       <!-- 카테고리 -->
       		<select name="cateKind" id="cateKind">
		        	<option value="">===종류===</option>
				<c:forEach items="${kindList}" var="kind">
		       		<option value="${kind.cateKindId}">${kind.cateKindName}</option>
				</c:forEach>
			</select>
	        <select name="cateHow" id="cateHow">
		        	<option value="">===방법===</option>
				<c:forEach items="${howList}" var="how">
		        	<option value="${how.cateHowId}">${how.cateHowName}</option>
	          	</c:forEach>  
			</select>
       </th>
     </tr>
     <tr>
       <th>요리설명</th>
     </tr>
     <tr>
       <th>
         <textarea class="form-control" rows="5" id="recText" name="recText" style="height:130px; width:90%;"></textarea>
       </th>
     </tr>
     <tr>
       <th>요리순서</th>
     </tr>
        <tr>
          <th style="width:70%;">
            <textarea class="form-control" rows="3" id="recOrder0" name="recOrder0" style="height:250px;"></textarea>
          </th>
          <th style="width:30%;">
              <input type="file" name ="recImage1" id="recImage1" value="사진 입력">
            <img id="frame1" >
          </th>
        </tr>
   </table>
   <br>
   <div align="center">
        <button id="addbtn" type="button" class="btn btn-primary">요리순서 추가</button>
      <button type="submit" class="btn btn-primary" onclick="">레시피등록</button>
   </div>
   </form>
   
   
   </div>
   

<script>
  let i = 1;
  let j = 2;

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

  let imageup0 = document.getElementById('recImage0');
  let frame0 = document.getElementById('frame0');
  
  let imageup1 = document.getElementById('recImage1');
  let frame1 = document.getElementById('frame1');
  
  let imageup2 = document.getElementById('recImage2');
  let frame2 = document.getElementById('frame2');
 
  let imageup3 = document.getElementById('recImage3');
  let frame3 = document.getElementById('frame3');
  
  let imageup4 = document.getElementById('recImage4');
  let frame4 = document.getElementById('frame4');
  
  let imageup5 = document.getElementById('recImage5');
  let frame5 = document.getElementById('frame5');
  
  
  
  
  imageup0.addEventListener('change', function(e) {
       let file = e.target.files[0]
      //Do something with the image file.
       frame0.src = URL.createObjectURL(file);
      });
  
  imageup1.addEventListener('change', function(e) {
     let file = e.target.files[0]
     // Do something with the image file.
     frame1.src = URL.createObjectURL(file);
     });
  
  imageup2.addEventListener('change', function(e) {
     let file = e.target.files[0]
     // Do something with the image file.
     frame2.src = URL.createObjectURL(file);
     });
  
  imageup3.addEventListener('change', function(e) {
     let file = e.target.files[0]
     // Do something with the image file.
     frame3.src = URL.createObjectURL(file);
     });
  imageup4.addEventListener('change', function(e) {
     let file = e.target.files[0]
     // Do something with the image file.
     frame4.src = URL.createObjectURL(file);
     });
  imageup5.addEventListener('change', function(e) {
     let file = e.target.files[0]
     // Do something with the image file.
     frame5.src = URL.createObjectURL(file);
     }); 

  
  
  
</script>
</body>
</html>