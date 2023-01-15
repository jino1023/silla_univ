<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.yori.domain.RecipeDTO" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>Homepage test</title>
 <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="/yori/css/main.css">
</head>
<body>
	<jsp:include page="./nav.jsp"/> 
	
	<!-- Page Content -->
    <div class="container">
					
      <!-- Page Heading -->
      <h1 class="my-4">요리레시피목록</h1>
      
 		<!-- 레시피검색 -->
      <form method="POST" action="/yori/recipe/search">
	      <div class="input-group" style="width:300px;">
	      	<input id="search" name="search" type="text" class="form-control ui-autocomplete-input" 
	      		 	placeholder="검색" style="ime-mode:active;" autocomplete="off">
	      	<span class="input-group-btn">
		        <button class="btn btn-success" type="submit">
		        	<i class="fa fa-search"></i>
		        </button>
	        </span>
	      </div>
	  </form>
 	  <br><br>
      <c:forEach items="${recipeList}" var="recipe">
	      <div class="row">
	        <div class="col-md-8">
	          <a href="#">
	            <img class="img-fluid rounded mb-3 mb-md-0" src="${recipe.recImage.split('@')[0]}">
	          </a>
	        </div>
	        <div class="col-md-5">
	          <h3>요리이름 : ${recipe.recName}</h3>
	          <p>요리설명 : ${recipe.recText}</p>
	          <p>번호 : ${recipe.recNum}</p>
	          <a class="btn btn-primary" href="/yori/recipe/detail?num=${recipe.recNum}">상세정보</a>
	        </div>
	      </div>
	      <hr>
	  </c:forEach>  
    </div>
	
</body>
</html>