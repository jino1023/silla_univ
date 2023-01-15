<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 로그인 모달 -->
<div class="modal fade" id="loginModal">
	<div class="modal-dialog" style="width:500px">
		<div class="modal-content" style="width:500px">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
				<h4 class="modal-title">로그인</h4>
			</div>
			<div class="modal-body">
				<form id="loginForm" action="/user/login" method="post">
					<div class="form-group">
						<input class="form-control" type="text" name="loginID" placeholder="아이디" maxlength="20">
					</div>
					<div class="form-group">
						<input class="form-control" type="password" name="loginPassword" placeholder="비밀번호" maxlength="20">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="login()">로그인</button>
				<button type="button" class="btn btn-default" onclick="location.href='/user/join'">회원가입</button>
			</div>
		</div>
	</div>
</div>

<script>
	$("input[name='loginID']").keyup(function(event) {
		if (event.keyCode == 13) {
			login();
		}
	});
	$("input[name='loginPassword']").keyup(function(event) {
		if (event.keyCode == 13) {
			login();
		}
	});
	function login() {
		var loginID       = $("input[name='loginID']").val();
		var loginPassword = $("input[name='loginPassword']").val();
		
		if (loginID == "") $("input[name='loginID']").focus();
		else if (loginPassword == "") $("input[name='loginPassword']").focus();
		else {
			$.ajax({
				type: "post",
				url: "/user/login",
				data: {
					id: loginID,
					password: loginPassword
				},
				success: function(result) {
					if (result == "SUCCESS") {
						location.reload();
					} else {
						alert("아이디가 없거나, 비밀번호가 일치하지 않습니다.");
						$("input[name='loginPassword']").val("");
					}
				}
			});
		}
	};
</script>