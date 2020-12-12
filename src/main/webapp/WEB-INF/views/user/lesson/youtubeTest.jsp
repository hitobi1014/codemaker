<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
<script>

      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      var curTime;
      var durTime;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '360',
          width: '640',
          videoId: '${lidxPath}',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
       
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      
      function onPlayerStateChange(event) {
          console.log(event);
          curTime = player.getCurrentTime();
          durTime = player.getDuration()
          
	      
//         if (event.data == YT.PlayerState.PLAYING && !done) {
// //           setTimeout(stopVideo, 3000);
// 			console.log(player.getCurrentTime());
//         	 // 전체시간
//         	 console.log(player.getDuration())
//           done = true;
//         }

		// 일시정지 버튼눌렀을때
		if (event.data == YT.PlayerState.PAUSED && !done) {
        	// 현재시간
        	 console.log(curTime);
        	// 전체시간
        	 console.log(durTime)
        	 done = false;
        }
		// 영상을 끝까지 보았을때
		if (event.data == YT.PlayerState.ENDED && !done) {
        	// 현재시간
        	 console.log(curTime);
        	// 전체시간
        	 console.log(durTime)
        	 
        	 done = true;
        }
		
// 		function stopVideo() {
// 			// 일시정지 버튼눌렀을때
// 			if (event.data == YT.PlayerState.PAUSED && !done) {
// 	        	//현재시간
// 	        	 console.log(curTime);
// 	        	 // 전체시간
// 	        	 console.log(durTime)
// 	        	 done = false;
// 	        	 document.location="/user/time?curtime="+curTime+"&durTimr="+durTime;
// 	        }
// 	     }
		
      }
	var btn = function(){
// 		alert('클릭');
		var lidxId = $('#btn').data('lidxid');
		console.log(lidxId);
		// 현재시간
   	 	console.log(curTime);
   		 // 전체시간
	 	console.log(durTime);
   		 
   		$.ajax({
   			url:"/user/updateLessonPage",
   			type:"get",
   			data:{'curTime' : curTime,
   				  'lidxId' : lidxId},
   			success:function(data){
// 				document.location="/user/selectLessonPage";
// 				alert('넘어옴');
				opener.parent.location.reload();
   				self.close();
   			},error:function(){
//    				alert('안됨');
   			}
   		}) 
	}
	
	$(function(){
		$(window).on('beforeunload', function(){
			var lidxId = $('#btn').data('lidxid');
	 		alert(lidxId);
			// 현재시간
			console.log(curTime);
			// 전체시간
			console.log(durTime);

			$.ajax({
				url : "/user/updateLessonPage",
				type : "get",
				// 	    			async:false,
				data : {
					'curTime' : curTime,
					'lidxId' : lidxId
				},
				success : function(data) {
					// 				document.location="/user/selectLessonPage";
									alert('넘어옴');
					opener.document.location.reload();
				},
				error : function() {
// 					alert('안됨');
				}
			})

		})
	})
	// 	function closePage(){
	// 		alert('X클릭');
	// 		var lidxId = $('#btn').data('lidxid');
	// 		console.log(lidxId);
	// 		// 현재시간
	//    	 	console.log(curTime);
	//    		 // 전체시간
	// 	 	console.log(durTime);

	//    		$.ajax({
	//    			url:"/user/updateLessonPage",
	//    			type:"get",
	//    			data:{'curTime' : curTime,
	//    				  'lidxId' : lidxId},
	//    			success:function(data){
	// // 				document.location="/user/selectLessonPage";
	// // 				alert('넘어옴');
	// 				opener.parent.location.reload();
	//    				self.close();
	//    			},error:function(){
	//    				alert('안됨');
	//    			}
	//    		}) 

	// }
</script>
<html>
  <body>
    <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    <div id="player"></div>
    <div>
    	<button id="btn" type="button"  onclick="btn()" data-lidxid="${lidxId}">클릭3
    	</button>
    </div>

  </body>
</html>