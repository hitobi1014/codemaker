<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>이력서작성 📄</title>

<style>
	#img{
		width: 130px;
		height: 150px;
		border: 0.5px solid #888B8D;
	}
	#resTel1{
		width: 100px;
		height: 35px;
	}
	.article{
		margin-left: 25%;
	}
	#insertBtn{
		background: #005f86;
		width: 70px;
		height: 35px;
		color: #fff;
	}
	#cancel{
		background: #005f86;
		width: 70px;
		height: 35px;
		color: #fff;
	}
	#resCareer{
		resize: none;
		height: 150px;
		width: 800px;
		border: 1px solid black;
	}
	#resMotive{
		resize: none;
		height: 150px;
		width: 800px;
		border: 1px solid black;
	}
	#license{
		border: 1px solid black;
		height: 100px;
		width: 650px;
	}
</style>
<script>
	$(document).ready(function(){
		$('#insertBtn').on('click', function(){
			
			var resMail1 = $("#resMail1").val();
			var resMail2 = $("#resMail2").val();
			var resEdu1 = $("#resEdu1").val();
			var resEdu2 = $("#resEdu2").val();
			var resEdu3 = $("#resEdu3").val();
			var resEdu4 = $("#resEdu4").val();
			var resTel1 = $("#resTel1").val();
			var resTel2 = $("#resTel2").val();
			var resTel3 = $("#resTel3").val();
			
			$("#resMail").val(resMail1 + resMail2);
			
			$("#resEdu").val(resEdu1 + '~' + resEdu2 + ' ' + resEdu3 + ' ' + resEdu4);
			
			$("#resTel").val(resTel1 + '-' + resTel2 + '-' + resTel3);
			alert(resEdu1 + '~' + resEdu2 + ' ' + resEdu3 + ' ' + resEdu4);

			$('#insertForm').submit();
		});
	});
	
	function selectEmail(ele){ 
		var $ele = $(ele);
		var $email2 = $('input[name=resMail2]'); 
		
		// '1'인 경우 직접입력 
		if($ele.val() == "1" ){ 
			$email2.attr('readonly', false); 
			$email2.val('@'); 
		} else { 
			$email2.attr('readonly', true); 
			$email2.val($ele.val()); 
			
		}
	}
	
	// 파일 첨부시 미리보기 창
	function loadImg(value){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	// 이미지 버튼 클릭시 파일 첨부 창
	$(function(){
		$('#img').click(function(e){
			e.preventDefault();
			$('#resProfile').click();
		});
	});
	

</script>

</head>
<body>
	<div class="article">
		<form action="${cp }/resume/insert" id="insertForm" class="form-horizontal" method="POST" enctype="multipart/form-data" name="insertForm" >
			<div class="mainBox">
				<div class="subtitle_wrap">
					<br>
					<br>
					<span style="font-weight:bold;font-size:medium;color:#4C4C4C;">기본인적사항</span>
					<hr color="#888B8D" width="1000">
				</div>
				<div class="table_wrap firstone">
					<table class="write_table">
						<tbody>
							<tr>
								<td>
									<label class="labelText" style="margin-right: 20px;">이력서 프로필</label>
								</td>
								<td>
									<div class="resume_photo">
										<img id="img" src="/images/teacher/imageAdd.PNG" style="cursor:pointer"><br><br>
										<input type="file" id="resProfile" name="profile" style="display:none;">
										<input type="hidden" name="target_url"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="labelText">이름</label>
								</td>
								<td>
									<input name=resNm type="text" id="resNm" class="form-control" maxlength="5" style="width: 100px;  float: left;">
								</td>
							</tr>
							<tr>
								<td>
									<label class="labelText">휴대폰 번호</label>
								</td>
								<td>
									<select title="전화번호 분류" id="resTel1" name="resTel1">
										<option value="" selected="selected">-</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>
									<input name="resTel2" type="text" id="resTel2" class="form-control" maxlength="4" style="width: 89px;  float: left;">
									<input name="resTel3" type="text" id="resTel3" class="form-control" maxlength="4" style="width: 89px;  float: left;">
									<input type="hidden" id="resTel" name="resTel"/>
								</td>
							</tr>
							<tr>
								<th>
									<label class="labelText">이메일</label>
								</th>
								<td>                                        
									<input name="resMail1" type="text" id="resMail1" class="form-control" maxlength="30" style="width: 129px;  float: left; margin-right: 7px;">
									<input name="resMail2" type="text" id="resMail2" class="form-control" maxlength="20" style="width:129px;float:left;" value="@">
									<select title="이메일 분류" id="selectMail" name="selectMail" onchange="selectEmail(this)">
										<option value="1" selected="selected">직접 입력</option>
										<option value="@maker.co.kr">maker.co.kr</option>
										<option value="@naver.com">naver.com</option>
										<option value="@nate.com">nate.com</option>
										<option value="@yahoo.co.kr">yahoo.co.kr</option>
										<option value="@gmail.com">gmail.com</option>
										<option value="@korea.com">korea.com</option>
										<option value="@hanmail.net">hanmail.net</option>
									</select>
									
									<input type="hidden" id="resMail" name="resMail"/>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<br><br>
				<div class="instruction_table_title"><span style="font-weight:bold;font-size:medium;color:#4C4C4C;">학력사항</span></div>
				<hr color="#888B8D" width="1000">
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
									<span class="input_text1">
										<input name="resEdu1" type="date" id="resEdu1" class="input_txt">
									</span>
									<span class="wa">~</span> <span class="input_text1">
										<input name="resEdu2" type="date" id="resEdu2" class="input_txt">
									</span>
									
								</td>
								<td class="al">
									<span class="name">
									</span>
									<span class="input_text2">
										<input name="resEdu3" type="text" id="resEdu3" maxlength="50" class="input_txt" style="border: 1px solid black; height: 30px;">
									</span>
								</td>
								<td>
									<span class="input_text3">
										<input name="resEdu4" type="text" id="resEdu4" maxlength="50" class="input_txt" style="border: 1px solid black; height: 30px; outline-color: #005f86;">
										<input type="hidden" id="resEdu" name="resEdu"/>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<br>
		
				<div class="instruction_table_title"><span style="font-weight:bold;font-size:medium;color:#4C4C4C;">자기소개</span></div>
				<hr color="#888B8D" width="1000">
				<div class="instruction_table_wrapper none_border">
					<table class="" summary="자기소개 입력 표 입니다">
						<tbody>
							<tr>
								<td class="top">
									<label for="taApplyMotivation">자격증</label>
								</td>
								<td style="padding-right: 0;">
									<div>
									<input type="text" name="resLicense" class="box_input" id="license">
									</div>
									<br>
								</td>
							</tr>
							<tr>
								<td class="top">
									<label for="taApplyMotivation">지원동기</label>
								</td>
								<td style="padding-right: 0;">
									<div class="">
										<textarea name="resMotive" id="resMotive"></textarea>
									</div>
									<br>
								</td>
							</tr>
							<tr>
								<td class="top">
									<label for="taApplyMotivation">경력기술서</label>
								</td>
								<td style="padding-right: 0;">
									<div class="">
										<textarea name="resCareer" id="resCareer"></textarea>
									</div>
									<br>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_area_recruit">
					<p>
						<input type="button" id="cancel"  value="돌아가기" onclick="location.href='/userT/main'"/>
						<input type="button" id="insertBtn"  value="지원하기" onclick="location.href='/success'"/>
					</p>
				</div>
			</div>
		</form>
	</div>
