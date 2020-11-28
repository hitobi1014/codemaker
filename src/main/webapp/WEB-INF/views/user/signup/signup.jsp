<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Font Icon -->
<link rel="stylesheet"
	href="/fonts/user/signup/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="/css/user/signup/style.css">


<script>
$(document).ready(function(){
	// picture input의 파일 변경시 이벤트 
	$("#picture").change(function(){
	   readURL(this);
	});
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
	  
		reader.onload = function (e) {
			$('#pictureViewImg').attr('src', e.target.result);  
		}
		reader.readAsDataURL(input.files[0]);
	}
}

</script>
</head>
<style>
#phone1 {
	width: 65px;
}

#phone2 {
	width: 95px;
	display: inline-block;
}

#phone3 {
	width: 95px;
	display: inline-block;
}

#signimg {
	display: inline-block;
	height: 350px;
	width: 300px;
}
</style>


<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">
							CODE MAKER<br> 회원가입
						</h2>
						<form method="POST" class="register-form" id="register-form"
							action="${cp}/join/insertUser" enctype="multipart/form-data">

							<div class="input-group mb-3">
								<div class="mailbox-attachments clearfix"
									style="text-align: center; width: 100%;">
									<div class="mailbox-attachment-icon has-img" id="pictureView"
										style="border: 1px solid green; height: 100px; width: 100px; margin: 0 auto;">
										<img id="pictureViewImg" style="width: 100%; height: 100%;" />
									</div>
									<div class="mailbox-attachment-info">
										<div class="input-group input-group-sm">
											<input id="picture" class="form-control" type="file"
												name="user_profile" accept=".gif, .jpg, .png"
												style="height: 37px;" />
										</div>
									</div>
								</div>
								<br />
							</div>


							<div class="form-group">
								<label for="userid"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="email" name="user_id" id="user_id1" placeholder="ID" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="user_pass" id="user_pass"
									placeholder="Password" />
							</div>
							<!--                             <div class="form-group"> -->
							<!--                                 <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label> -->
							<!--                                 <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/> -->
							<!--                             </div> -->
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="user_nm" id="user_nm" placeholder="Name" />
							</div>
							<div class="form-group">
								<label for="tel"></label> <i
									class="zmdi zmdi-account material-icons-name" id="phoneicon"></i>&nbsp;&nbsp;
								<select id="phone1" name="user_tel1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="019">019</option>
									<option value="019">016</option>
									<option value="019">017</option>
								</select>- <input type="text" name="user_tel2" id="phone2" size="4"
									placeholder="4자리" maxlength="4">- <input type="text"
									name="uset_tel3" id="phone3" size="4" placeholder="4자리"
									maxlength="4"> <br>
							</div>
							<div class="form-group">
								<dt>
									가입하면 <strong>이용 약관</strong> 및 <strong>개인정보</strong> 수집 및 활용에
									&nbsp;&nbsp;<strong>동의</strong>하게 됩니다.
								</dt>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img id="signimg" src="/images/signmain.PNG" alt="sing up image">
						</figure>
					</div>
				</div>
			</div>
		</section>


	</div>

	<!-- JS -->
	<script src="/vendor/user/signup/jquery/jquery.min.js"></script>
	<script src="/js/user/signup/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>