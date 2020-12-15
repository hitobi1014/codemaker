<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
var canvas = document.getElementById('canvas'); 
var ctx = canvas.getContext('2d'); 
ctx.fillStyle = 'green'; 
ctx.fillRect(10, 10, 100, 100);

</script>
</head>
<body>

<canvas id="canvas" width="300" height="300">
  캔버스의 내용을 설명하는 대체 텍스트
</canvas>


</body>
</html>