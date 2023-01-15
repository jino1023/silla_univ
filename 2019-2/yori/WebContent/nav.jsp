<%@page import="com.yori.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'>
 <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700'>
 <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
</head>
<body>

   <div class="wrapper">
     <header role="header">
       <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
         <div class="container">
           <div class="navbar-header">
             <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse" role="button">
               <span class="sr-only">Toggle Navigation</span>
               
               <span class="icon-bar"></span>
               
               <span class="icon-bar"></span>
               
               <span class="icon-bar"></span>
             </button>
   
             <a href="/yori/index" class="navbar-brand">요리조리</a>
           </div>
   
           <div class="collapse navbar-collapse">
             <ul class="nav navbar-nav navbar-right js-nav">
               <li><a href="/yori/index">Home</a></li>
   
               <li><a href="/yori/recipe/list">레시피</a></li>
                <li><a href="/yori/reply/sibal">레시피</a></li>
                <c:if test="${!empty loginMember}">
                   <li><a href="/yori/recipe/register">레시피등록</a></li>
				   <li><a href="/yori/member/mypage">마이페이지</a></li>
                  <li><a href="" onclick="logout()">로그아웃</a></li>
               </c:if>
               <c:if test="${empty loginMember}">                  
                  <li><a href="/yori/member/signup">회원가입</a></li>
                  <li><a href="/yori/member/login">로그인</a></li>
               </c:if>
               
             </ul>
           </div>
         </div>
       </nav>
     </header>

     <section id="home" class="sec-main">
    
     </section>   
   </div>
</body>
<script>
   function logout() {
      $.ajax({
           type: "POST",
           url: "/yori/member/logout",
           success: function(result) {
              alert("로그아웃 하였습니다.");
              location.href="/yori/index";
           }   
      });
   }
</script>
</html>