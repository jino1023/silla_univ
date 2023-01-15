<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="UTF-8" >
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0">
<title>무제 문서</title>
</head>

<style>
	.login-page {
	  width: 500px;
	  heigth: 500px;
	  padding: 8% 0 0;
	  margin: auto;
	}
	.form {
	  position: relative;
	  z-index: 1;
	  background: #FFFFFF;
	  max-width: 500px;
	  margin: 0 auto 100px;
	  padding: 45px;
	  text-align: center;
	  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	.form input {
	  font-family: "Roboto", sans-serif;
	  background: #f2f2f2;
	  width: 100%;
	  border: 0;
	  margin: 0 0 15px;
	  padding: 15px;
	  box-sizing: border-box;
	  font-size: 14px;
	}
	.form button {
	  font-family: "Roboto", sans-serif;
	  text-transform: uppercase;
	  background: #4CAF50;
	  width: 100%;
	  border: 0;
	  padding: 15px;
	  color: #FFFFFF;
	  font-size: 14px;
	}
</style>

<body>
	<jsp:include page="./nav.jsp"/>
	<div class="login-page">
	  <div class="form">
	    <form action="/yori/member/loginPost" method="post" class="login-form">
	      <input type="text" class="form-control" placeholder="Enter ID" id="memId" name="memId" required>
	      <input type="password" class="form-control" placeholder="Enter password" id="memPwd" name="memPwd" required>
	      <button type="button" class="btn btn-primary" onclick="login()">login</button>
	    </form>
	  </div>
	</div>
</body>
<script>
	function login() {
		$.ajax({
	        type: "POST",
	        url: "/yori/member/login",
	        data: {
	        	memId: $("#memId").val(),
	        	memPwd: $("#memPwd").val()
	        },
	        success: function(result) {
	        	if (result == "SUCCESS") {
	        		alert("로그인에 성공했습니다.");
	        		location.href = "/yori/index";
	        	} else {
	        		alert("아이디나 비밀번호가 일치하지 않습니다.");
	        		location.reload();
	        	}
	        }	
	   });
	}
</script>
</html>
