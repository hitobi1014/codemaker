<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
#cont{padding-top:80px;margin-right: -15px; margin-left: -15px;}
#lessonInt{width:900px; height:195px;border-radius:10px; padding: 20px 0 22px; text-align:center;font-size: 26px;}
#lessonCont{border-radius:10px; padding: 20px 0 22px; text-align:center;font-size: 26px;}
.lessonHeader{float: left; }
.lessonMid{max-width:500px; float: left; margin-left: 60px; }
.btn{height:40px; width: 90px;margin-left: 50px;  margin-top: 20px; background-color: rgb(0,95,134);
	font-family: Ubuntu-Regular; font-size: 14px;line-height: 1.7;color: #fff; font-style: bold;}
.teacher{height:400px; width: 300px;margin-left: 900px; margin-top: 20px; }
li {list-style-type: none; float: left; margin-left:250px;display: inline-block; text-align: center;}



/* .contdiv{max-width:200px;} */
</style>

	<div class="container">
		<h2>강의 리스트</h2>
		<div id="cont" >
		
		</div>
		<aside> </aside>
	</div>


	<div class="container" style="height: 200px;">
			<div class="card shadow lessonHeader" id="lessonInt" style="height: 220px;">
				강의소개
		
			</div>
			<div class="btn" style="border: 1px solid black; margin-top:50px; ">
				<a>장바구니</a><br> 
			</div>
			<div class="btn" style="border: 1px solid black;">
				<a>담기</a>
			</div>
	</div>
	
	<div class="container" >
			
			<div class="lessonHeader shadow" id="lessonCont" style="width:900px;height:80px; background-color: #FFFFFF; color:#333236">
				<ul>
					<li><a>강의목차</a></li>
					<li><a>QnA</a></li>
				</ul>
			</div>
			<div class="lessonHeader" id="lessonCont" style="border:1px solid black; width:900px; height:500px;">
			<c:forEach items="${lesIdxList}" var="lesIdxList">
					<br>
					<br>
				<div class="lessonMid" >
					 <label style="font-size:0.8em; font-style: bold;">${lesIdxList.lidxNum}</label>
				</div>
				<div class="lessonMid">
					 <a style="font-size:0.8em; font-style: bold;"><label >${lesIdxList.lidxCont}</label></a>
				</div>
			</c:forEach>
			
			</div>
			<div class="teacher" style="border: 1px solid black; margin-top:50px; ">
					<h2>강사소개</h2><br> 
			</div>
	</div>
	
	<div class="container" >
		<div class="lessonHeader" id="lessonCont" style="border:1px solid black; width:900px;">
		
			시험
		</div>
	</div>
			
	
