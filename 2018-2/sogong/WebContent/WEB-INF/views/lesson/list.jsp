<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sogong.domain.*" %>
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

		<div class="container">
		  <h2 align ="left" style="margin-bottom: 20px">수강 리스트</h2>
		  <form class="form-inline" method="get" action="/lesson/list">
				  <div class="form-group">
					<select class="form-control" name="type">
						<option ${param.type eq 'Date' ? 'selected':''}>Date</option>
						<option ${param.type eq 'Teacher' ? 'selected':''}>Teacher</option>
						<option ${param.type eq 'Subject' ? 'selected':''}>Subject</option>
						<option ${param.type eq 'City' ? 'selected':''}>City</option>
					</select>
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" name="keyword" value="${param.keyword}">
			  </div>
			  <button type="submit" class="btn btn-default">Search</button>
			  <div class="checkbox">
			    <label><input type="checkbox" name="contact" ${param.contact eq 'on' ? 'checked':''}>contactable</label>
			  </div>
			</form>    
			<hr>
		  <table class="table">
		    <thead>
		      <tr>
		        <th>Date</th>
		        <th>Teacher</th>
		        <th>Subject</th>
		        <th>City</th>
		        <th>Contact</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		  <c:forEach items="${lessonList}" var="lesson">
		      <tr>
		        <td>${lesson['date']}</td>
		     	<td>${lesson['teacher']}</td>
		     	<td>${lesson['subject']}</td>
		     	<td>${lesson['city']}</td>
		     	<c:if test="${lesson['contact'] eq 0}">
		     	<td style="color:green">
		     		연결가능
		 		</td>
		 		</c:if>
		 		
		 		<c:if test="${lesson['contact'] eq 1}">
		     	<td style="color:red">
		     		연결완료
		 		</td>
		 		</c:if>
		 		<td>
		 		<input type="button" class="btn btn-primary" onclick="location.href='/lesson/read?id=${lesson['id']}'" value="상세정보">
		 		</td>
		  
		      </tr>
		      </c:forEach>
		    </tbody>
		  </table>
		  <c:if test="${loginUser.type eq 2}">
		  <input type="button" class="btn btn-primary" onclick="location.href='/lesson/register'" value="등록">
		  </c:if>
		</div>
	<!-- 꼬리말 -->
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
	

	
