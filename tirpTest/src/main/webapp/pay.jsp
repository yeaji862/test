<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><!-- jQuery CDN --->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var chk = false;
$(document).ready(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('${impKey}');
	$("#check_module").click(function () {
		IMP.request_pay({
			pg: 'inicis', // 자신이 설정한 pg사 설정
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: '주문명:결제테스트',
			amount: $("#amount").val(),
			buyer_email: $("#umail").val() ,
			buyer_name: $("#unm").val() ,
			buyer_tel: $("#utel").val() ,
			buyer_addr: $("#uaddr").val() ,
			buyer_postcode: '123-456',
			m_redirect_url: 'http://localhost:8090/payments/complete'
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\n결제 금액 : ' + rsp.paid_amount;
					msg += '\n카드 승인번호 : ' + rsp.apply_num;
					
					$("#imp_uid").val(rsp.imp_uid);
					$("#merchant_uid").val(rsp.merchant_uid);
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
	
	
	$("#cancel_module").click(function () {
		$.ajax({
			url : "paycan",
			data : {"mid": $("#merchant_uid").val()},
			method : "POST",
			success : function(val){
				console.log(val);
				if(val==1) alert("취소 완료");
				else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error :  function(request, status){
				alert("취소가 실패하였습니다.");
			}
		});
	});
	
	$("#list_module").click(function(){
		$.ajax({
			url : "payamount",
			data : {"mid": $("#merchant_uid").val()},
			method : "GET",
			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				if(val.msg!=null){
					$("#paylist").append(val.msg);
				}else{
					$("#paylist").append("고유ID: "+val.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+val.merchant_uid);
					$("#paylist").append("<br>주문상품: "+val.name);
					$("#paylist").append("<br>주문자: "+val.buyer_name);
					$("#paylist").append("<br>결제금액: "+val.amount);
				}
			},
			error :  function(request, status){
				alert("목록 가져오기를 할 수 없습니다.");
			}
		});
	});
	
	$("#all_module").click(function(){
		$.ajax({
			url : "paylist",
			method : "GET",
			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				$.each(val, function(i, v){
					$("#paylist").append("고유ID: "+v.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+v.merchant_uid);
					if(v.cancel_amount != 0 ) $("#paylist").append("<br><span style=\"color:red;font-weight:bold;\">주문취소</span>");
					else if(v.failed_at != 0 ) $("#paylist").append("<br><span style=\"color:pink;font-weight:bold;\">결제오류</span>");
					else $("#paylist").append("<br><span style=\"color:blue;font-weight:bold;\">결제완료</span>");
					$("#paylist").append("<br>주문상품: "+v.name);
					$("#paylist").append("<br>주문자: "+v.buyer_name);
					$("#paylist").append("<br>결제금액: "+v.amount+"<hr><br>");
				});
				
			},
			error :  function(request, status){
				alert("목록 가져오기를 할 수 없습니다.");
			}
		});
	});
	
});

function orderList(){
	alert('주문내역 처리할 곳. 컨트롤러 호출');
	let fm = document.fm;
	fm.action ="pay";
	fm.method="post";
	fm.submit();
}

</script>

</head>
<body>
<form name="fm">
<div style="position:sticky;top:0;left:0;background-color:#fff;padding-bottom:20px;border-bottom:1px solid #000;">
	<h2>아임 서포트 결제 모듈 테스트 해보기</h2><br>
	<h2>결제하기</h2>
	이름: <input type="text" name="unm" id="unm" placeholder="이름 입력"><br>
	전화번호: <input type="text" name="utel" id="utel" placeholder="예시: 010-1111-2222"><br>
	이메일: <input type="text" name="umail" id="umail" placeholder="이메일 입력"><br>
	주소: <input type="text" name="uaddr" id="uaddr" placeholder="주소 입력"><br>
	금액: <input type="number" name="amount" id="amount" ><br>	
	<button id="check_module" type="button">결제하기</button>
	<br><hr>	
	
	<h2>결제내역 관련</h2>
	imp_uid: <input type="text" name="imp_uid" id="imp_uid" placeholder="imp_uid 입력"><br>
	merchant_uid: <input type="text" name="merchant_uid" id="merchant_uid" placeholder="merchant_uid 입력"><br>
	<button id="cancel_module" type="button">취소하기</button>
	<button id="list_module" type="button">결제완료목록조회</button>
	<button id="all_module" type="button">모든목록조회</button>
</div>
	
	<p id="paylist"></p>
</form>

</body>
</html>