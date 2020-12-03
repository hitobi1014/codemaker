<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="main-header " id="header">
	<nav class="navbar navbar-static-top navbar-expand-lg">
		<!-- Sidebar toggle button -->
		<button id="sidebar-toggler" class="sidebar-toggle">
			<span class="sr-only">Toggle navigation</span>
		</button>
		<!-- search form -->
		<div class="search-form d-none d-lg-inline-block">
			<div class="input-group">
				<button type="button" name="search" id="search-btn"
					class="btn btn-flat">
					<i class="mdi mdi-magnify"></i>
				</button>
				<input type="text" name="query" id="search-input"
					class="form-control" placeholder="검색어를 입력해주세요" autofocus
					autocomplete="off" />
			</div>
			<div id="search-results-container">
				<ul id="search-results"></ul>
			</div>
		</div>

		<div class="navbar-right ">
			<ul class="nav navbar-nav">
				<!-- Github Link Button -->
				<li class="dropdown notifications-menu">
					<button class="dropdown-toggle" data-toggle="dropdown">
						<i class="mdi mdi-bell-outline"></i>
					</button>
					<ul class="dropdown-menu dropdown-menu-right">
						<li class="dropdown-header">You have 5 notifications</li>
						<li>
							<a href="#"> <i class="mdi mdi-account-plus"></i> New user registered 
								<span class=" font-size-12 d-inline-block float-right">
									<i class="mdi mdi-clock-outline"></i> 10 AM
								</span>
							</a>
						</li>
						<li>
							<a href="#"> <i class="mdi mdi-account-remove"></i>User deleted 
								<span class=" font-size-12 d-inline-block float-right">
									<i class="mdi mdi-clock-outline"></i> 07 AM
								</span>
							</a>
						</li>
						<li>
							<a href="#"> <i class="mdi mdi-chart-areaspline"></i>Sales report is ready 
								<span class=" font-size-12 d-inline-block float-right">
									<i class="mdi mdi-clock-outline"></i> 12 PM
								</span>
							</a>
						</li>
						<li>
							<a href="#"> <i class="mdi mdi-account-supervisor"></i>New client
								<span class=" font-size-12 d-inline-block float-right">
									<i class="mdi mdi-clock-outline"></i> 10 AM
								</span>
							</a>
						</li>
						<li>
							<a href="#"> <i class="mdi mdi-server-network-off"></i>Server overloaded 
								<span class=" font-size-12 d-inline-block float-right">
									<i class="mdi mdi-clock-outline"></i> 05 AM
								</span>
							</a>
						</li>
						<li class="dropdown-footer">
							<a class="text-center" href="#">View All </a>
						</li>
					</ul>
				</li>
				<!-- User Account -->
				<li class="dropdown user-menu">
					<button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
						<img id="loginImg" src="/images/codemaker_logo3.png"> 
						<span class="d-none d-lg-inline-block">Profile</span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right">
						<!-- User image -->
						<li class="dropdown-header">
							<div class="d-inline-block">Abdus Salam 
								<small class="pt-1">abdus@gmail.com</small>
							</div>
						</li>

						<li>
							<a href="profile.html"> <i class="mdi mdi-account"></i>My Page</a>
						</li>
						<li>
							<a href="email-inbox.html"> <i class="mdi mdi-email"></i> 알림함</a>
						</li>
						<li>
							<a href="#"> <i class="mdi mdi-settings"></i> 설정</a>
						</li>

						<li class="dropdown-footer">
							<a href="${cp}/logout"> 
								<i class="mdi mdi-logout"></i> 로그아웃
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>

