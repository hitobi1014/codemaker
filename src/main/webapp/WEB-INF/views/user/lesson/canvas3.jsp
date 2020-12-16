<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>마우스 드래깅으로 캔버스에 그림 그리기</title>
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
<body onload="init()">
<h3>마우스를 누른 채 드래깅하여 그림 그려 보세요</h3>
<hr>
<canvas id="myCanvas" style="background-color:aliceblue" width="400" height="300">
</canvas>

</body>
</html>