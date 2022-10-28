<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b96ec8a7c96b4f5663ea3d19a4bbc885&libraries=services"></script>
<script>
var map = new naver.maps.Map("map", {
    center: [127.1113383, 37.3580504],
    zoom: 14,
    mapTypeId: "normal"
}),
upperP1 = new naver.maps.LatLng([127.1059799194336, 37.359788198380755]),
upperP2 = new naver.maps.LatLng([127.1059799194336, 37.368861139209535]),
lowerP1 = upperP1.destinationPoint(180, 1500),
lowerP2 = upperP2.destinationPoint(180, 1500),
strokeWeight = 6;

//폴리라인의 시작/끝 점에 아이콘을 추가합니다.
//아이콘 크기를 지정하지 않은 경우, 폴라리인의 strokeWeight값에 영향을 받습니다.
var openArrowLine = new naver.maps.Polyline({
    path: [
        upperP1,
        upperP2
    ],
    map: map,
    endIcon: naver.maps.PointingIcon.OPEN_ARROW,
    strokeColor: '#ff0000',
    strokeWeight: strokeWeight
});

var blockArrowLine = new naver.maps.Polyline({
    path: [
        upperP1.destinationPoint(90, 400),
        upperP2.destinationPoint(90, 400)
    ],
    map: map,
    endIcon: naver.maps.PointingIcon.BLOCK_ARROW,
    strokeColor: '#ff0000',
    strokeWeight: strokeWeight
});

var circleAndDiamondLine = new naver.maps.Polyline({
    path: [
        upperP1.destinationPoint(90, 800),
        upperP2.destinationPoint(90, 800)
    ],
    map: map,
    startIcon: naver.maps.PointingIcon.CIRCLE,
    endIcon: naver.maps.PointingIcon.DIAMOND,
    strokeColor: '#ff0000',
    strokeWeight: strokeWeight
});

//아이콘 크기를 지정한 경우, 폴라리인의 strokeWeight값에 영향을 받지 않습니다.
var sizedOpenArrowLine = new naver.maps.Polyline({
    path: [
        lowerP1,
        lowerP2
    ],
    map: map,
    endIcon: naver.maps.PointingIcon.OPEN_ARROW,
    //아이콘의 크기를 지정합니다. 단위는 픽셀입니다.
    endIconSize: 20,
    strokeColor: '#ff0000',
    strokeWeight: strokeWeight
});

var sizedBlockArrowLine = new naver.maps.Polyline({
    path: [
        lowerP1.destinationPoint(90, 400),
        lowerP2.destinationPoint(90, 400)
    ],
    map: map,
    endIcon: naver.maps.PointingIcon.BLOCK_ARROW,
    endIconSize: 40,
    strokeColor: '#ff0000',
    strokeWeight: strokeWeight
});

//아이콘에는 투명도가 적용되지 않습니다.
var sizedCircleAndDiamondLine = new naver.maps.Polyline({
    path: [
        lowerP1.destinationPoint(90, 800),
        lowerP2.destinationPoint(90, 800)
    ],
    map: map,
    startIcon: naver.maps.PointingIcon.CIRCLE,
    startIconSize: 10,
    endIcon: naver.maps.PointingIcon.DIAMOND,
    endIconSize: 10,
    strokeColor: '#ff0000',
    strokeOpacity: 0.5,
    strokeWeight: strokeWeight
});


var polylines = [
openArrowLine,
blockArrowLine,
circleAndDiamondLine,
sizedOpenArrowLine,
sizedBlockArrowLine,
sizedCircleAndDiamondLine
];

document.getElementById('increase_sw').addEventListener('click', function() {
strokeWeight++;

for (var i = 0, len = polylines.length; i < len; i++) {
    polylines[i].setOptions({strokeWeight: strokeWeight});
}
});

document.getElementById('decrease_sw').addEventListener('click', function() {
if (strokeWeight === 1) return;

strokeWeight--;

for (var i = 0, len = polylines.length; i < len; i++) {
    polylines[i].setOptions({strokeWeight: strokeWeight});
}
});
</script>
</body>
</html>