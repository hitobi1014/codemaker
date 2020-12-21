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
	.form-control-text{
		font-size: 10px;
		border: solid 1px #fff
	}
	.form-control-label{
		font-weight: normal;
		font-size: large;
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
				<div class="table-responsive">
					<form class="form-horiaontal" action="${cp }/admin/resume" method="post">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">이력서</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" id="resState1" value="Y">승인</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" id="resState2" value="N">미승인</button>&nbsp;&nbsp;&nbsp;
								</div>
							</div>
						</div>
						<br>
						<h5 class="heading-small text-muted mb-4">&nbsp;&nbsp;&nbsp;정보</h5>
						<div class="pl-lg-4">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group focused">
										<c:url value="/resume/teacherImg" var="resumeImg">
											<c:param name="resProfile" value="${resume.resProfile_path}"/>
										</c:url>
										<img id="resumeicon" alt="" src="${resumeImg}"> <br>
										<label class="form-control-label" for="input-username">프로필</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										ID : 
										<input id="resId" value="${resume.resId }">
										<label class="form-control-text" id="resId">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resId }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group focused">
										<label class="form-control-label" for="input-first-name">승인코드</label><br>
										<label class="form-control-text" id="resCode">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resCode }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group focused">
										<label class="form-control-label" for="input-last-name">이름</label><br>
										<label class="form-control-text" id="resNm">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resNm }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group focused">
										<label class="form-control-label" for="input-address">전화번호</label><br>
										<label class="form-control-text" id="resTel">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resTel }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group focused">
										<label class="form-control-label" for="input-city">이메일</label><br>
										<label class="form-control-text" id="resMail">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resMail }</label>
									</div>
								</div>
							</div>
						</div>
						<hr class="my-4">
						<h5 class="heading-small text-muted mb-4">&nbsp;&nbsp;&nbsp;자기소개</h5>
						<div class="pl-lg-4">
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group focused">
										<label class="form-control-label" for="input-country">지원동기</label><br>
										<label class="form-control-text" id="resMotive">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resMotive }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<label class="form-control-label" for="input-country">학력</label><br>
										<label class="form-control-text" id="resEdu">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resEdu }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<label class="form-control-label" for="input-country">자격증</label><br>
										<label class="form-control-text" id="resLicense">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resLicense }</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<label class="form-control-label" for="input-country">경력</label><br>
										<label class="form-control-text" id="resCareer">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resCareer }</label>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>