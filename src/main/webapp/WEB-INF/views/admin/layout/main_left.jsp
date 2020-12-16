<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<aside class="left-sidebar bg-sidebar">
		<div id="sidebar" class="sidebar sidebar-with-footer">
			<!-- Aplication Brand -->
			<div class="app-brand">
				<a href="#">
					<img src="/images/codemaker_name3.png">
					<span class="brand-name">관리자</span>
				</a>
			</div>
			
			
			<!-- begin sidebar scrollbar -->
			<div class="sidebar-scrollbar">
			<!-- sidebar menu -->
				<ul class="nav sidebar-inner" id="sidebar-menu">
				
					<li  class="has-sub" >
						<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#ui-elements" aria-expanded="false" aria-controls="ui-elements">
							<i class="mdi mdi-folder-multiple-outline"></i>
							<span class="nav-text">전체 관리</span> <b class="caret"></b>
						</a>
						<ul  class="collapse"  id="ui-elements" data-parent="#sidebar-menu">
							<div class="sub-menu">
							  
							  
								<li  class="has-sub" >
									<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#components" aria-expanded="false" aria-controls="components">
										<span class="nav-text">학생 관리</span> <b class="caret"></b>
									</a>
									<ul  class="collapse"  id="components">
										<div class="sub-menu">
										      
											<li >
												<a href="#">정보조회</a>
											</li>
											
											<li >
												<a href="#">블랙리스트 관리</a>
											</li>
											
											<li >
												<a href="#">장학제도</a>
											</li>
										
										</div>
									</ul>
								</li>
								
								
								
								
								<li  class="has-sub" >
									<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#icons" aria-expanded="false" aria-controls="icons">
										<span class="nav-text">직원 관리</span> <b class="caret"></b>
									</a>
									<ul  class="collapse"  id="icons">
										<div class="sub-menu">
										
											<li >
												<a href="${cp }/admin/resumeList">이력서 조회</a>
											</li>
										    
										</div>
									</ul>
								</li>
							
							
							
							
								<li  class="has-sub" >
									<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#forms" aria-expanded="false" aria-controls="forms">
										<span class="nav-text">기업 관리</span> <b class="caret"></b>
									</a>
									<ul  class="collapse"  id="forms">
										<div class="sub-menu">
										
											<li>
											  <a href="${cp}/admin/selectAllCompany">기업 정보</a>
											</li>
											<li>
											  <a href="${cp}/admin/selectAllJobInfo">취업 공고</a>
											</li>
										
										</div>
									</ul>
								</li>
								
								<li  class="has-sub" >
									<ul  class="collapse" id="forms">
										<div class="sub-menu">
											  <a href="${cp}/admin/selectAllNotice">공지 사항 조회</a>
										</div>
									</ul>
								</li>
								
							</div>
						</ul>
					</li>
				
				
				
				
					<li  class="has-sub" >
						<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#charts" aria-expanded="false" aria-controls="charts">
							<i class="mdi mdi-chart-pie"></i>
							<span class="nav-text">통계 관리</span> <b class="caret"></b>
						</a>
						<ul  class="collapse"  id="charts" data-parent="#sidebar-menu">
							<div class="sub-menu">
							
								<li class="section-title">
									사용자 조회
								</li>
							 
							 
								<li >
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">교사 조회</span>
									</a>
								</li>
							 
							
								<li >
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">학생 조회</span>
									</a>
								</li>
								<li class="section-title">
									매출 조회
								</li>
								<li >
									<a class="sidenav-item-link" href="${cp}/admin/selectLessonPay">
										<span class="nav-text">강의별 조회</span>
									</a>
								</li>
								<li >
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">교사별 조회</span>
									</a>
								</li>
								<li >
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">학생 조회</span>
									</a>
								</li>
							</div>
						</ul>
					</li>
				                
					<li  class="has-sub" >
						<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#documentation" aria-expanded="false" aria-controls="documentation">
							<i class="mdi mdi-book-open-page-variant"></i>
							<span class="nav-text">수강 관리</span> <b class="caret"></b>
						</a>
						<ul  class="collapse"  id="documentation" data-parent="#sidebar-menu">
							<div class="sub-menu">
							
								<li class="section-title">
									수강 관리 조회
								</li>
								<li>
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">수강후기 조회</span>
									</a>
								</li>
								<li>
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">학생 조회</span>
									</a>
								</li>
								<li>
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">교사 조회</span>
									</a>
								</li>
								<li>
									<a class="sidenav-item-link" href="${cp}/admin/selectAllSubject">
										<span class="nav-text">과목 조회</span>
									</a>
								</li>
								<li>
									<a class="sidenav-item-link" href="#">
										<span class="nav-text">강의 조회</span>
									</a>
								</li>
							</div>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</aside>