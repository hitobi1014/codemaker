<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<aside class="left-sidebar bg-sidebar">
		<div id="sidebar" class="sidebar sidebar-with-footer">
			<!-- Aplication Brand -->
			<div class="app-brand">
				<a href="#">
					<img src="/images/codemaker_name4.png">
					<span class="brand-name">강사</span>
				</a>
			</div>
			<!-- begin sidebar scrollbar -->
			<div class="sidebar-scrollbar">
				<!-- sidebar menu -->
				<ul class="nav sidebar-inner" id="sidebar-menu">
				
					<li  class="has-sub" >
						<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#ui-elements"
						aria-expanded="false" aria-controls="ui-elements">
							<i class="mdi mdi-book-open-page-variant"></i>
							<span class="nav-text">수강</span> <b class="caret"></b>
						</a>
						<ul class="collapse"  id="ui-elements" data-parent="#sidebar-menu">
							<div class="sub-menu">
							
							 
								<li  class="has-sub" >
									<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#components"
										aria-expanded="false" aria-controls="components">
										<span class="nav-text">수강 관리</span> <b class="caret"></b>
									</a>
									<ul  class="collapse"  id="components">
										<div class="sub-menu">
										
											<li >
												<a href="#">강의 개설 및 수정</a>
											</li>
											
											<li >
												<a href="#">교재파일 등록 및 수정/삭제</a>
											</li>
											
											<li >
												<a href="#">커리큘럼 임시저장소</a>
											</li>
										
										</div>
									</ul>
								</li>
							  
								<li  class="has-sub" >
									<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#icons"
										aria-expanded="false" aria-controls="icons">
										<span class="nav-text">과목별 게시판</span> <b class="caret"></b>
									</a>
									<ul  class="collapse"  id="icons">
										<div class="sub-menu">
										
											<li >
												<a href="#">질문 응답 게시판</a>
											</li>
										
										</div>
									</ul>
								</li>
							</div>
						</ul>
					</li>
				</ul>
			</div>
	
			<hr class="separator" />
			
			<div class="sidebar-footer">
				<div class="sidebar-footer-content">
					<h6 class="text-uppercase">Cpu Uses
						<span class="float-right">40%</span>
					</h6>
					<div class="progress progress-xs">
						<div class="progress-bar active" style="width: 40%;" role="progressbar"></div>
					</div>
					<h6 class="text-uppercase">Memory Uses
						<span class="float-right">65%</span>
					</h6>
					<div class="progress progress-xs">
						<div class="progress-bar progress-bar-warning" style="width: 65%;" role="progressbar"></div>
					</div>
				</div>
			</div>
		</div>
	</aside>