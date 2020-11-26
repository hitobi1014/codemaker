	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<!-- login 모달창 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<!-- login(css) -->
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
	
	

	<!-- Custom fonts for this template-->
    <link href="/vendor/user/main/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/user/main/sb-admin-2.min.css" rel="stylesheet">

</head>
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

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light topbar static-top shadow"
					style="background: #005F86">
					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>
					<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<div class="input-group">
						<a href="${cp}/user/main"><img id="imglogo"
							src="/images/codemaker_name3.png"></a>
					</div>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- 로그인 -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							data-toggle="modal" class="nav-link dropdown-toggle"
							href="#myModal" id="login" role="button" aria-haspopup="true"
							aria-expanded="false">로그인 </a> <!-- 로그인 모달창 -->
							<div class="limiter modal fade" id="myModal">
								<div class="container-login100 modal-dialog">
									<div class="wrap-login100 p-t-50 p-b-90 modal-content">
										<div class="modal-header" style="border-bottom: none;">
											<button type="button" class="close" data-dismiss="modal">×</button>
										</div>
										<form
											class="login100-form validate-form flex-sb flex-w modal-body"
											action="${cp}/main/userLogin" method="post">
											<span class="login100-form-title p-b-51"> 로그인 </span>

											<div class="wrap-input100 validate-input m-b-16"
												data-validate="Username is required">
												<input class="input100" type="text" id="user_id"
													name="user_id" placeholder="아이디"> <span
													class="focus-input100"></span>
											</div>

											<div class="wrap-input100 validate-input m-b-16"
												data-validate="Password is required">
												<input class="input100" type="password" name="user_pass"
													placeholder="비밀번호"> <span class="focus-input100"></span>
											</div>

											<div class="flex-sb-m w-full p-t-3 p-b-24">
												<div class="contact100-form-checkbox">
													<input class="input-checkbox100" id="ckb1" type="checkbox"
														name="rememberMe" value="1"> <label
														class="label-checkbox100" for="ckb1"> 아이디 저장</label>
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
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="signin"
							role="button" aria-haspopup="true" aria-expanded="false">회원가입
						</a></li>

						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="space"
							role="button" aria-haspopup="true" aria-expanded="false">&emsp;&emsp;&emsp;&emsp;&emsp;
						</a></li>
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="space"
							role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</a></li>
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="space"
							role="button" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</a></li>



					</ul>


				</nav>





				<!-- End of Topbar -->

				<!-- Illustrations -->
				<div class="text-center">
					<img class="img-fluid" style="width: 130rem;"
						src="/images/main_mid.jpg" alt="">
				</div>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">



						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body2">
									<div class="row no-gutters align-items-center">
										<div class="col mr-3">
											<img class="imgMain"
												src="/images/user/main/drawkit-grape-pack-illustration-1.svg">
											<br>
											<div
												class="text-xm font-weight-bold text-primary text-uppercase mb-1">
												개발 커리어를 쌓아보는</div>
											<div class="h1 mb-0 font-weight-bold text-gray-900">
												<a id="at" href="" style="font-size: 1.1em;">전체강의 </a> <br>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body2">
									<div class="row no-gutters align-items-center">
										<div class="col mr-3">
											<img class="imgMain"
												src="/images/user/main/drawkit-grape-pack-illustration-2.svg">
											<br>
											<div
												class="text-xm font-weight-bold text-primary text-uppercase mb-1">
												코드메이커와 준비하는</div>
											<div class="h1 mb-0 font-weight-bold text-gray-900">
												<a id="at" href="" style="font-size: 1.1em;">코딩테스트</a> <br>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body2">
									<div class="row no-gutters align-items-center">
										<div class="col mr-3">
											<img class="imgMain"
												src="/images/user/main/drawkit-grape-pack-illustration-6.svg">
											<br>
											<div
												class="text-xm font-weight-bold text-primary text-uppercase mb-1">
												자유롭게 소통하는</div>
											<div class="h1 mb-0 font-weight-bold text-gray-900">
												<a id="at" href="" style="font-size: 1.1em;">게시판</a> <br>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body2">
									<div class="row no-gutters align-items-center">
										<div class="col mr-3">
											<img class="imgMain"
												src="/images/user/main/drawkit-grape-pack-illustration-18.svg">
											<br>
											<div
												class="text-xm font-weight-bold text-primary text-uppercase mb-1">
												필요한 정보 쏙쏙!</div>
											<div class="h1 mb-0 font-weight-bold text-gray-900">
												<a id="at" href="" style="font-size: 1.1em;">취업정보</a> <br>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Content Row -->

						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->

				</div>
				<!-- End of Content Wrapper -->

				
			</div>
			<!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    </div>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
   </div>

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2020</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->

	<!-- Bootstrap core JavaScript-->
    <script src="/vendor/user/main/jquery/jquery.min.js"></script>
    <script src="/vendor/user/main/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/user/main/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/user/main/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/vendor/user/main/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/user/main/demo/chart-area-demo.js"></script>
    <script src="/js/user/main/demo/chart-pie-demo.js"></script>
    
    
    <!-- login 스크립트 -->
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