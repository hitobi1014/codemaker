<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이력서작성 📄</title>

<script>
	$(document).ready(function(){
		$('#resumeBtn').on('click', function(){
			$('#formBtn').submit();
		})
	})
</script>

</head>
<body>
	<div class="article">
		<form action="${cp }/insertResume" id="formBtn" class="form-horizontal" method="POST" role="form" enctype="multipart/form-data" >
			<div class="subtitle_wrap">
				<span style="font-weight:bold;font-size:medium;color:#4C4C4C;">기본인적사항</span>
				<hr color="black">
			</div>
			<div class="table_wrap firstone">
				<table class="write_table" summary="기본인적사항 입력 표입니다">
					<thead style="display: none">
						<tr>
							<th scope="col">구분</th>
							<th scope="col">입력 내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>
								<label class="labelText">이름</label>
							</th>
							<td>
								<input name=resNm type="text" id="resNm" value="${param.resNm }" class="form-control" maxlength="7" style="width: 100px;  float: left;">
							</td>
						</tr>
						<tr>
							<th>
								<label class="labelText">휴대폰 번호</label>
							</th>
							<td>
								<input name="resTel" type="text" id="resTel" value="${param.resTel }" class="form-control" maxlength="11" style="width: 89px;  float: left;">
							</td>
						</tr>
						<tr>
							<th>
								<label class="labelText">이메일</label>
							</th>
							<td>                                        
								<input name="resMail" type="text" id="resMail1" class="form-control" maxlength="30" style="width: 129px;  float: left; margin-right: 7px;">
								<span class="atmark">@</span>
								<input name="resMail" type="text" id="resMail2" class="form-control" maxlength="20" style="width:129px;float:left;">
								
								<span class="atmark"></span>
								<div class="labelText" style="float: left; background-position: 92px 50%; width: 134px; margin-right: 10px;">
									<span class="selected-text">직접입력</span>
									<select title="이메일 분류" id="resMail3" name="resMail" selected="selected">
										<option value="" selected="selected">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="gmail.com">gmail.com</option>
										<option value="korea.com">korea.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="hotmail.com">hotmail.com</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="resume_photo">
									<a href="##" type="file" name="resProfile" " id="resProfile" class="box_photo" data-api_type="layer" data-api_id="basic_photo"><span>사진추가</span></a>
									<a class="photo_delete" href="##" style="display: none;"><span class="blind">사진 삭제</span></a>
								</div>					
							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="instruction_table_title"><span style="font-weight:bold;font-size:medium;color:#4C4C4C;">학력사항</span></div>
			<div class="instruction_table_wrapper">
				<table class="" summary="학력사항 입력 표입니다">
					<thead>
						<tr>
							<th class="first">
								<label>기간</label>
							</th>
							<th>
								<label>학교명</label>
							</th>
							<th>
								<label>학과(전공)</label>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="first">
								<label class="hidden" for="txtStudy2Period1"> 대학교 기간</label>
								<span class="input_text1">
									<input name="txtStudy2Period1" type="text" id="txtStudy2Period1" maxlength="50" class="input_txt">
								</span>
								<span class="wa">~</span> <span class="input_text1">
									<input name="txtStudy2Period2" type="text" id="txtStudy2Period2" maxlength="50" class="input_txt">
								</span>
							</td>
							<td class="al">
								<span class="name">
									<label for="txtStudy2School"> 대학교</label>
								</span>
								<span class="input_text2">
									<input name="txtStudy2School" type="text" id="txtStudy2School" maxlength="50" class="input_txt">
								</span>
							</td>
							<td>
								<label class="hidden" for="txtStudy2Dept">   대학교 단과대(학부)</label>
								<span class="input_text3">
									<input name="txtStudy2Dept" type="text" id="txtStudy2Dept" maxlength="50" class="input_txt">
								</span>
							</td>
							<td>
								<label class="hidden" for="txtStudy2Major">   대학교 학과(전공)</label>
								<span class="input_text3">
									<input name="txtStudy2Major" type="text" id="txtStudy2Major" maxlength="50" class="input_txt">
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	
	
			<div class="instruction_table_title"><span style="font-weight:bold;font-size:medium;color:#4C4C4C;">자기소개</span></div>
			<div class="instruction_table_wrapper none_border">
				<table class="" summary="자기소개 입력 표 입니다">
					<tbody>
						<tr>
							<td class="top">
								<label for="taApplyMotivation">지원동기</label>
							</td>
							<td style="padding-right: 0;">
								<div class="">
									<textarea name="taApplyMotivation" id="taApplyMotivation" onkeyup="checkByte(this,1200,'sp_ad_content_size_5', 'sp_ad_content_size_6');"></textarea>
								</div>
								<div class="remain_text" id="ad_content_size_3">
									<span id="sp_ad_content_size_5">0</span>/1200byte ( <span id="sp_ad_content_size_6">0</span>/600자)
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_area_recruit">
				<p>
					<button class="btn_squre btn_gray" type="submit" id="tempSave"><span>임시 저장하기</span></button>
					<span class="btn_pack me type03"><a href="list.aspx">취소</a></span> 
					<span id="Btn_Insert" class="btn_pack me type03">
						<button type="submit" id="resumeBtn" onclick="javascript:return recruit();">지원하기</button>
	                               
					</span>
				</p>
			</div>
		</form>
	</div>
</body>
</html>