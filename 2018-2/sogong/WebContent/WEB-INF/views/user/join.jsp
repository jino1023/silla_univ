<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initiol-scale=1">
	<title>과외서비스</title>
</head>
<body>
	<!-- 네비게이션 바 -->
	<jsp:include page="../include/navbar.jsp" />
	
	<!-- 컨테이너 -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12" align="center">
				<div class="table-responsive" style="border:none">
					<table class="table" style="width:510px">
						<thead>
							<tr>
								<th colspan="3" style="font-size:20px">회원가입 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width:100px">ID</td>
								<td style="width:170px"><input type="text" name="userID" maxlength="20" placeholder="아이디" onfocusout="checkID()"></td>
								<td id="idLabel"><small></small></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="userName" maxlength="20" placeholder="닉네임" onfocusout="checkName()"></td>
								<td id="nameLabel"><small></small></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="userPassword" maxlength="20" placeholder="비밀번호" onfocusout="checkPassword()"></td>
								<td id="passwordLabel"><small></small></td>
							</tr>
							<tr style="border-top:hidden">
								<td></td>
								<td><input type="password" name="userPasswordConfirm" maxlength="20" placeholder="비밀번호 재확인" onfocusout="checkPassword()"></td>
								<td id="passwordConfirmLabel"><small></small></td>
							</tr>
							<tr>
								<td>Type</td>
								<td>
									<input type="radio" name="userType" value="1" checked>학생 
									<input type="radio" name="userType" value="2">선생
								</td>
								<td></td>
							</tr>
							<tr>
								<td>City</td>
								<td>
									<select name="userCity">
									  <option value="서울" selected>서울</option>
									  <option value="부산">부산</option>
									</select>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>Contact</td>
								<td><input type="text" name="userContact" maxlength="20" placeholder="연락처" onfocusout="checkContact()"></td>
								<td id="contactLabel"><small></small></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" align="center">
			<div style="width:530px; padding-right:10px; max-width: 100%" align="right">
				<button type="button" class="btn btn-default" onclick="register()">sign up</button>
			</div>
		</div>
	</div>
	
	<!-- 꼬리말 -->
	<jsp:include page="../include/footer.jsp" />
	
</body>
<script>
	function setText(target, text, color) {
		target.css("opacity", 1.0);
		if (color == "red" || target.text() != text) {
			target.hide().text(text).css("color", color).fadeIn(500);
		}
	};
	
	function hideText(target) {
		target.animate({opacity: 0.0}, 250);
	};
	
	function checkID() {
		var userID = $("input[name='userID']").val();
		if (userID == "")                      setText($("#idLabel"), "아이디를 입력해주세요.", "red");
		else if (!/^[a-z0-9]+$/g.test(userID)) setText($("#idLabel"), "영어 소문자와 숫자로만 가능합니다.", "red");
		else if (!/^[a-z]/g.test(userID))      setText($("#idLabel"), "영어 소문자로 시작해야 합니다.", "red");
		else if (userID.length < 6)            setText($("#idLabel"), "최소 6자 이상이어야 합니다.", "red");
		else {
			var able = false;
			$.ajax({
				type: "post",
				url: "/user/checkID",
				data: "id=" + $("input[name='userID']").val(),
				async: false,
				success: function(result) {
					if (result == "SUCCESS") {
						setText($("#idLabel"), "사용 가능한 아이디입니다.", "green");
						able = true;
					} else {
						setText($("#idLabel"), "이미 사용중인 아이디입니다.", "red");
					}
				}
			});
			return able;
		}
		return false;
	};
	function checkName() {
		var userName = $("input[name='userName']").val();
		if (userName == "") {
			setText($("#nameLabel"), "닉네임을 입력해주세요.", "red");
			return false;
		} else {
			hideText($("#nameLabel"));
			return true;
		}
	};
	function checkPassword() {
		var userPassword = $("input[name='userPassword']").val();
		if (userPassword == "") {
			setText($("#passwordLabel"), "비밀번호를 입력해주세요.", "red");
			hideText($("#passwordConfirmLabel"));
			return false;
		} else if (userPassword.length < 6) {
			setText($("#passwordLabel"), "최소 6자 이상이어야 합니다.", "red");
			hideText($("#passwordConfirmLabel"));
			return false;
		} else {
			hideText($("#passwordLabel"));
		}
		
		var userPasswordConfirm = $("input[name='userPasswordConfirm']").val();
		if (userPasswordConfirm == "")                setText($("#passwordConfirmLabel"), "비밀번호 확인을 입력해주세요.", "red");
		else if (userPassword != userPasswordConfirm) setText($("#passwordConfirmLabel"), "비밀번호 확인이 일치하지 않습니다.", "red");
		else {
			setText($("#passwordConfirmLabel"), "비밀번호 확인이 일치했습니다.", "green");
			return true;
		}
		return false;
	};
	
	function checkContact() {
		var userContact = $("input[name='userContact']").val();
		if (userContact == "")                                setText($("#contactLabel"), "연락처를 입력해주세요.", "red");
		else if (!/^\d{3}-\d{3,4}-\d{4}$/g.test(userContact)) setText($("#contactLabel"), "연락처 양식만 가능합니다.", "red");
		else {
			hideText($("#contactLabel"));
			return true;
		}
		return false;
	};
	function register() {
		if (checkID() && checkPassword() && checkContact() && checkName()) {
			$.ajax({
				type: "post",
				url: "/user/join",
				data: {
					id: $("input[name='userID']").val(),
					name: $("input[name='userName']").val(),
					password: $("input[name='userPassword']").val(),
					contact: $("input[name='userContact']").val(),
					type: $("input[name='userType']:checked").val(),
					city: $("select[name='userCity'] option:selected").val()
				},
				success: function(result) {
					if (result == "SUCCESS") {
						alert("회원가입이 정상적으로 처리되었습니다.");
						location.href = "/";
					} else {
						alert("회원가입이 정상적으로 처리되지 못했습니다.");
						location.href = "/user/join"
					}
				}
			});
		}
	};
</script>
</html>