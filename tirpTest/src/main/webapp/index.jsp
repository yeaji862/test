<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    ul.head-ul {
        justify-content: space-around; /* space-evenly도 가능 */
        font-size: 30px;
    }
    .head-link {
    color: #000;
    }
    .main-login {
        margin-left: auto;
        color: #000;
        font-size: 20px;
        
    }
    .main-div {
        margin-top: 25px;
        margin-bottom: 25px;
        display: flex;
    }
    .head-logo {
    margin-right: auto;
    color: #000;
    font-size: 20px;
}   
input#head-serch {
    border-radius: 15px;
    padding: 10px;
    width: 30%;
    height: 65px;
}
ul.nav.nav-tabs {
    border: none;
    justify-content: center;
    font-size: 25px;
}
a.nav-link.active {
    border: none;
}
.nav-link:hover{
    border: none;
}
div#home, div#menu1, div#menu2, div#menu3 {
    background-color: lightgoldenrodyellow;
    text-align: center;
}
div.card-div {
    display: inline-block;
    margin: 20px;
}
.main-h1 {
    text-align: center;
}
/* .main-h11 {
    transform: translate( 25%, -1200% );
    color: purple;
} */

  </style>
</head>
<body>
<div class="container-fluid">
  <div class="container-fluid main-div">
  <a class="head-logo">로고</a>
  <input id="head-serch">
  <a class="main-login">로그인</a>
</div>
  <ul class="nav head-ul">
    <li class="nav-item">
      <a class="nav-link head-link" href="#">숙소</a>
    </li>
    <li class="nav-item">
      <a class="nav-link head-link" href="#">플래너</a>
    </li>
    <li class="nav-item">
      <a class="nav-link head-link" href="#">이용안내</a>
    </li>
  </ul>
</div>
<div>
<div class="main-img">
<img src="c://main1.jpg" style="width: 100%;">
</div>
<div class="main-h11">
<h1>여행과 플래너를 동시에!!</h1>
</div>
</div>

<!-- 여기부터 테마 -->
<br><br>
<div class="container-fluid mt-3">
    <h2>테마 선택하게 하기</h2>
    <br>
   
    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#home">테마1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#menu1">테마2</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#menu2">테마3</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#menu3">테마4</a>
      </li>
    </ul>

    <div class="tab-content">
      <div id="home" class="container-fluid tab-pane active"><br>
        <!-- 여기부터 카드 -->
        <div class="card-div">
            <div class="card" style="width:400px">
              <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
              <div class="card-body">
                <h4 class="card-title">숙소이름</h4>
                <p class="card-text">지역 : 경기도 <br> 가격 : 500,000</p>
                <a href="#" class="btn btn-primary">See Profile</a>
              </div>
            </div>          
      </div>
      <div class="card-div">
        <div class="card" style="width:400px">
          <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
          <div class="card-body">
            <h4 class="card-title">숙소이름</h4>
            <p class="card-text">지역 : 인천 <br> 가격 : 800,000</p>
            <a href="#" class="btn btn-primary">See Profile</a>
          </div>
        </div>          
    </div>
    <div class="card-div">
        <div class="card" style="width:400px">
          <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
          <div class="card-body">
            <h4 class="card-title">숙소이름</h4>
            <p class="card-text">지역 : 부산 <br> 가격 : 700,000</p>
            <a href="#" class="btn btn-primary">See Profile</a>
          </div>
        </div>          
    </div>
    <div class="card-div">
        <div class="card" style="width:400px">
          <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
          <div class="card-body">
            <h4 class="card-title">숙소이름</h4>
            <p class="card-text">지역 : 제주도 <br> 가격 : 1,000,000</p>
            <a href="#" class="btn btn-primary">See Profile</a>
          </div>
        </div>          
    </div>

    <div class="card-div">
        <div class="card" style="width:400px">
          <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
          <div class="card-body">
            <h4 class="card-title">숙소이름</h4>
            <p class="card-text">지역 : 경기도 <br> 가격 : 500,000</p>
            <a href="#" class="btn btn-primary">See Profile</a>
          </div>
        </div>          
  </div>
  <div class="card-div">
    <div class="card" style="width:400px">
      <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
      <div class="card-body">
        <h4 class="card-title">숙소이름</h4>
        <p class="card-text">지역 : 인천 <br> 가격 : 800,000</p>
        <a href="#" class="btn btn-primary">See Profile</a>
      </div>
    </div>          
</div>
<div class="card-div">
    <div class="card" style="width:400px">
      <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
      <div class="card-body">
        <h4 class="card-title">숙소이름</h4>
        <p class="card-text">지역 : 부산 <br> 가격 : 700,000</p>
        <a href="#" class="btn btn-primary">See Profile</a>
      </div>
    </div>          
</div>
<div class="card-div">
    <div class="card" style="width:400px">
      <img class="card-img-top" src="c://호텔.jpg" alt="Card image" style="width:100%">
      <div class="card-body">
        <h4 class="card-title">숙소이름</h4>
        <p class="card-text">지역 : 제주도 <br> 가격 : 1,000,000</p>
        <a href="#" class="btn btn-primary">See Profile</a>
      </div>
    </div>          
</div>
      <br><br>
      <!-- 여기까지 카드 -->
        </div>
      <div id="menu1" class="container-fluid tab-pane fade"><br>
        <h3>카드형식 이미지2</h3>
        <br><br><br>    
      </div>
      <div id="menu2" class="container-fluid tab-pane fade"><br>
        <h3>카드형식 이미지3</h3>
        <br><br><br>
        </div>
     <div id="menu3" class="container-fluid tab-pane fade"><br>
        <h3>카드형식 이미지4</h3>
        <br><br><br>
          </div>
      </div>
    </div>
  </div>
  <!-- 여기까지 테마 -->
  <br><br>
  <!-- 연결고리 시작 -->
  <div>
    <h1 class="main-h1"><숙박과 플래너 연결고리></h1>
  </div>
  <!-- 연결고리 끝 -->
  <div id="map" style="width:100%;height:350px;"></div>

  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
