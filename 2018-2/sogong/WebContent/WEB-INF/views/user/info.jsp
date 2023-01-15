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
								<th colspan="3" style="font-size:20px">회원정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width:100px">ID</td>
								<td style="width:170px"><input type="text" name="userID" maxlength="20" readonly value='${loginUser.id}'></td>
								<td id="idLabel"><small></small></td>
							</tr>
							<tr>
								<td>Name</td>
								<td><input type="text" name="userName" maxlength="20" value='${loginUser.name}' onfocusout="checkName()"></td>
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
									<input type="radio" name="userType" value="1" disabled>학생 
									<input type="radio" name="userType" value="2" disabled>선생
								</td>
								<td></td>
							</tr>
							<tr>
								<td>City</td>
								<td>
									<select name="userCity" id="City">
									  <option value="서울" >서울</option>
									  <option value="부산">부산</option>
									</select>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>Contact</td>
								<td><input type="text" name="userContact" maxlength="20" value='${loginUser.contact}' onfocusout="checkContact()"></td>
								<td id="contactLabel"><small></small></td>
							</tr>
							<tr>
								<td>Point</td>
								<td><input type="text" name="userPoint" maxlength="20" readonly value='${loginUser.point}'></td>
								<td id="pointLabel"><small></small></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" align="center">
			<div style="width:530px; padding-right:10px; max-width: 100%" align="right">
				<button type="button" class="btn btn-default" onclick="update()">Update</button>
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

	$(document).ready(function() {
		$('input:radio[name=userType]:input[value='+${loginUser.type}+']').attr("checked",true);
		$("#City").val('${loginUser.city}');
	});
	
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
	function update() {
		if (checkPassword() && checkContact() && checkName()) {
			$.ajax({
				type: "post",
				url: "/user/update",
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
						alert("회원정보 수정이 정상적으로 완료되었습니다");
						location.href = "/";
					} else {
						alert("회원정보 수정이 정상적으로 처리되지 못했습니다.");
						location.href = "/user/info"
					}
				}
			});
		}
	};
</script>
</html>