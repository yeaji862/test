<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.springbook.biz.planner.tourSearchVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<body>
<div id="map" style="width:600px;height:300px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b96ec8a7c96b4f5663ea3d19a4bbc885"></script>

<script>
//마커를 표시할 위치와 title 객체 배열입니다 
var mapContainer = document.getElementById('map') // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.52750352439024, 126.54425244664849), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>
<script>
function test(num) {
// 지도를 생성합니다
      var title = $('#' + num).text();
      var addr = $('#add' + num).text();
	  var mapy = $('#y' + num).text();
	  var mapx = $('#x' + num).text();
	  console.log("명소이름 : "+title);
	 
	  if($('.number').length < 3 ){
		  $("#plus").append("<a class='number "+$('.number').length+"'> " +title + "<a> <button onclick='button("+$('.number').length+")' class='"+$('.number').length+"'>빼기</button>");  
	  }else
	  alert("3개까지")
	  
     mapOption = { 
    	        center: new kakao.maps.LatLng(mapy,mapx), // 지도의 중심좌표
    	        level: 3 // 지도의 확대 레벨
    	    };
     var map = new kakao.maps.Map(mapContainer, mapOption); // 새로운 중심좌표 생성
     var positions = [
    	   {
    	        title: '카카오', 
    	        latlng: new kakao.maps.LatLng(mapy, mapx)
    	    } 
    	]; 
     
     var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
     
     for (var i = 0; i < positions.length; i ++) {
         
         // 마커 이미지의 이미지 크기 입니다
         var imageSize = new kakao.maps.Size(24, 35); 
         
         // 마커 이미지를 생성합니다    
         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
         
         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
             map: map, // 마커를 표시할 지도
             position: positions[i].latlng, // 마커를 표시할 위치
             title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
             image : markerImage // 마커 이미지 
         });
     }
     
};

function button(num){
	 if($('.number').length >= 0){
		 	
		  $("." + num).remove();  
	  }
}

</script>
<form action="tourApiHouseSearch.do">
<input type="text" name="title"  placeholder="소제목 입력 창"><br>
<input type="text" placeholder="검색" name="keyWorld">
<input type="submit" value="데이터 확인">

<c:forEach items="${tourList}" var="tour" begin="0" step="1" varStatus="status">
			<div>
			<img src="${tour.firstimage}" style="width:50px;height:50px;">
			<a href="#" onclick="test(${status.index})" id="${status.index}">${tour.title}</a> <small id="add${status.index}">${tour.addr1}</small>
			<a href="#" onclick="test()" id="x${status.index}" style="display:none;">${tour.mapx}</a>
			<a href="#" onclick="test()" id="y${status.index}" style="display:none;">${tour.mapy}</a>
			</div>
			</c:forEach> 
			<input type="submit" name="page" value="이전">
			<input type="submit" name="page" value="이후">
			<input type="hidden" value="${hidden}" name="hidden">
			<div>
			<p id="plus"></p>
			
			</div>
	
</form>
</body>
</html>