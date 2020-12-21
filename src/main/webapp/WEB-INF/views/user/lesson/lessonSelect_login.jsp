<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#cont {
	padding-top: 80px;
	margin-right: -15px;
	margin-left: -15px;
}

#lessonInt {
	width: 900px;
	height: 195px;
	border-radius: 10px;
	padding: 20px 0 22px;
	text-align: center;
	font-size: 26px;
}

#lessonCont {
	border-radius: 10px;
	padding: 20px 0 22px;
	text-align: center;
	font-size: 26px;
	background-color: white
}

#lessonCont2 {
	border-radius: 10px;
	text-align: center;
	font-size: 26px;
	background-color: white
}

.lessonHeader {
	float: left;
}

.lessonMid {
	width: 900px;
	float: left;
}

.btn {
	height: 40px;
	width: 90px;
	margin-left: 50px;
	margin-top: 20px;
	background-color: rgb(0, 95, 134);
	font-family: Ubuntu-Regular;
	font-size: 14px;
	line-height: 1.7;
	color: #fff;
	font-style: bold;
}

.teacher {
	height: 400px;
	width: 300px;
	margin-left: 900px;
	margin-top: 20px;
	margin-left: 920px
}

.liDiv {
	list-style-type: none;
	display: inline-block;
	text-align: center;
	border: 1px solid #d2d2d2;
	width: 450px;
	height: 70px;
	margin-right: -10px;
	background-color: #fff;
}

li .on {
	background-color: rgb(0, 78, 134)
}

ul {
	width: 900px;
	height: 70px;
	border-radius: 10px;
	text-align: center;
	font-size: 26px;
	margin-top: 30px;
	float: left;
}

button {
	margin-top: 15px;
	font-weight: 400;
	color: #69666d;
	display: inline-block;
	width: 100%;
}

.lidxnum {
	font-size: 16px;
	width: 80px;
    padding-right: 100px;
    margin-left: 60px;
    float: left
}

.lidxcont {
	padding: 10px 0 22px 36px;
	font-size: 18px;
	font-weight: 600;
	line-height: 1.11;
	text-align: left;
}

.lidxBtn {
	border-bottom: 1px solid #69666d;
}
 #videoImg{
 	width: 40px;
 	height: 40px;
 }
.container_lesson{
	margin-right: auto;
    margin-left: auto;
    margin-top: 100px;
    padding-right: 15px;
    padding-left: 15px;
    width: 1140px;
    min-height: 830.438px;
}
.container_left{
	width: 55%;
	height : auto;
	display: inline-block;
}
.container_right{
	width: 37%;
	height : auto;
	display: inline-block;
	margin-left: 50px;
}
.container_lessonIndex{
	margin-bottom: 1.5rem;
}
.container_lessonIndex_In{
	display: block;
    position: relative;
    height: 3.5rem
}
.container_lessonIndex_section{
	position: absolute;
    width: 100%;
    z-index: 2;
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 4.0rem;
    background-color: #dde0ea;
    border-radius: .8rem;
}
.bg-index{
	background-image: linear-gradient(154deg, #005F86, #005F86) !important;
}
.secion_indes{
	width: 6.3rem;
    flex-shrink: 0;
    font-size: 1.7rem;
    font-weight: 500;
    text-align: center;
    letter-spacing: -0.39px;
    
}
.lessonIndex{
	width: 5.0rem;
    flex-shrink: 0;
    font-size: 1.7rem;
    font-weight: 500;
    text-align: center;
    letter-spacing: -0.39px;
    color : white;
}
.container_lessonCont_section{
color: #333236;
    flex-grow: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 90%;
    height: 100%;
    padding-left: 2.0rem;
    padding-right: 2rem;
    background-color: #ffffff;
    border-radius: .8rem;
    font-weight: 600;
}
h2{
	display: block;
    font-size: 1.1em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: 600;
    color: #333236;
}
.video{
	width: 1.9rem;
    height: 1.9rem;
    background-size: cover;
}
.note{
	width: 1.9rem;
    height: 1.9rem;
    background-size: cover;
    margin-left: 20px;
}

.container_teacher_top{
	position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
   	padding-bottom: 20%;
    padding-top: 10rem;
    height: 0;
    margin-bottom: 1.5rem;
    border-radius: .6rem;
    background-color: #d8d8d8;
    cursor: pointer;
    overflow: hidden;
}

.container_teacher_top{
	position: relative;
	width: 240px;
	height: 240px;
	margin-left: 100px;
	border-radius: 50%;
	background-color: white;
}
#teacher{
	border-radius: 50%;
	width: 240px;
    height: 240px;
}
.container_teacher_bottom{
	padding: 3.5rem 3rem;
	display: flex;
    border-radius: .5rem;
    box-shadow: 10px 9px 27px 0 rgba(27, 16, 93, 0.06);
    background-color: #ffffff;
    height: 300px;
}
 .teacher_title{ 
 	display: flex; 
     align-items: center; 
     position: relative; 
     margin-bottom: 1.1rem; 
     font-size: 1.4rem; 
     font-weight: 600; 
     letter-spacing: -0.32px; 
     color: #736f79; 
     height: 40px;
 } 
