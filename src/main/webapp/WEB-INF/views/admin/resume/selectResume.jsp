<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.table-responsive{
		background-color: #C1C6C8;
	}
	
</style>
<script>
	$(document).ready(function(){
		$("#resState1").on("click", function(){
			alert('승인 처리가 완료되었습니다.');
			document.location="/admin/resumeList";
		});
		$("#resState2").on("click", function(){
			alert('미승인 처리가 완료되었습니다.');
			document.location="/admin/resumeList";
		});
	});
</script>
</head>
<body>
	<!-- Table -->
	<div class="row">
		<div class="col-xl-8 m-auto order-xl-1">
			<div class="card bg-secondary shadow">
				<div class="card-header bg-white border-0">
					<div class="row align-items-center">
						<div class="col-8">
							<h3 class="mb-0">이력서</h3>
						</div>
					</div>
				</div>
				<div class="table-responsive">
					<form class="form-horiaontal" action="${cp }/admin/resume" method="post">
						<br>
						<h6 class="heading-small text-muted mb-4">정보</h6>
						<div class="pl-lg-4">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group focused">
										<label class="form-control-label" for="input-username">프로필</label>
										<img id="resProfile">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label" for="input-email">아이디</label>
										<label class="form-control-label" id="resId">${resume.resId }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group focused">
										<label class="form-control-label" for="input-first-name">승인코드</label>
										<label class="form-control-label" id="resCode">${resume.resCode }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group focused">
										<label class="form-control-label" for="input-last-name">이름</label>
										<label class="form-control-label" id="resNm">${resume.resNm }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group focused">
										<label class="form-control-label" for="input-address">전화번호</label>
										<label class="form-control-label" id="resTel">${resume.resTel }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group focused">
										<label class="form-control-label" for="input-city">이메일</label>
										<label class="form-control-label" id="resMail">${resume.resMail }</label>
									</div>
								</div>
							</div>
						</div>
						<hr class="my-4">
						<h6 class="heading-small text-muted mb-4">자기소개</h6>
						<div class="pl-lg-4">
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group focused">
										<label class="form-control-label" for="input-country">지원동기</label>
										<label class="form-control-label" id="resMotive">${resume.resMotive }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<label class="form-control-label" for="input-country">학력</label>
										<label class="form-control-label" id="resEdu">${resume.resEdu }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<label class="form-control-label" for="input-country">자격증</label>
										<label class="form-control-label" id="resLicense">${resume.resLicense }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<label class="form-control-label" for="input-country">경력</label>
										<label class="form-control-label" id="resCareer">${resume.resCareer }</label>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-4 text-right">
				<button type="button" id="resState1" value="Y">승인</button>
				<button type="button" id="resState2" value="N">미승인</button>
			</div>
		</div>
	</div>
</body>
</html>