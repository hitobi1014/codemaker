<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${lesIdxList}" var="lesIdxList" varStatus="status">
	<form id="lesIdxForm"
		action="${cp}/teacherL/updateLessonIndex?lidxId=${lesIdxList.lidxId}&lesId=${lesIdxList.lesId}"
		method="POST">
		<input type="hidden" value="lidxId">
		<div class="pl-lg-4" id="pl-lg-4-id_[0]">
			<div class="row">
				<div class="col-lg-2">
					<div class="form-group">
						<label class="form-control-label" for="input-email">강의 차수</label>
						<input type="text" class="form-control form-control-alternative"
							placeholder="강의차수" name="lesIdxList[0].lidxNum"
							id="lidxNum${status.index}" value="${lesIdxList.lidxNum}">
					</div>
				</div>
				<div class="IdxContDiv">
					<div class="col-lg-7">
						<div class="form-group">
							<label class="form-control-label" for="input-email">강의 내용</label>
							<input type="text" class="form-control form-control-alternative"
								placeholder="강의내용" name="lesIdxList[0].lidxCont"
								id="lidxCont${status.index}" value="${lesIdxList.lidxCont}">
						</div>
					</div>
					<div>
						<input type="button" class="idxDelBtn" value="삭제"
							data-lidxid="${lesIdxList.lidxId}"
							data-lesid="${lesIdxList.lesId}"> <input type="button"
							id="${status.index}" class="idxUpBtn" value="수정!!!"
							data-lidxid="${lesIdxList.lidxId}"
							data-lesid="${lesIdxList.lesId}">
					</div>
				</div>
			</div>
		</div>
	</form>
</c:forEach>