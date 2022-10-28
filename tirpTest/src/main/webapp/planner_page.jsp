<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kakao API</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<p><em>지도를 클릭해주세요!</em></p> 
<div id="clickLatlng"></div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
// 지도 중심좌표에 마커를 생성합니다 
position: map.getCenter() 
}); 
//지도에 마커를 표시합니다
marker.setMap(map);

//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        

// 클릭한 위도, 경도 정보를 가져옵니다 
var latlng = mouseEvent.latLng; 

// 마커 위치를 클릭한 위치로 옮깁니다
marker.setPosition(latlng);

var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
message += '경도는 ' + latlng.getLng() + ' 입니다';

var resultDiv = document.getElementById('clickLatlng'); 
resultDiv.innerHTML = message;

});
</script>
    <table>
    <tr>
            <th>주소</th>
            <td><input type="text" id="address_kakao" name="address" readonly /></td>
        </tr>
    </table>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>