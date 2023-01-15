<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yori.domain.RecipeDTO" %>

<%@ page import="com.yori.repository.*" %>
<%@ page import="com.yori.domain.CategoryhDTO" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="UTF-8" >
<%
	RecipeDAO recipeDao = new RecipeDAO();
	ArrayList<RecipeDTO> populmenu = recipeDao.Populmenu();
	request.setAttribute("populmenu", populmenu);
%>
<head>
 <meta charset="UTF-8">
 <title>Homepage test</title>
 <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'>
 <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700'>
 <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
 <link rel="stylesheet" href="/yori/css/main.css">
</head>
<style>
.sec-main {
  position: relative;
  height: 560px;
  background: url(https://imgnews.pstatic.net/image/469/2017/07/06/0000215313_001_20170709221652510.jpg?type=w647/kVf7VRgg4p8/1920x1080) no-repeat center center;
  background-size: cover;

  &:after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, .5);
  }
}
</style>
<body>
  <jsp:include page="./nav.jsp"/>

  <section id="folio" class="sec-folio">
    <div class="container">
    
      <h1>인기메뉴</h1>

      <hr/>
	  
	  <div class="row">
	      <c:forEach items="${populmenu}" var="popul">
	        <div class="col-md-4">    
	          <img class="center-block" src="${popul.recImage.split('@')[0]}" alt="By Scott Webb" height="200" width="350"/>
	        </div>
	  	  </c:forEach>
      </div>
     </div>
  </section>

  <footer id="footer">
    <div class="container">
      
    </div>
  </footer>
</body>
</html>