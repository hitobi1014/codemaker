<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>admin/teacher Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/css/admin/login/util.css">
<!--===============================================================================================-->
<!-- Font Icon -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Main css -->
<link rel="stylesheet" href="/css/admin/signup/style.css">
<!--===============================================================================================-->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#teacherImg").click(function(){
		$(this).attr("src", "/images/admin/signup/teacher.png");
		$("#adminImg").attr("src", "/images/admin/signup/admin (3).png");
	})
	$("#adminImg").click(function(){
		$("#teacherImg").attr("src", "/images/admin/signup/teacher (1).png");
		$(this).attr("src", "/images/admin/signup/admin (2).png");
	})
})
	
// $('#t_button').toggle(function() {
// 	$(this).attr("class", "active");
// }, function() {
// 	$(this).attr("class", "");
// });

// $(document).ready(function(){
// 	$('#btnTM button').on('click', function(){
// 		var a = $(this).attr('id');
// 		console.log(a);
// 		if(a == 't_button'){
// 			$(this).attr("style", "background-color: #003B5C;");
// 			$('#m_button').attr("style", "background-color:");
// 		}else{
// 			$(this).attr("style", "background-color: #003B5C;");
// 			$('#t_button').attr("style", "background-color:");
// 		}		
		
		
// 	});

// });


// 	var btn = document.getElementsByClassName('btn');
	
// 	function handleClick(event){
// 		if(event.target.classList[1] === "clicked"){
// 			event.target.classList.remove("clicked");
// 		}
// 		else{
// 			for(var i=0; i<btn.length; i++){
// 				btn[i].classList.remove("clicked");
// 			}
// 		}
		
// 		function init(){
// 			for(var i=0; i<btn.length; i++){
// 				btn[i].addEventListener("click", handleClick);
// 			}
// 		}
// 		init();
// 	}

</script>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-51"> Login </span> 
					<img id="teacherImg" alt="교사" src="/images/admin/signup/teacher (1).png" style="height: 120px; width: 120px;">
					<img id="adminImg" alt="관리자" src="/images/admin/signup/admin (3).png" style="height: 120px; width: 120px;">


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="이메일 형식으로 작성해주세요">
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="형식에 맞지 않습니다">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1"> Remember me </label>
						</div>

					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">Login</button>
					</div>

					<div class="searchuser">
						<a href="" id="findIdPass" class="" data-tiara-action-name="아이디/비밀번호찾기_링크">ID/비밀번호 찾기</a>
						<span class="txt_bar">|</span>
						<!-- Trigger the modal with a button -->
						<a href="#myModal" data-toggle="modal" id="findID" class="" data-tiara-action-name="회원가입_링크">회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>


	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-body">
				<form action="/action_page.php"
					class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
					<h2 class="w3-center">회원가입</h2>

					<div class="w3-row w3-section">
						<div class="w3-col" style="width: 50px">
							<i class="w3-xxlarge fa fa-envelope-o"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" name="email" type="text" placeholder="이메일형식 ID">
						</div>
					</div>
					

					<div class="w3-row w3-section">
						<div class="w3-col" style="width: 50px">
							<i class="w3-xxlarge fa fa-user"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" name="first" type="text" placeholder="비밀번호">
						</div>
					</div>

					<div class="w3-row w3-section">
						<div class="w3-col" style="width: 50px">
							<i class="w3-xxlarge fa fa-phone"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" name="phone" type="text" placeholder="인증번호">
						</div>
					</div>


					<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding">가입</button>

				</form>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->

	<!--===============================================================================================-->
	<script src="/js/admin/login/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/js/admin/login/popper.js"></script>
	<script src="/js/admin/login/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/js/admin/login/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/js/admin/login/moment.min.js"></script>
	<script src="/js/admin/login/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/js/admin/login/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/js/admin/login/main.js"></script>
	<!--===============================================================================================-->
	<!-- JS -->
	<script src="/js/admin/signup/jquery.min.js"></script>
</body>
</html>