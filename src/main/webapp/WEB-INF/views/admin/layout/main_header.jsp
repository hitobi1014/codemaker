<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	@font-face {
		font-family: 'LotteMartDream';
		font-style: normal;
		font-weight: 300;
		src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff');
	}
	header{
		font-family: 'LotteMartDream';
	}
</style>
<header class="main-header " id="header">
	<nav class="navbar navbar-static-top navbar-expand-lg" style="width: 1670px; background: #212a39; height: 80px;" >
		<div class="search-form d-none d-lg-inline-block">
			<div id="search-results-container" style="background-color: #212a39;">
				<ul id="search-results"></ul>
			</div>
		</div>

		<div class="navbar-right" style="margin-right: 20px;" >
			<ul class="nav navbar-nav">
				<!-- Github Link Button -->
				<li class="dropdown notifications-menu">
					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="border: none; outline:none; background-color: #212a39; border-color: #212a39; height: 50px; margin-bottom: 35px;">
						<i class="mdi mdi-bell-outline"></i>
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Link 1</a>
						<a class="dropdown-item" href="#">Link 2</a>
						<a class="dropdown-item" href="#">Link 3</a>
					</div>
				</li>
				<!-- User Account -->
				<li class="dropdown-footer">
					<a href="${cp }/logout" style="color: #b7c0cd;"> 
						<i class="mdi mdi-logout" style="color: #005F86;"></i> 로그아웃
					</a>
				</li>
			</ul>
		</div>
	</nav>
</header>