<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<title>Insert title here</title>
<style>

.container {
  padding-top: 120px;
  padding-bottom: 120px;
}

.input {
    padding: 30px 15px !important;
    border: 1px solid lightgrey !important;
    border-radius: 10px;
    box-sizing: border-box;
    background-color: #fff !important;
    color: #4CAF50 !important;
    font-size: 18px !important;
    letter-spacing: 1px;
    position: relative;
    font-weight: bold !important;
}

.input1 {
  text-align: left !important;
}

.input2 {
  text-align: right !important;
}

.input:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #512DA8;
    outline-width: 0;
}

::placeholder {
    color: #BDBDBD;
    opacity: 1;
}

:-ms-.input-placeholder {
    color: #BDBDBD;
}

::-ms-.input-placeholder {
    color: #BDBDBD;
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0;
}

.datepicker {
  background-color: #fff;
  border-radius: 0 !important;
  padding: 15px 20px !important;
  align-content: center !important;
}

.datepicker-dropdown {
  top: 0;
  left: calc(50% - 161px) !important;
}

.datepicker-dropdown.datepicker-orient-left:before {
  left: calc(50% - 6px) !important;
}

.datepicker-dropdown.datepicker-orient-left:after {
  left: calc(50% - 5px) !important;
}

.datepicker table tr td.today, span.focused {
  border-radius: 50% !important;
  background-image: linear-gradient(#FFF3E0, #FFE0B2);
}

.datepicker table tr td.today.range {
  background-image: linear-gradient(#eeeeee, #eeeeee) !important;
  border-radius: 0 !important;
}

/*Weekday title*/
thead tr:nth-child(3) th {
  font-weight: bold !important;
  padding-top: 10px;
  padding-bottom: 10px;
}

.old, .day, .new {
  width: 40px !important;
  height: 40px !important;
  border-radius: 0px !important;
  border: 1px solid lightgrey !important;
}

.day.old, .day.new {
  background-color: #F5F5F5 !important;
  color: #E0E0E0 !important;
}

.day.old:hover, .day.new:hover {
  border-radius: 0px !important;
}

.old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover, .decade:hover, .century:hover {
  border-radius: 50% !important;
  background-color: #eee;
}

.active {
  border-radius: 50% !important;
  background-image: linear-gradient(#90CAF9, #64B5F6) !important;
  color: #fff !important;
}

.range-start, .range-end {
  border-radius: 50% !important;
  background-image: linear-gradient(#4CAF50, #4CAF50) !important;
}

.range {
  color: #4CAF50 !important;
}

.prev, .next, .datepicker-switch {
  border-radius: 0 !important;
  padding: 10px 10px 10px 10px !important;
  font-size: 18px;
  opacity: 0.7;
  color: #4CAF50;
}

.prev:hover, .next:hover, .datepicker-switch:hover {
  background-color: inherit !important;
  opacity: 1;
}

@media screen and (max-width: 500px) {
  .datepicker-dropdown.datepicker-orient-right:before {
    right: calc(50% - 6px) !important;
  }

  .datepicker-dropdown.datepicker-orient-right:after {
    right: calc(50% - 5px) !important;
  }
}

</style>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	
	$("hr").css({
		"width" : "33%" , 
		"border" : "solid 1.5px green"
	});
	
	$('.input-daterange').datepicker({
		startDate: 'd',
	    format: 'yyyy-mm-dd',
	    autoclose: true
	});
	});
</script>
  <form action="getAreaList.do" method="post">
<div class="container px-1 px-sm-5 mx-auto">
      <h2 style="padding-left:18%">여행 날짜를 선택해주세요</h2>
      <br>
      <br>
      <br>
    <div class="flex-row d-flex justify-content-center">
      <div class="col-lg-6 col-11">
        <div class="input-group input-daterange">
          <input type="text" class="form-control input1 input" name="start" placeholder="시작일" readonly>
          <input type="text" class="form-control input2 input" name="end" placeholder="종료일" readonly><br>
        </div>
      </div>
    </div>
</div>
<div style="margin: auto; width:600px; position: absolute; bottom: 0px; padding-bottom:250px; transform : translate(-50%,0%); left:50%">
	<hr style="float:left; transition-property: width; transition-duration: 2s; width:0%">
	   <br>
	    <br>
	   <input type="submit" value="이전" class="btn btn-light btn-lg">
       <input type="submit" value="선택" class="btn btn-outline-success btn-lg" style="float: right;">
       </div>
  </form>
 
</body>
</html>