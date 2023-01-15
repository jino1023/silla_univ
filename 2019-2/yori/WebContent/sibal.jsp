<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>시발련들아</h1>
	<div class="row">
	      <c:forEach items="${populmenu}" var="popul">
	        <div class="col-md-4">
	          <img class="center-block" src="${popul.recImage.split('@')[0]}" alt="By Scott Webb" />
	        </div>
	  </c:forEach>

      </div>
</body>
</html>