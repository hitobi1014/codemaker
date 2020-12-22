<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.table-responsive{
		background-color: #C1C6C8;
	}
	.form-control-text{
		font-size: 10px;
	}
	.form-control-label{
		font-weight: 400;
		font-size: large;
	}
	#resumeicon{
		width: 130px;
		height: 170px;
	}
	#resY{
		background: #3A913F;
		width: 60px;
		height: 30px;
		color: white;
	}
	#resN{
		background: #EF3340;
		width: 60px;
		height: 30px;
		color: white;
	}
</style>
<script>
$(function(){
	var resState = $(this).val();
	$('.resBtn').on('click', function(){
		$('#resState').val(resState);
		$('#ff').submit();
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
					<div class="card-header bg-white border-0">
						<div class="row align-items-center">
							<div class="col-8">
								<h1 class="mb-0">이력서</h1>
							</div>
							<form class="form-horiaontal" action="${cp }/admin/resume/state" method="post" id="ff">
								<div class="stateBox">
									<div>
									<c:choose>
										<c:when test="${resume.resState == null }">
											<button id="resY" value="Y"  class="resBtn">승인</button>
											<button id="resN" value="N"  class="resBtn">미승인</button>
										</c:when>
									</c:choose>
									</div>
									<input type="hidden" name="resId" value="${resume.resId }">
									<input type="hidden" name="resState" value="" id="resState">
								</div>
							</form>
						</div>
					</div>
					<br>
					<h5 class="heading-small text-muted mb-4">&nbsp;&nbsp;&nbsp;정보</h5>
					<div class="pl-lg-4">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group focused">
									<label class="form-control-label" for="input-username">프로필</label> <br>
									<c:url value="/resume/teacherImg" var="resumeImg">
										<c:param name="resProfile" value="${resume.resProfile}"/>
									</c:url>
									<img id="resumeicon" alt="" src="${resumeImg}">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-first-name">아이디 :</label><br>
									<label class="form-control-text" id="resId">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resId }</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group focused">
									<label class="form-control-label" for="input-first-name">승인코드 :</label><br>
									<label class="form-control-text" id="resCode">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resCode }</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group focused">
									<label class="form-control-label" for="input-last-name">이름 :</label><br>
									<label class="form-control-text" id="resNm">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resNm }</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group focused">
									<label class="form-control-label" for="input-address">전화번호 :</label><br>
									<label class="form-control-text" id="resTel">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resTel }</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<div class="form-group focused">
									<label class="form-control-label" for="input-city">이메일 :</label><br>
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
									<label class="form-control-label" for="input-country">지원동기 :</label><br>
									<label class="form-control-text" id="resMotive">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resMotive }</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-country">학력 :</label><br>
									<label class="form-control-text" id="resEdu">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resEdu }</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-country">자격증 :</label><br>
									<label class="form-control-text" id="resLicense">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resLicense }</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-country">경력 :</label><br>
									<label class="form-control-text" id="resCareer">&nbsp;&nbsp;&nbsp;&nbsp;${resume.resCareer }</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
