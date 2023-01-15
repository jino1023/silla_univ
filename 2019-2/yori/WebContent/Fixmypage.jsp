<%@page import="java.sql.*"%>
<%@ page import="com.yori.*" %>
<%@ page import="com.yori.domain.MemberDTO" %>
<%@ page import="com.yori.repository.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style>
	div.login {
		width:300px;
		height:280px;
	}
	div.con-left {
		text-align: left;
	}
	div.con-center {
		text-align: center;
	}div.con-right {
		text-align: right;
	}
	button.loginform{
		width:100%;
	}
	
</style>
</head>

<body class="bg-light">

<%
	MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
	String loginMemberId = loginMember.getMemId();
%>

<div class="container-fluid">
	<jsp:include page="nav.jsp"/>
		<div class="row">
		<div class="col">
				<div class="con-center">
					<h2>회원 정보 수정</h2> <hr>
				</div>
				<form>
				<div class="form-group">
					<div class="row">
							<div class="con-center">
								<label for="exampleInputPassword1">아이디 : <input type="text" class="form-control" id="memId" name="memId"  value = "<%=loginMember.getMemId() %>"
									 style="width: 30%" readonly>></label>  <br>
								<label for="exampleInputPassword1">비밀번호 : <input type="password" class="form-control" id="memPwd" name="memPwd"  value = "<%=loginMember.getMemPwd() %> "
									 style="width: 30%"></label> <br> 
								<label for="exampleInputPassword1">이름 : <input type="text" class="form-control" id="memName" name="memName"value = "<%=loginMember.getMemName() %> "
									 style="width: 30%"></label> <br> 
								<label for="exampleInputPassword1">성별 :  <input type="text" class="form-control"  id="memGen" name="memGen" value = "<%=loginMember.getMemGen() %> "
									 style="width: 30%"> </label>  <br> 
								<label for="exampleInputPassword1">전화번호 :  <input type="text" class="form-control" id="memNum" name="memNum"value = "<%=loginMember.getMemNum() %> "
									 style="width: 30%"></label>
								<br>  <hr>
								<div class="col">
							<input type="submit" value="수정"  class="btn btn-primary" style="width: 20%"
								onClick="return update()"></button>
						</div> <br> <br>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>	
<script>
	function update() {	  
	    $.ajax({
	         type: "POST",
	         url: "/yori/member/update",
	         data: {
	            memPwd: $("#memPwd").val(),
	            memName: $("#memName").val(),
	            memGen: $("#memGen").val(),
	            memNum: $("#memNum").val(),
	            memId: "<%= loginMemberId %>"
	         },
	         success: function(result) {
	            if (result == "SUCCESS") {
	               alert("회원정보 수정완료");
	               location.href = "/yori/index";
	            } else {
	               alert("회원정보 수정실패");
	               location.reload();
	            }
	         }   
	    });
	}
</script>		
</body>
</html>