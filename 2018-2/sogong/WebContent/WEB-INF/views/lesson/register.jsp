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
								<th colspan="3" style="font-size:20px">수강등록 페이지</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Id</td>
								<td><input type="text" name="userID" readonly value='${loginUser.id}'></td>
							</tr>
							<tr>
								<td>Subject</td>
								<td>
								<input type="radio" name="lessonSubject" value="국어" checked>국어
								<input type="radio" name="lessonSubject" value="수학">수학 
								<input type="radio" name="lessonSubject" value="사회">사회
								<input type="radio" name="lessonSubject" value="과학">과학
								</td>
							</tr>
							<tr>
								<td>LessonPrice</td>
								<td><input type="number" name="lessonPrice" placeholder="가격" value="0"></td>
								<td id="priceLabel"><small></small></td>
							</tr>
							
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" align="center">
			<div style="width:530px; padding-right:10px; max-width: 100%" align="right">
				<button type="button" class="btn btn-default" onclick="register()">수강등록</button>
			</div>
		</div>
</div>	
	
	

	<!-- 꼬리말 -->
	<jsp:include page="../include/footer.jsp" />
	
</body>

<script>
	function register() {
		$.ajax({
			type: "post",
			url: "/lesson/register",
			data: {
				subject: $("input[name='lessonSubject']:checked").val(),
				price: Math.abs($("input[name='lessonPrice']").val())
			},
			success: function(result) {
				if (result == "SUCCESS") {
					alert("수강등록이 정상적으로 처리되었습니다.");
					location.href = "/lesson/list";
				} else {
					alert("수강등록이 정상적으로 처리되지 못했습니다.");
					location.reload();
				}
			}
			});
		};
</script>
</html>