<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,com.springbook.biz.planner.PlannerVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<title>Insert title here</title>
<style>
.container {
	padding-top: 120px;
	padding-bottom: 120px;
}
</style>
</head>
<body>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
	<script>
		$(document).ready(function() {

			$("hr").css({
				"width" : "66%",
				"border" : "solid 1.5px green"
			});

		});
	</script>
	<form action="NewFile2.jsp">
		<div class="container px-1 px-sm-5 mx-auto">
			<h2 style="padding-left: 18%">지역을 선택해주세요 (최대 3개)</h2>
			<br> <br> <br> 
			<div>
			<c:forEach items="${tourList}" var="tour">
			<div>
			<p>${tour.title}</p>
			<p>${tour.firstimage}</p>
			</div>
			</c:forEach>
				</div>
		</div>
		<div
			style="margin: auto; width: 600px; position: absolute; bottom: 0px; padding-bottom: 250px; transform: translate(-50%, 0%); left: 50%">
			<hr
				style="float: left; transition-property: width; transition-duration: 2s; width: 33%">
			<br> <br> <input type="submit" value="이전"
				class="btn btn-light btn-lg"> <input type="submit"
				value="선택" class="btn btn-outline-success btn-lg"
				style="float: right;">
		</div>
	</form>
</body>
</html>