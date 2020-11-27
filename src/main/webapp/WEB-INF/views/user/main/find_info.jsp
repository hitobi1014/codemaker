<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>회원정보 찾기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/user/login/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/user/login/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/user/login/util.css">
	<link rel="stylesheet" type="text/css" href="/css/user/login/main.css">
<!--===============================================================================================-->
</head>
<script>
</script>
<style>
.txt1:hover{
	text-decoration: underline;
}
#di{width: 1920px; height:70px; margin-left: 520px; padding-top: 85px;}
#logo{width:200px;height: 70px;}
.row{width: 837px; height: 600px;margin-bottom: 100px; padding-left: 50%;}
.find{width: 500px;height: 40px;border:1px solid black;}
.firstCol{width:248px;height:40px; float: left;text-align: center; line-height: 40px;}
.lastCol{width:248px;height:40px; float: right;text-align: center; line-height: 40px;}
.div2{margin-left: 150px;}
.in3{width: 837px;}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}
</style>
<body>
	
	<div class="limiter" style="background-color:#f4f4f4">
		<div class="container-login100" >
		<div id="di">
			<a href="${cp}/user/main"><img id="logo" src="/img/mj/로고 작업.png"/></a>
		</div>
			<div class="row" style="border:1px solid #ededed; padding:20px;background-color:white;">
				<div class="div2">
					<div class="find">
						<ul>
							<li class="firstCol">아이디 찾기</li>
							<li class="lastCol">비밀번호 찾기</li>
						</ul>
					</div>
					<div>
						<button class="button button4">등록된 휴대폰 번호로 찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
<!--===============================================================================================-->
	<script src="/vendor/user/login/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/bootstrap/js/popper.js"></script>
	<script src="/vendor/user/login/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/daterangepicker/moment.min.js"></script>
	<script src="/vendor/user/login/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/js/user/login/main.js"></script>
</body>
</html>