/* h3{ */
/* 	display: block; */
/*     font-size: 1.17em; */
/*     margin-block-start: 1em; */
/*     margin-block-end: 1em; */
/*     margin-inline-start: 0px; */
/*     margin-inline-end: 0px; */
/*     font-weight: bold; */
/* } */

.teacher_cont{
	font-size: 1.5rem;
    line-height: 1.73;
    letter-spacing: -0.35px;
    color: #050505;
    display: inline-block;
    margin-top: 70px;
    margin-left: -120px;
}
.lidxCont{
	width: 60%;
}
.lidxImg{
	width: 40%;
}
#spanText{
	color:#007bff;
	font-weight: 900;
}

/* .contdiv{max-width:200px;} */
</style>
<script>
	// 강의영상 클릭시
	$(function() {
		$('a[id^="videoClick_"]').on('click',function(){
			var path = $(this).attr('value');
			var lidxId = $(this).data('lidxid');
			window.open("/user/selectYoutube?lidxPath="+path+"&lidxId="+lidxId, "video_popup", "width=1100,height=900, left=30, top=30");
		})

	})

</script>

<div class="container">
	<div id="cont"></div>
</div>


<div class="container" style="height: 200px;">
	<div class="card shadow lessonHeader" id="lessonInt"
		style="height: 220px;">강의소개4</div>
	<div class="btn" style="border: 1px solid #69666d; margin-top: 50px;">
		<a onclick="addCart('${lesId}','${MEMBER_INFO.userId}')">강의담기</a><br>
	</div>
	<div class="btn" style="border: 1px solid black;">
		<a>담기</a>
	</div>
	<div class="btn" style="border: 1px solid black;">
		<a href="${cp}/user/selectReview?lesId=${lesId}">강의후기</a>
		<div id="payBtn" class="btn" style="border: 1px solid black;">
			<c:url value="/user/payView" var="pay">
				<c:param name="lesId" value="${lesId}" />
			</c:url>
			<a href="${pay}">결제하기</a>
		</div>
	</div>
</div>

<div class="container_lesson" >
	<div class="container_left" >
		<c:forEach items="${lesIdxList}" var="lesIdxList" varStatus="status">
			<div class="container_lessonIndex" >
				<div class="container_lessonIndex_In" >
					<div class="container_lessonIndex_section bg-index"> 	
						<span class="lessonIndex">${lesIdxList.lidxNum}</span>
						<div class="container_lessonCont_section">
							<div class="lidxCont">
								<h2>${lesIdxList.lidxCont}</h2>
							</div>
							<c:if test="${MEMBER_INFO.userId != null}">
								<div class="lidxImg">
									<span><a href="#" id="videoClick_${status.index}" value="${lesIdxList.lidxPath}" class="videoA" data-lidxid="${lesIdxList.lidxId}" ><img class="video" src="/images/user/lesson/video2.png"></a><a href=""><img class="note" src="/images/user/lesson/note.png"></a></span>
									<c:choose>
										<c:when test="${lesIdxList.lidxCurtime /lesIdxList.lidxDurtime == 1}">
											<span id="spanText">완료</span>
										</c:when>
										<c:when test="${lesIdxList.lidxCurtime /lesIdxList.lidxDurtime != 1}">
											<span>미완료(<fmt:formatNumber value="${lesIdxList.lidxCurtime /lesIdxList.lidxDurtime}" type="percent"/>)</span>
										</c:when>
									</c:choose>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="container_right" >
		<div class="container_teacher_top">
			<img id="teacher" src="/images/user/lesson/teacher.png">
		</div>
		<div class="container_teacher_bottom">
			<div class="teacher_title">
				<h3>강사 이름</h3>
			</div>
			<div class="teacher_cont">
				<p>강사 소개, 약력</p>
			</div>
		</div>
		
	</div>
	
</div>

<div class="container">
	<div class="lessonHeader" id="lessonCont"style="border: 1px solid black; width: 900px;">
	시험
	</div>
</div>
<script>
function addCart(lesId,userId){
	console.log(lesId,userId);
	$.ajax({
		method : "post",
		url : "/user/cart",
		data : {lesId:lesId,userId:userId},
		dataType : "json",
		success : function(res){
			if(res.code==0){
				alert(res.msg);
			}else{
				var check = confirm("장바구니에 강의를 담았습니다\n장바구니로 이동하시겠습니까?");
				if(check){
					location.href="${pageContext.request.contextPath}/user/cartView";
				}
			}
		}
	})
}
</script>

