<%@page import="kr.co.codemaker.user.cart.vo.LessonVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/css/user/cart/user-pay.css" rel="stylesheet" />   
<div class="payBoxArea">
	<h1>결제하기</h1>
	<div class="divide"></div>
	<c:url value="/user/pay" var="pay"/>
	<div class="row">
		<div class="col">
			<h3>결제내역</h3>
			<form action="${pay}" method="post" id="payListFrm">
					<% int sum = 0; %>
					<c:forEach items="${lessonVoList}" var="lesson"  varStatus="stat">
						<input type="hidden" name="payList[${stat.index}].userId" value="${userVo.userId}"/>
						<input type="hidden" name="payList[${stat.index}].payWay" value="1"/>
						<input type="hidden" name="payList[${stat.index}].paySum" value="${lesson.lesCash}"/>
						<input type="hidden" name="payList[${stat.index}].cosTerm" value="${lesson.lesTerm}"/>
						<input type="hidden" name="payList[${stat.index}].lesId" value="${lesson.lesId}"/>
							<c:set value="${lesson.lesTerm}" var="lesTerm"/>
							<c:set value="${lesson.lesCash}" var="lesCash"/>
							<%
								int lesTerm =(int)(pageContext.getAttribute("lesTerm")); 
								Date now = new Date();
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
								Calendar cal = Calendar.getInstance();
								cal.setTime(now);
								cal.add(Calendar.DATE, lesTerm);
								sum += (int)(pageContext.getAttribute("lesCash"));
							%>
						<div class="cont">
							<img src="/img/icon/cube.png">
							<div class="title">
								<h3>${lesson.lesNm}</h3>
							</div>
							<ul class="lessonInfo">
								<li><span>강사</span><b>${lesson.tchNm}</b></li>
								<li><span>수강기간</span><b><%=sdf.format(now)%> ~ <%= sdf.format(cal.getTime()) %></b></li>
								<fmt:formatNumber value="${lesson.lesCash}" var="lesCash" maxFractionDigits="3"/>
								<li><span>결제금액</span><b>${lesCash}원</b></li>
							</ul>
							<div class="logo">
								<img src="/img/icon/logo.png"/>
							</div>
						</div>
					</c:forEach>
				<div class="row justify-content-center">
					<div class="payinfo row">
						<div class="buyer col-md-6 col-12">
							<h3>구매자 정보</h3>
							<div class="input-group"><span class="buyer-id">${userVo.userId}</span></div>
							<div class="info-point">
								<h3>포인트 결제</h3>
								<div class="point-box">
									<div class="point-group">
										<div class="point-div">
											<fmt:formatNumber value="100000" var="usePoint" maxFractionDigits="3"/>
											<span>보유</span>
											<span class="have-point">${usePoint}원</span>
										</div>
										<div>
											<span>사용</span>
											<span class="use-point"><input type="text" name="usePoint" value="${usePoint}"/>원</span>
										</div>
										<div id="point-btn">
											<button id="totalPointUse">전액사용</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="pay-method col-md-6 col-12">
							<h3>결제 수단</h3>
							<div class="payWayBoxArea form-group row">
								<div class="payWayBox col-sm-5" style="padding-right: 0px;">
									<div class="payB">
										<input class="pay-way" name="payWay" type="radio" id="kakaopay" value="kakaopay" />
										<label for="kakaopay">
											<img src="/img/icon/kakaopay.png">카카오페이
										</label>
									</div>
								</div>
								<div class="payWayBox col-sm-4">
									<div class="payB">
										<input class="pay-way" name="payWay" type="radio" id="creditcard" value="creditcard"/>
										<label for="creditcard">신용카드</label>
									</div>
								</div>
							</div>
							<div class="pay-information col">
								<div class="divider"></div>
								<h3 style="padding-top: .8em;">결제 정보</h3>
								<div class="cash-info row">
									<div class="col">정가</div>
									<div class="cash-info-text">
										<fmt:formatNumber value="<%=sum%>" var="sum" maxFractionDigits="3"/>
										<span>${sum}<i>원</i></span>
									</div>
								</div>
								<div class="cash-info row">
									<div class="col">포인트</div>
									<div class="cash-info-text">
										<span>${usePoint}<i>원</i></span>
									</div>
								</div>
								<div class="cash-info row">
									<div class="pay-divide"></div>
									<div class="col">결제금액</div>
									<div class="cash-info-text">
										<c:set value="<%=sum -100000%>" var="totalCash"></c:set>
										<fmt:formatNumber value="${totalCash}" var="total" maxFractionDigits="3"></fmt:formatNumber>
										<span>${total}<i>원</i></span>
									</div>
								</div>
								<div class="pay-check">
									<div class="pay-check-div">
										<input type="checkbox" id="terms1" name="agree1" class="agree"/>
										<label for="terms1">
											<p>
												<b>
													<a href="https://www.notion.so/470057a434ca4eefbf2e0599a2f9dd36" target="_blank">결제 및 환불 규정</a><!--  
												--></b><!-- 
												 -->에 동의합니다 (필수)
											</p>
										</label>
									</div>
									<div class="pay-check-div">
										<input type="checkbox" id="terms2" name="agree2" class="agree"/>
										<label for="terms2">
											<p>구매조건 확인 및 
												 	<b><!-- 
													 --><a href="https://www.notion.so/566609b9392542329ab99e1946f8e3f5" target="_blank">개인정보처리약관</a><!-- 
												 --></b><!-- 
												 -->에 동의합니다 (필수)
											</p>
										</label>
									</div>
								</div>
								<button id="payListBtn" disabled="disabled">결제하기</button>
							</div>
						</div>
					</div>			
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$(function(){
	$(".agree").on('change',function(){
		if($("#terms1").prop('checked') && $("#terms2").prop('checked')){
			$("#payListBtn").attr('disabled',false);
		}else{
			$("#payListBtn").attr('disabled',true);
		}
	})
		
	$(".pay-way").on('click',function(){
		console.log($(this).val());
	})
	
	$("#payListBtn").on('click',function(){
		$("#payListFrm").submit();
	})
})
</script>
