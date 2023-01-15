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
			<div class="col-md-8 col-md-offset-2"  id="type1">
				<h3 style="font-weight: bold">수강목록(학생용)</h3>
				<div class="table-responsive" style="border:none">
					<table class="table">
						<thead>
							<tr>
								<th>subject</th>
								<th>teacherID</th>
								<th>teacherName</th>
								<th>PayCheck</th>
								<th>PayDate</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="sugang" items="${sugangList}">
								<tr>
									<td>${sugang["subject"]}</td>
									<td>${sugang["teacherID"]}</td>
									<td>${sugang["teacherName"]}</td>
									<td>${sugang['payCheck'] eq 0 ? '미확인' : '확인'}</td>
									<td>${sugang["payDate"]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-8 col-md-offset-2"   id="type2">
				<h3 style="font-weight: bold">강좌목록(선생용)</h3>
				<div class="table-responsive" style="border:none">
					<table class="table">
						<thead>
							<tr>
								<th>subject</th>
								<th>studentID</th>
								<th>studentName</th>
								<th>PayCheck</th>
								<th>PayDate</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="sugang" items="${sugangList}">
								<tr>
									<td>${sugang["subject"]}</td>
									<td>${sugang["studentID"]}</td>
									<td>${sugang["studentName"]}</td>
									<td>${sugang['payCheck'] eq 0 ? '미확인' : '확인'}</td>
									<td>${sugang["payDate"]}</td>
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
	$(document).ready(function() {
		if (${loginUser.type} == 1) 		{$("#type2").hide();}
		else if (${loginUser.type} == 2)	{$("#type1").hide();}
	});
</script>
</html>