<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="/js/admin/chart/Chart.min.js"></script>
<script src="/js/admin/chart/utils.js"></script>
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<head>
<title>Line Chart</title>
</head>
<style>
canvas{
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
#candiv{
 display: block; margin: 0px auto;
}
</style>
<body>
	<div style="width:75%;" id="candiv">
	
		<canvas id="canvas" width="300" height="80"></canvas>
		
		<button class="btn btn-sm btn-default float-right" id="randomizeData">Randomize Data</button>
		<button class="btn btn-sm btn-default float-right" id="addDataset">Add Dataset</button>
		<button class="btn btn-sm btn-default float-right" id="removeDataset">Remove Dataset</button>
		<button class="btn btn-sm btn-default float-right" id="addData">Add Data</button>
		<button class="btn btn-sm btn-default float-right" id="removeData">Remove Data</button>
	</div>
	
				
				<c:forEach var="i"  begin="1" end="30" step="5">
				
				</c:forEach>
			
<script>

// 		var i = 30;
// 		var j = 100;
		
		var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var config = {
			type: 'line',
			data: {
				labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
// 				labels: ${jarray2},  //X축제목
				datasets: [
					<c:forEach items="${lessonPayTotal}" var="lessonPay" varStatus="status">
							{
							label: '<c:out value="${lessonPay.lesId}"/>',
							backgroundColor: 'rgb(${status.index*80+100}, ${status.index*60}, ${status.index*40})',
							borderColor: 'rgb(${status.index*80+100}, ${status.index*60}, ${status.index*40})',
							data: [
								<c:out value="${lessonPay.result}"/>
								],
							fill: false,
							}
							<c:if test="${!status.last}">,</c:if>
					</c:forEach>	
							
					]
			},
			options: {
				responsive: true,
				title: {
					display: true,
					text: '[월별 강의 매출]'
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{ //x축
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Month'
						}
					}],
					yAxes: [{ //y 축
							 display: true,
							 labelString: 'Sales',
								ticks : {
									beginAtZero: true,
	                                steps: 10,
	                                stepValue: 50000,
	                                max: 1600000
								}
							}]
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myLine = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});

			window.myLine.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[config.data.datasets.length % colorNames.length];
			var newColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset' + config.data.datasets.length,
				backgroundColor: newColor,
				borderColor: newColor,
				data: [],
				fill: false
			};

			for (var index = 0; index < config.data.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			config.data.datasets.push(newDataset);
			window.myLine.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (config.data.datasets.length > 0) {
				var month = MONTHS[config.data.labels.length % MONTHS.length];
				config.data.labels.push(month);

				config.data.datasets.forEach(function(dataset) {
					dataset.data.push(randomScalingFactor());
				});

				window.myLine.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			config.data.datasets.splice(0, 1);
			window.myLine.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			config.data.labels.splice(-1, 1); // remove the label first

			config.data.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});

			window.myLine.update();
		});
		
</script>

<!-- 매출 테이블입니다. -->
<div class="main-content">
    <div class="container mt-7">
      <!-- Table -->
      <div class="row">

        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <a href="${cp}/admin/downExcel" class="btn btn-sm btn-default float-right">EXCEL다운로드</a>
<%--               <a href="${cp}/mypage/insertPoint" class="btn btn-sm btn-default float-right" data-toggle="modal" data-target="#pointadd">포인트 충전</a> --%>
              <h3 class="mb-0">💵 강의 매출내역</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col"></th>
                    <th scope="col">결제ID</th>
                    <th scope="col">결제금액</th>
                    <th scope="col">결제일</th>
                    <th scope="col">강의ID</th>
                    <th scope="col">강의명</th>
<!--                     <th scope="col"></th> -->
                  </tr>
                </thead>
                
                <tbody id="lesPayList">
                	<c:forEach items="${lesPayList }" var="lesPayList">
                  <tr>
                    <th scope="row">
                      <div class="media align-items-center">
                        <a href="#" class="avatar rounded-circle mr-3">
                          <img alt="Image placeholder" src="${cp}/images/user/icons/dollar.png">
                        </a>
                        <div class="media-body">
                          <span class="mb-0 text-sm"></span>
                        </div>
                      </div>
                    </th>
                    <td>
                    	${lesPayList.payId}
                    </td>
                    <td>
 						${lesPayList.paySum } 
                    </td>
                    <td>
                      	<fmt:formatDate value="${lesPayList.payDate}" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>
                    	 ${lesPayList.lesId }
                    </td>
                    <td>
                         ${lesPayList.lesNm }
                    </td>
                  </tr>
             	</c:forEach>
                </tbody>
              </table>
            </div>


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
			                   <a class="page-link" href="${cp}/admin/selectLessonPay?page=${page-1}"><</a>
			                 </li>
						</c:otherwise>
					</c:choose>

	                  <c:forEach var ="i" begin="1" end="${pages}">
		                  <c:choose>
							<c:when test="${i==page}">
		                 	 	<li class="page-item active">
		                    	<a class="page-link" href="#">${i}</a>
		                  		</li>
		                  </c:when>
		                  <c:otherwise>
			                    <li class="page-item active">
			                    <a class="page-link" href="${cp}/admin/selectLessonPay?page=${i}">${i}</a>
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
                    				<a class="page-link" href="${cp}/admin/selectLessonPay?page=${page+1}">></a>
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
</body>

</html>