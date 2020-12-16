<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
@font-face {
    font-family: 'NotoSerifKR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NotoSerifKR.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.header{
	width: 589px;
    font-size: 35px;
    text-align: center;
    padding: 8px;
    margin: 0 auto;
    height: 57px;
    border:2px solid black;
}
#ptag{
	text-align: center;
	margin: 0px;
}
.frame{
	width: 900px;
    margin: 0 20px 0 20px;
   font-family: 'NotoSerifKR';
}
.text1st{
	line-height: 6px;
    margin: 70px 0 40px 41px;
}
.text2nd{
    margin: 36px 65px 10px;
    line-height: 5px;
}
.date{
	margin: 60px 0 68px 400px;
}
.sign{
	padding: 38px;
    height: 200px;
}
.signdiv{
	width: 49%;
    float: left
}
#stampId{
	margin-left: 34px;
    width: 87px;
    float: left;
}
.stamp .1st{
	width: 70%;
    float: left
}
.stamp .2nd{
	width: 30%;
    float: left
}
#signpad{
	width: 400px;
	height: 200px;
}

</style>
<script>
var ge = null; // 그래픽 에디터 객체를 가리키는 변수

function init() {
    var canvas = null; // 캔버스 DOM 객체를 가리키는 변수
    var context = null; // 캔버스에 그림을 그리는 도구 객체를 가리키는 변수

    canvas = document.getElementById("myCanvas");
    context = canvas.getContext("2d");

    ge = new GraphicEditor(canvas, context); // 그래픽 에디터 객체 생성
}

class GraphicEditor { // 캔버스에 그림 그리는 자바스크립트 클래스
    constructor(canvas, context) { // 생성자
        this.canvas = canvas;     // 프로퍼티 canvas 생성
        this.context = context; // 프로퍼티 context 생성
        this.startX = 0;    // 프로퍼티 startX 생성
        this.startY = 0;    // 프로퍼티 startY 생성
        this.drawing = false;    // 프로퍼티 drawing 생성

        // 선굵기와 색 초기화
        this.context.lineWidth = 2; // 선 굵기를 2로 설정
        this.context.strokeStyle = "blue";

        // 이벤트 리스너 등록
        this.canvas.onmousedown = function (e) { ge.down(e); }
        this.canvas.onmouseup = function (e) { ge.up(e); }
        this.canvas.onmousemove = function (e) { ge.move(e); }
        this.canvas.onmouseout = function (e) { ge.out(e); }

        // 이벤트 리스너가 canvas 객체에 달려 있기 때문에, 리스너가 실행되는 그 때
        // this는 canvas 객체를 가리키며, ge.down(e)를 this.down(e)로 한다면
        // 곧 canvas의 멤버 메소드 down(e)를 호출하는 것이 된다.
        // 하지만 canvas 객체에는 down(e) 메소드가 없기 때문에 
        // 실행 중에 오류가 발생한다.
        // 그러므로 전역 변수 ge를 두어, ge.down(e)를 호출하도록 하였음

    }

    draw(curX, curY) {//(startX, startY)에서 (curX, curY) 까지 선그리는 메소드
        this.context.beginPath();
        this.context.moveTo(this.startX, this.startY);
        this.context.lineTo(curX, curY);
        this.context.stroke();
    }

    down(e) { // 마우스 다운시 호출되는 메소드
        this.startX = e.offsetX; this.startY = e.offsetY;
        this.drawing = true;
    }

    up(e) { this.drawing = false; } // 마우스 업 시 호출되는 메소드

    move(e) { // 마우스를 움직이는 동안 계속 호출되는 메소드
        if(!this.drawing) return;
        var curX = e.offsetX, curY = e.offsetY;
        ge.draw(curX, curY);
        this.startX = curX; this.startY = curY;
    }

    out(e) { this.drawing = false; } // 마우스가 캔버스 바깥으로 나가는 순간 호출되는 메소드
}
</script>
</head>
<body>
<div class="frame" >
	<div class="header"><p id="ptag"><strong>표준 산학협력 협약서(안)</strong></p></div>
	
	<div class="content" >
		<div class="text1st">
			<p>&nbsp;&nbsp;&nbsp;이 협약서는 codemaker(이하 "갑"이라 한다)과 ○○회사(이하 "을"이라 한다)는 상호간의 협력에 관한 필요한 사항을</p>
			<p>정하고 이를 성실하게 준수할 것을 목적으로 하며 codemaker는 우수한 인재를 양성하며 기업에 지원하고 기업은 </p>
			<p>codemaker에 인재개발을 위하여 노력하여 상호 공동발전 및 우호증진을 위하여 다음과 같이 산학협력 협약을 체결한다.</p>
		</div>
		
		<div class="text2nd" >
			<p>1. "갑"은 "을"에게 수료예정자 및 수료자를 추천하고, 다양하고 폭넓은 취업 기회를 쌓을 수 있도록 최선의 기회를</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;제공한다.</p> 
		</div>
		<div class="text2nd" >
			<p>2. "을"은 "갑"의 구인 상황에 적극적으로 지원한다.</p>
		</div>
		<div class="text2nd" >
			<p>3. "갑"과 "을"은 우수 인재 양성을 위하여 상호간에 기술·장비 등 제한 여건의 협조 요청에 특별한 사유가 없는 한 </p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;성실히 협조한다.</p>
		</div>
		<div class="text2nd" >
			<p>4. "갑"과 "을"이 상호 신의성실 원칙에 따라 이 협약서를 준수하기 위한 노력을 하여야 하며, 상호간에 중대한 </p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;사항을 위반하거나, "갑"이 추천한 인재에 대하여 부당 행위를 한 경우 "갑"의 요청에 의해 이 협약을 </p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;취소할 수 있다.</p>
		</div>
		<div class="text2nd" >
			<p>5. 기타 이 협약서에 평가되지 아니한 사항에 대하여는 상호 협의하에 결정한다.</p>
		</div>
		<div class="text2nd" >
			<p>본 협약서는 2부를 작성하여 "갑", "을"이 기명날인한 후 각각 1부씩 보관한다.</p>
		</div>
		
		<div class="date">
		
					<jsp:useBean id="toDay" class="java.util.Date"/>
					<fmt:formatDate value="${toDay}" pattern="yyyy년 MM월dd일"/>
		</div>
		
		<div class="sign" >
				<div class="signdiv codeSign" >
					<div>
						<p>[갑] 학원명 :  codemaker</p>
					</div>
					
				</div>
				
				<div class="signdiv companySign" >
					<div class="stamp 1st">
					  <p>[을]  회사명 : ${companyVO.comNm}</p>
					  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주 소 : ${companyVO.comAdd}</p>
					  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대 표 : ${companyVO.comOwner}</p>
					</div>
					<div class="stamp 2nd">
					    <img id="stampId" src="/images/admin/company/stamp.png">
					</div>
				</div>
		</div>
	</div>
</div>

<div>
	<button>제출</button>
</div>


</body>
</html>

