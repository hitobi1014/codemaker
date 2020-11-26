<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(function(){
// 	$("input:checkbox[id='remember']").prop('checked',true);
// 	var remember = ;
	if(${cookie.remember.value}==1){
		$("input:checkbox[id='ckb1']").prop('checked',true);
		$("#user_id").val("${cookie.userid.value}");
	}else{
		$("input:checkbox[id='ckb1']").prop('checked',false);
		$("#user_id").val('');
	}
	
})
</script>

<style>
#imglogo{width: 200px;}
#imgicon{width: 40px; height:40px; }
.imgMain{width: 250px;height: 300px;}
#at{color: #2c2e2e;}

</style>

<!-- header -->
<nav class="navbar navbar-expand navbar-light topbar static-top" style="background: #005F86">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<div class="input-group">
		<a href="${cp}/user/main"><img id="imglogo" src="/images/codemaker_name3.png"></a>
	</div>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<!-- 로그인 -->
		<li class="nav-item dropdown no-arrow mx-1">
			<a data-toggle="modal" class="nav-link dropdown-toggle" href="#myModal" id="login" role="button" aria-haspopup="true" aria-expanded="false">로그인</a> 
			
			<!-- 로그인 모달창 -->
			<div class="limiter modal fade" id="myModal">
				<div class="container-login100 modal-dialog">
					<div class="wrap-login100 p-t-50 p-b-90 modal-content">
						<div class="modal-header" style="border-bottom: none;">
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<form class="login100-form validate-form flex-sb flex-w modal-body" action="${cp}/main/userLogin" method="post">
							<span class="login100-form-title p-b-51"> 로그인 </span>
							<div class="wrap-input100 validate-input m-b-16" data-validate="Username is required">
								<input class="input100" type="text" id="user_id" name="user_id" placeholder="아이디"> <span class="focus-input100"></span>
							</div>

							<div class="wrap-input100 validate-input m-b-16" data-validate="Password is required">
								<input class="input100" type="password" name="user_pass" placeholder="비밀번호"> <span class="focus-input100"></span>
							</div>

							<div class="flex-sb-m w-full p-t-3 p-b-24">
								<div class="contact100-form-checkbox">
									<input class="input-checkbox100" id="ckb1" type="checkbox" name="rememberMe" value="1">
									<label class="label-checkbox100" for="ckb1"> 아이디 저장</label>
								</div>

								<div>
									<a href="#" class="txt1">아이디</a> • <a href="#" class="txt1">비밀번호찾기</a>
								</div>
							</div>

							<div class="container-login100-form-btn m-t-17">
								<button class="login100-form-btn">코딩Go!</button>
							</div>

						</form>
					</div>
				</div>
			</div></li>

		<!-- 회원가입 -->
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="#" id="signin" role="button" aria-haspopup="true" aria-expanded="false">회원가입 </a></li>
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="#" id="space" role="button" aria-haspopup="true" aria-expanded="false">&emsp;&emsp;&emsp;&emsp;&emsp;</a>
		</li>
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="#" id="space" role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</li>
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="#" id="space" role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</li>
	</ul>

</nav>
<!-- End of header -->


