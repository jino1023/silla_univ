<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/custom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 모달 창 -->
<jsp:include page="./modal.jsp" />

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<!-- 로고 -->
			<a class="navbar-brand" href="/">MainPage</a>
			<!-- 토글 네비게이션 -->
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapsed">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="navbar-collapsed">
			<!-- 메뉴 -->
			<ul class="navbar-nav nav">
				<li><a href="/lesson/list">Lesson List</a></li>
				<!-- 로그인 -->
				<c:if test="${not empty loginUser}">
					<li><a href="/user/sugang">Sugang Confirm</a></li>
					<c:if test="${loginUser.id eq 'admin'}">
						<li><a href="/user/list">User List</a></li>
					</c:if>
				</c:if>
			</ul>
			<!-- 비로그인 -->
			<c:if test="${empty loginUser}">
				<ul class="navbar-nav nav navbar-right">
					<li><a data-toggle="modal" href="#loginModal">Login</a></li>
				</ul>
			</c:if>
			<!-- 로그인 -->
			<c:if test="${not empty loginUser}">
				<form id="logoutForm" action="/user/logout" method="post"></form>
				<ul class="navbar-nav nav navbar-right">
					<li><p class="navbar-text" style="color:white">　안녕하세요, <a href="/user/info"><strong>${loginUser.name}</strong></a><small>(${loginUser.id})</small>님!</p></li>
					<li><a href="#" onclick="$('#logoutForm').submit()">Logout</a></li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>

<script>
    $(document).ready(function () {
        var url = window.location;
        $('ul.nav a').filter(function() {
            return this.href == url;
       }).parent().addClass('active');
    });
</script> 