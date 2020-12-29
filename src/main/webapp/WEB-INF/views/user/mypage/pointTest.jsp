<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- 필기노트내역 page css -->
<link href="/css/user/mypage/mypage-note.css" rel="stylesheet"/>


<script>

	//set button id on click to hide first modal
	$("#pointin").on( "click", function() {
	        $('#pointadd').modal('hide');  
	});
	$("#pointout").on( "click", function() {
	        $('#pointminus').modal('hide');  
	});
	//trigger next modal
// 	$("#signin").on( "click", function() {
// 	        $('#myModal2').modal('show');  
// 	});
       
	
	$(document).ready(function(){
	$('#out').on("click",function(){
	
		var flag=true;
		$.ajax({
			url : "/mypage/deletePoint",
			type : "post",
			dataType : "json",
			data : { pointUpdate : $('#pointUpdate').val()},
			async: false, //비동기식인 ajax를 동기식으로 설정
			success : function(res) {
				if (res == "1") {
					alert("환불잔액이 부족합니다.");
					$("#pointUpdate").val('');
					flag=false;
				} else {
					alert("환불처리를 진행하겠습니다.");
				}
			}
		}); // idchk
			return flag;
	})
});
	
</script>    
<div class="card shadow note-box">
	<div class="note-box-item">
	<!-- 임시커밋용 -->
		<h3>포인트내역</h3>
		<div class="note-item-cont">
			<div id="pdfd">
				<button type="button" class="pdf-btn" id="regBtn" data-toggle="modal" data-target="#pointadd">포인트 적립</button>
				<button type="button" class="pdf-btn" id="downBtn" data-toggle="modal" data-target="#pointminus">포인트 환불</button>
			</div>
			<div class="note-tb-box">
				<table class="note-tb">
					<thead>
						<tr>
		                    <th scope="col">일시</th>
		                    <th scope="col">이용내역</th>
		                    <th scope="col">포인트 구분</th>
		                    <th scope="col">회원</th>
		                    <th scope="col">잔여 포인트</th>
						</tr>
					</thead>
		
					<tbody id="pointList">
                	<c:forEach items="${pointList }" var="point">
                  <tr>
                    <td>
                      <fmt:formatDate value="${point.pointDate}" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                      <fmt:formatNumber value="${point.pointUpdate }"></fmt:formatNumber>&nbsp;Point
                      </span>
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                      	<c:choose>
							<c:when test="${point.pointGn=='1'}">
								<i class="bg-success"></i>적립
                        	</c:when>
                        	<c:when test="${point.pointGn=='2'}">
	                        	<i class="bg-warning"></i>차감
                        	</c:when>
                        <c:otherwise>
                        	<i class="bg-success"></i>강의 환불
                        </c:otherwise>
                        </c:choose>
                      </span>
                    </td>
                    <td>
                      <div class="avatar-group">
                        <a href="#" class="avatar avatar-sm" data-toggle="tooltip" data-original-title="Ryan Tompson">
<!--                           <img alt="Image placeholder" src="https://demos.creative-tim.com/argon-dashboard/assets/img/theme/team-1.jpg" class="rounded-circle"> -->
                          <img alt="Image placeholder" src="${cp }/mypage/profileImg?userId=${userVo.userId}" class="rounded-circle">
                        </a>
                      </div>
                    </td>
                    <td>
                          <span class="badge badge-dot mr-4">
                          <i class="bg-info"></i>
                          <fmt:formatNumber value="${point.pointSum}"></fmt:formatNumber>&nbsp;Point
                          </span>
                    </td>
                  </tr>
             	</c:forEach>
                </tbody>
              </table>
            </div>
	
	
<!-- 	페이징 -->
  		 <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                  	<c:choose>
						<c:when test="${page==0}">
						</c:when>
						<c:when test="${page==1}">
							<li class="page-item active">
			                   <a class="page-link" href="#"><</a>
			                 </li>
						</c:when>
						<c:otherwise>
							 <li class="page-item active">
			                   <a class="page-link" href="${cp}/mypage/selectPoint?page=${page-1}"><</a>
			                 </li>
						</c:otherwise>
					</c:choose>

	                  <c:forEach var ="i" begin="1" end="${pages }">
		                  <c:choose>
							<c:when test="${i==page}">
		                 	 	<li class="page-item active">
		                    	<a class="page-link" href="#">${i }</a>
		                   		</li>
		                  </c:when>
		                  <c:otherwise>
			                    <li class="page-item active">
			                    <a class="page-link" href="${cp}/mypage/selectPoint?page=${i}">${i}</a>
			                 	</li>
		                  </c:otherwise>
		                  </c:choose>
	                  </c:forEach>
                  
                  		<c:choose>
							<c:when test="${pages==page}">
								<li class="page-item active">
                    				<a class="page-link" href="#">></a>
                  				</li>
							</c:when>
						<c:otherwise>
								<li class="page-item active">
                    				<a class="page-link" href="${cp}/mypage/selectPoint?page=${page+1}">></a>
                  				</li>
						</c:otherwise>
						</c:choose>
	                </ul>
	              </nav>
	            </div>
		</div>
	</div>
</div>

<!-- Modal -->
	<div class="modal fade" id="pointadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	       
	        <h4 class="modal-title" id="myModalLabel">💰 POINT 충전</h4>
	      </div>
	        <form action="${cp}/mypage/insertPoint" method="post">
	      <div class="modal-body">
	        <h5 class="modal-title">충전할 POINT 금액을 입력해주세요.</h5><br>
	       <input type="number" class="form-control" name="pointUpdate" placeholder="충전할 금액">
<!-- 	       <input type="hidden" class="form-control" name="pointSum" > -->
	       <input type="hidden" class="form-control" name="userId" id="userId">
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary" id="pointin">충전하기</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	        </form>
	    </div>
	  </div>
	</div>
	  
<!-- Modal -->
<!-- 	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 	  <div class="modal-dialog"> -->
<!-- 	    <div class="modal-content"> -->
<!-- 	      <div class="modal-header"> -->
	       
<!-- 	        <h4 class="modal-title" id="myModalLabel">Modal 2</h4> -->
<!-- 	      </div> -->
	      
<!-- 	      <div class="modal-body"> -->
<!-- 	        <p>Sign In Error</p> -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 	      </div> -->
<!-- 	        </form> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->
	  
<!-- Modal -->
	<div class="modal fade" id="pointminus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	       
	        <h4 class="modal-title" id="myModalLabel">💰 POINT 환불</h4>
	      </div>
	        <form  method="post">
	      <div class="modal-body">
	        <h5 class="modal-title">환불할 POINT 금액을 입력해주세요.</h5><br>
	       <input type="text" class="form-control" id="pointUpdate" name="pointUpdate" placeholder="환불할 금액">
<!-- 	       <input type="hidden" class="form-control" name="pointSum" > -->
	       <input type="hidden" class="form-control" name="userId" >
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary" id="out">환불하기</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	        </form>
	    </div>
	  </div>
	</div>  