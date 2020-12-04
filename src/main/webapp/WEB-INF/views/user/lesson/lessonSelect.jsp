<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

.lidxBtn {border-bottom: 1px solid #69666d;
}

/* .contdiv{max-width:200px;} */
</style>
<script>
	$(function() {
		$('#idxBtn').on('click', function() {
			$('#idxli').css({
				'background-color' : 'rgb(0,95,134)'
			});
			$('#idxBtn').css({
				'color' : 'white'
			});
			$('#qnali').css({
				'background-color' : 'white'
			});
			$('#qnaBtn').css({
				'color' : '#69666d'
			});

		})

		$('#qnaBtn').on('click', function() {
			$('#qnali').css({
				'background-color' : 'rgb(0,95,134)'
			})
			$('#qnaBtn').css({
				'color' : 'white'
			})
			$('#idxli').css({
				'background-color' : 'white'
			});
			$('#idxBtn').css({
				'color' : '#69666d'
			});
		})
	})
</script>

<div class="container">
	<div id="cont"></div>
</div>


<div class="container" style="height: 200px;">
	<div class="card shadow lessonHeader" id="lessonInt"
		style="height: 220px;">강의소개</div>
	<div class="btn" style="border: 1px solid #69666d; margin-top: 50px;">
		<a>장바구니</a><br>
	</div>
	<div class="btn" style="border: 1px solid black;">
		<a>담기</a>
	</div>
	<div class="btn" style="border: 1px solid black;">
		<a href="${cp}/user/selectReview?lesId=${lesId}">강의후기</a>
	</div>
</div>

<div class="container">
	<ul>
		<li class="liDiv shadow" id="idxli"
			style="border-radius: 10px 0 0 10px;"><button id="idxBtn">강의목차</button></li>
		<li class="liDiv shadow" id="qnali"
			style="border-radius: 0 10px 10px 0;"><button id="qnaBtn">QnA</button></li>
	</ul>
	<div class="lessonHeader" id="lessonCont2"
		style="border: 1px solid black; width: 900px; height: 500px;">
		<div class="lessonMid">
			<c:forEach items="${lesIdxList}" var="lesIdxList">
				<li>
					<button class="lidxBtn" >
						<strong class="lidxnum">${lesIdxList.lidxNum}</strong>
						<h4 class="lidxcont">${lesIdxList.lidxCont}</h4>

					</button>
				</li>
			</c:forEach>
		</div>
		<div class="teacher"
			style="border: 1px solid black; margin-top: 50px;">
			<h2>강사소개</h2>
			<br>
		</div>
	</div>
</div>

<div class="container">
	<div class="lessonHeader" id="lessonCont"style="border: 1px solid black; width: 900px;">
	시험
	</div>
</div>




