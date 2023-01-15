<%@ page import="com.yori.domain.MemberDTO" %>
<%@ page import="com.yori.repository.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
%>
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


   
<div class="container-fluid">
	<jsp:include page="nav.jsp"/>
		<div class="row">
		<div class="col">
				<div class="con-center">
					<h2>회원 정보</h2> <hr>
				</div>
				<form method="post">
				<div class="form-group">
					<div class="row">
							<div class="con-center">
								<label for="exampleInputPassword1">아이디 :<%=loginMember.getMemId() %></label>  <br>
								<label for="exampleInputPassword1">비밀번호 : <%=loginMember.getMemPwd() %></label> <br> 
								<label for="exampleInputPassword1">이름 : <%=loginMember.getMemName() %></label> <br> 
								<label for="exampleInputPassword1">성별 :  <%=loginMember.getMemGen() %> </label>  <br> 
								<label for="exampleInputPassword1">전화번호 :  <%=loginMember.getMemNum() %></label>
								 <br> <hr>
								<br> 
							<div class="col">		
								<button type="button" class="btn btn-primary" style="width:20%" 
									onClick="location.href='/yori/member/update'">회원정보수정</button>
						</div> <br> <br>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>		
<script>
</script>	
</body>
</html>