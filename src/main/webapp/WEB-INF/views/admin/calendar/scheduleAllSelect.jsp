<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='/fullcalendar/packages/list/main.css' rel='stylesheet' />

<script src='/fullcalendar/packages/core/main.js'></script>
<script src='/fullcalendar/packages/interaction/main.js'></script>
<script src='/fullcalendar/packages/daygrid/main.js'></script>
<script src='/fullcalendar/packages/timegrid/main.js'></script>
<script src='/fullcalendar/packages/list/main.js'></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var flag = true;
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'list', 'interaction' ],
      header: {
    	 left: 'prev,next today',
         center: 'title',
         right: 'dayGridMonth,listWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	// 종료 날짜 하루 빼준다.
    	moment(arg.end.setDate(arg.end.getDate() - 1)).format('YYYY-MM-DD HH:mm');
    	
    	$('.modal').find('#sDate').val(moment(arg.start).format('YYYY-MM-DD'));
    	$('.modal').find('#schTSdate').val(moment(arg.start).format('HH:mm'));
		$('.modal').find('#eDate').val(moment(arg.end).format('YYYY-MM-DD'));
		$('.modal').find('#schTEdate').val(moment(arg.end).format('HH:mm'));
    	$('.modal').modal('show');
    	
        calendar.unselect()
      },
      editable: false,
   	  eventLimit: true,
      events: ${jarray},
      eventClick : function(info) {
		   	if(flag){
			   	//Show contextmenu:
				//Get window size:
				var winWidth = $(document).width();
				var winHeight = $(document).height();
				
				//Get pointer position:
				var posX = info.jsEvent.pageX;
				var posY = info.jsEvent.pageY;
				
				//Get contextmenu size:
				var menuWidth = $(".contextmenu").width();
				var menuHeight = $(".contextmenu").height();
				//Security margin:
				var secMargin = 10;
				//Prevent page overflow:
				if(posX + menuWidth + secMargin >= winWidth
				&& posY + menuHeight + secMargin >= winHeight){
				  //Case 1: right-bottom overflow:
				  posLeft = posX - menuWidth - secMargin + "px";
				  posTop = posY - menuHeight - secMargin + "px";
				}
				else if(posX + menuWidth + secMargin >= winWidth){
				  //Case 2: right overflow:
				  posLeft = posX - menuWidth - secMargin + "px";
				  posTop = posY + secMargin + "px";
				}
				else if(posY + menuHeight + secMargin >= winHeight){
				  //Case 3: bottom overflow:
				  posLeft = posX + secMargin + "px";
				  posTop = posY - menuHeight - secMargin + "px";
				}
				else {
				  //Case 4: default values:
				  posLeft = posX + secMargin + "px";
				  posTop = posY + secMargin + "px";
				};
				
				//Display contextmenu:
				$(".contextmenu").css({
				  "left": posLeft,
				  "top": posTop
				}).show();
				flag = false;
				
				// 일정 수정하기
				$('#ua').on('click', function(){
					str = '<input type="hidden" name="schId" id="schId" value="'+ info.event.id +'"/>';
					$("#ff").append(str);
					$(".contextmenu").hide();
					$('.modal').modal('show');
					$('.modal-title').text('일정 수정');
					$('#save-event').val('수정하기');
					$('#ff').attr('action','/admin/updateSchedule');
		 		    $('.modal').find('#schCont').val(info.event.title);
		 		    
		 			// 종료 날짜 하루 빼준다.
		 	    	moment(info.event.end.setDate(info.event.end.getDate() - 1)).format('YYYY-MM-DD HH:mm');
		 		    
		 		    $('.modal').find('#sDate').val(moment(info.event.start).format('YYYY-MM-DD'));
		 	    	$('.modal').find('#schTSdate').val(moment(info.event.start).format('HH:mm'));
		 			$('.modal').find('#eDate').val(moment(info.event.end).format('YYYY-MM-DD'));
		 			$('.modal').find('#schTEdate').val(moment(info.event.end).format('HH:mm'));
		 			
		 		    flag = true;
				});
				
				// 일정 삭제하기
				$('#da').on('click', function(){
					console.log('삭제');
		 		    flag = true;
					$(".contextmenu").hide();
					document.location = "/admin/deleteSchedule?schId="+ info.event.id;
				});
				
		   	}else{
		  		$(".contextmenu").hide();
		  		flag = true;
		   	}
	   }
      
    })
    calendar.render();
  });
  
  
  $(function(){
	  
	  // 일정 등록 및 수정
	  $('#save-event').on('click', function(){
		  // 일정 빈칸 체크
		  if($('#schCont').val() == null || $('#schCont').val() == ''){
			  alert('일정 내용을 입력해주세요.');
		  }else{
			  //schSdate,schEdate
			  var sDate = $('#sDate').val() + ' ' + $('#schTSdate').val();
			  var eDate = $('#eDate').val() + ' ' + $('#schTEdate').val();
			  str = '<input type="hidden" id="schSdate" name="schSdate" value="'+ sDate +'">';
			  str += '<input type="hidden" id="schEdate" name="schEdate" value="'+ eDate +'">';
			  $('#ff').append(str);
			  
			  $('#ff').submit();
		  }
	  });
	  
	  // 입력된 값 초기화
	  $('.modal').on('hidden.bs.modal', function (e) {
		    $(this).find('form')[0].reset();
		    $('.modal-title').text('일정 등록');
		    $('#save-event').val('등록하기');
		    $('#ff').attr('action','/admin/insertSchedule');
	  });
	  
		
  })
  
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

.contextmenu {
	display: none;
	position: absolute;
	width: 200px;
	margin: 0;
	padding: 0;
	background: #FFFFFF;
	border-radius: 5px;
	list-style: none;
	box-shadow: 0 15px 35px rgba(50, 50, 90, 0.1), 0 5px 15px
		rgba(0, 0, 0, 0.07);
	overflow: hidden;
	z-index: 999999;
}

.contextmenu li {
	border-left: 3px solid transparent;
	transition: ease .2s;
}

.contextmenu li a {
	display: block;
	padding: 10px;
	color: #B0BEC5;
	text-decoration: none;
	transition: ease .2s;
}

.contextmenu li:hover {
	background: #CE93D8;
	border-left: 3px solid #9C27B0;
}

.contextmenu li:hover a {
	color: #FFFFFF;
}
</style>
</head>
<body>
	<div id='calendar'></div>

	<ul class="contextmenu">
		<li><a id="ua" data-toggle="modal">일정 수정하기</a></li>
		<li><a id="da" href="#">일정 삭제하기</a></li>
	</ul>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<form action="/admin/insertSchedule" method="post" id="ff">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">일정 등록</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="starts-at">스케줄 시작일</label> 
								<input type="date" name="sDate" id="sDate" />
								<input type="time" name="schTSdate" id="schTSdate" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="ends-at">스케줄 종료일</label> 
<!-- 								<input type="datetime-local" name="schEdate" id="schEdate" /> -->
								<input type="date" name="eDate" id="eDate" />
								<input type="time" name="schTEdate" id="schTEdate" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="title">스케줄 내용</label> 
								<input type="text" name="schCont" id="schCont" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						 <input type="button" class="btn btn-primary" id="save-event" value="등록하기">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="clo">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
