<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<script>
$(function(){
	$("#reBtn").on('click',function(){
		var payId = "";
		
		$('input:checkbox[name=payId]').each(function(){
			payId= $("input:checkbox[name='payId']:checked").val()
		})
		
		var url = '/mypage/payRefund?payId='+payId;
		
		var windowObj = window.open(url,'mypay_refund', 'width=449,height=799,resizable=no,scrollbars=yes,left=800,top=50');
	})
	
})

</script>
<body>
  <div class="main-content">
    <div class="container mt-7">
      <!-- Table -->
      <div class="row">

        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <button type="button" class="btn btn-sm btn-default float-right" id="reBtn">강의 환불</button>
<%--               <a href="${cp}/mypage/payRefund" class="btn btn-sm btn-default float-right">강의 환불</a> --%>
              <h3 class="mb-0">결제 내역</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">결제ID</th>
                    <th scope="col">강의명</th>
                    <th scope="col">결제일</th>
                    <th scope="col">수강기간</th>
                    <th scope="col">결제방식</th>
                    <th scope="col">결제금액</th>
                    <th scope="col">환불여부</th>
                    <th scope="col">-</th>
                  </tr>
                </thead>
                  
                <tbody id="myPay">
                	<c:forEach items="${myPay}" var="myPay">
                  <tr>
                    <td>
                      ${myPay.payId}
                    </td>
                    <td>
                      ${myPay.lesNm}
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                      <fmt:formatDate value="${myPay.payDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
                      </span>
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                      <fmt:formatDate value="${myPay.cosTerm }" pattern="yyyy-MM-dd"></fmt:formatDate>
                      </span>
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                      	<c:choose>
							<c:when test="${myPay.payWay=='1'}">
								<i class="bg-success"></i>카카오페이
                        	</c:when>
                        <c:otherwise>
                        	<i class="bg-warning"></i>신용카드
                        </c:otherwise>
                        </c:choose>
                      </span>
                    </td>
                    <td>
                          <fmt:formatNumber value="${myPay.paySum }"></fmt:formatNumber>
                    </td>
                    <td>
                    	${myPay.payRefund}
                    </td>
                    <td>
                    	<input type="checkbox" id="check" name="payId" value="${myPay.payId}">
                    </td>
                  </tr>
             	</c:forEach>
                </tbody>
              </table>
            </div>
           
  		 <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
<!--                   <li class="page-item disabled"> -->
<%--                     <a class="page-link" href="${cp}/mypage/selectPoint?page=${page-1}" > --%>
<!--                       <i class="fas fa-angle-left"></i> -->
<!--                       <span class="sr-only">Previous</span> -->
<!--                     </a> -->
<!--                   </li> -->

<!--                    <li class="page-item active"> -->
<%--                     <a class="page-link" href="${cp}/mypage/selectPoint?page=${page-1}"><</a> --%>
<!--                   </li> -->

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
			                   <a class="page-link" href="${cp}/mypage/selectAllMyPay?page=${page-1}"><</a>
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
			                    <a class="page-link" href="${cp}/mypage/selectAllMyPay?page=${i}">${i}</a>
			                 	</li>
		                  </c:otherwise>
		                  </c:choose>
	                  </c:forEach>

<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="#"> -->
<!--                       <i class="fas fa-angle-right"></i> -->
<!--                       <span class="sr-only">Next</span> -->
<!--                     </a> -->
<!--                   </li> -->

<!--                    <li class="page-item active"> -->
<%--                     <a class="page-link" href="${cp}/mypage/selectPoint?page=${page+1}">></a> --%>
<!--                   </li> -->
                  
                  		<c:choose>
							<c:when test="${pages==page}">
								<li class="page-item active">
                    				<a class="page-link" href="#">></a>
                  				</li>
							</c:when>
						<c:otherwise>
								<li class="page-item active">
                    				<a class="page-link" href="${cp}/mypage/selectAllMyPay?page=${page+1}">></a>
                  				</li>
						</c:otherwise>
						</c:choose>
	                </ul>
	              </nav>
	            </div>
	          </div>
	        </div>
	      </div>
	      </div>
	    </div>
	  </div>
</body> 