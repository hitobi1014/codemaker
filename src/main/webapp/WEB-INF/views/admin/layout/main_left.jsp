<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* 	.dropBox{ */
/* 		display: none; */
/* 	} */
</style>
<script>
// $(function(){
// 	var len =$(".sidenav-item-link").length;
// 	for(i=0; i<len; i++){
// 		$($(".sidenav-item-link").eq(i).data('target')).addClass('dropBox');
// 	}
	
// 	$(".sidenav-item-link").on('click',function(){
// 		var toggle = $(this).data('toggle');
// 		var target = $(this).data('target');
// 		if(toggle == "collapse"){
// 			$(target).removeClass('dropBox');
// 			$(this).data('toggle','uncollapse');			
// 		}else{
// 			$(target).addClass('dropBox');
// 			$(this).data('toggle','collapse');
// 		}
// 	})
// })
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
	@font-face {
		font-family: 'LotteMartDream';
		font-style: normal;
		font-weight: 300;
		src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff');
	}
	aside{
		font-family: 'LotteMartDream';
	}
	#mainImg{
		width: 190px;
		height: 60px;
	}
	.div-box{
	    display: inline-block;
	    width: 100%;
	}
	.div-box a{
	    display: inline-block;
	    width: 100%;
	    height: 100%;
    }
    .info-logo{
    	display: flex;
    	margin-top: 12px;
   	 margin-left: 9px;
   	}
   	#mng-info{
   		padding-top: 21px;
   		color: #b7c0cd;
   	}
</style>
<aside class="left-sidebar bg-sidebar">
	<div id="sidebar" class="sidebar sidebar-with-footer">
		<div class="sidebar-scrollbar div-box">
			<c:url value="/admin/main" var="mainAdmin"/>
			<a href="${mainAdmin}">
				<div class="info-logo">
					<img id="mainImg" src="/images/codemaker_name3.png">
					<span id="mng-info" class="brand-name">관리자</span>
				</div>
			</a>
		</div>
			
		<!-- begin sidebar scrollbar -->
		<div class="sidebar-scrollbar">
			<!-- sidebar menu -->
			<ul class="nav sidebar-inner" id="sidebar-menu">
				<li class="has-sub">
					<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#ui-elements" aria-expanded="false" aria-controls="ui-elements">
						<i class="mdi mdi-folder-multiple-outline"></i>
						<span class="nav-text">전체 관리</span><b class="caret"></b>
					</a>
					<ul class="collapse"  id="ui-elements" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li class="has-sub">
								<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#components" aria-expanded="false" aria-controls="components">
									<span class="nav-text">학생 관리</span><b class="caret"></b>
								</a>
								<ul class="collapse" id="components">
									<div class="sub-menu">
										<c:url value="/admin/selectUserInfo" var="selectUser"/>
										<li><a href="${selectUser}">정보조회</a></li>
										<li><a href="#">신고조회</a></li>
										<li><a href="#">장학제도</a></li>
									</div>
								</ul>
							</li>
								
							<li class="has-sub">
								<a class="sidenav-item-link" data-toggle="collapse" data-target="#icons" aria-expanded="false" aria-controls="icons">
									<span class="nav-text">직원 관리</span> <b class="caret"></b>
								</a>
								<ul class="collapse"  id="icons">
									<div class="sub-menu">
										<c:url value="/admin/selectAllTeacher" var="selectTeacher"></c:url>
										<li><a href="${selectTeacher}">선생님 조회</a></li>
										<li><a href="${cp }/admin/resumeList">이력서 조회</a></li>
									</div>
								</ul>
							</li>
							
							<li class="has-sub">
								<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#forms" aria-expanded="false" aria-controls="forms">
									<span class="nav-text">기업 관리</span> <b class="caret"></b>
								</a>
								<ul  class="collapse"  id="forms">
									<div class="sub-menu">
										<c:url value="/admin/selectAllJobInfo" var="selectAllJobInfo">
											<c:param name="keyWord" value="${param.keyWord}"/>
											<c:param name="page" value="1"/>
										</c:url>
										<li >
										  <a href="${selectAllJobInfo}">기업 정보 조회</a>
										</li>
									</div>
								</ul>
							</li>
								
							<li class="has-sub">
								<ul  class="collapse" id="formss">
									<div class="sub-menu">
										<c:url value="/admin/selectAllNotice" var="selectAllNotice">
											<c:param name="searchOption" value="1"/>
											<c:param name="keyWord" value="${param.keyWord}"/>
											<c:param name="page" value="1"/>
										</c:url>
										<li><a href="${selectAllNotice}">공지 사항 조회</a></li>
									</div>
								</ul>
							</li>
						</div>
					</ul>
				</li>
				<li class="has-sub">
					<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#charts" aria-expanded="false" aria-controls="charts">
						<i class="mdi mdi-chart-pie"></i>
						<span class="nav-text">통계 관리</span> <b class="caret"></b>
					</a>
					<ul class="collapse" id="charts" data-parent="#sidebar-menu">
						<div class="sub-menu">
						
							<li class="section-title">
								사용자 조회
							</li>
						 
							<li>
								<a class="sidenav-item-link" href="#">
									<span class="nav-text">교사 조회</span>
								</a>
							</li>
						
							<li>
								<a class="sidenav-item-link" href="#">
									<span class="nav-text">학생 조회</span>
								</a>
							</li>
							<li class="section-title">매출 조회</li>
							
							<li>
								<a class="sidenav-item-link" href="${cp}/admin/selectLessonPay">
									<span class="nav-text">강의별 조회</span>
								</a>
							</li>
							<li>
								<a class="sidenav-item-link" href="#">
									<span class="nav-text">교사별 조회</span>
								</a>
							</li>
							<li>
								<a class="sidenav-item-link" href="#">
									<span class="nav-text">학생 조회</span>
								</a>
							</li>
						</div>
					</ul>
				</li>
			                
				<li class="has-sub">
					<a class="sidenav-item-link" href="#" data-toggle="collapse" data-target="#documentation" aria-expanded="false" aria-controls="documentation">
						<i class="mdi mdi-book-open-page-variant"></i>
						<span class="nav-text">수강 관리</span> <b class="caret"></b>
					</a>
					<ul class="collapse" id="documentation" data-parent="#sidebar-menu">
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
								<a class="sidenav-item-link" href="#">
									<span class="nav-text">과목 조회</span>
								</a>
							</li>
							<li>
								<a class="sidenav-item-link" href="${cp}/admin/selectAllSubjcet">
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