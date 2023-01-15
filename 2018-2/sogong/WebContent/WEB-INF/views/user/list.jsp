<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			<div class="col-md-8 col-md-offset-2">
				<h3 style="font-weight: bold">유저 목록</h3>
				<div class="table-responsive" style="border:none">
					<table class="table">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Type</th>
								<th>Contact</th>
								<th>City</th>
								<th>Point</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${userList}">
								<tr>
									<td>${user.id}</td>
									<td>${user.name}</td>
									<td>${user.type eq 1 ? '학생' : '선생'}</td>
									<td>${user.contact}</td>
									<td>${user.city}</td>
									<td>${user.point}</td>
									<td><c:if test="${user.id ne 'admin'}"><input type="button" onclick="remove('${user.id}')" value="삭제"></c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 꼬리말 -->
	<jsp:include page="../include/footer.jsp" />
	
</body>
<script>
	function remove(id) {
		if(confirm("정말로 " + id + " 회원을 제명하시겠습니까?")) {
			$.ajax({
				type: "post",
				url: "/user/delete",
				data: {
					id: id
				},
				success: function(result) {
					if (result == "SUCCESS") {
						alert("회원 제명이 정상적으로 처리되었습니다.");
					} else {
						alert("회원 제명이 정상적으로 처리되지 못했습니다.");
					}
					location.reload();
				}
			});
		}
	};

</script>
</html>