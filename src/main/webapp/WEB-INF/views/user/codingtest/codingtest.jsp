<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/user/main/codingtest.css" rel="stylesheet">
<h1>코딩테스트 화면</h1>
<div class="main-box">
	<div class="coding-box">
		<textarea id="code" rows="15" cols="120">
			import java.util.*;
			import java.lang.*;
			
			class Rextester
			{  
			    public static void main(String args[])
			    {
			        System.out.println("Hello, World!");
			    }
			}    
		</textarea>
		<button id="run">Run</button>
	</div>
	<div style="margin-top: 26px;">
		<h3>결과</h3>
	<div id="result"></div>
	</div>
 
</div>
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
 <script>
 $(document).ready(function(){
     $("button").click(function(){

   var to_compile = {
    "LanguageChoice": "4",
    "Program": $("#code").val(),
    "Input": "",
    "CompilerArgs" : ""
   };

   $.ajax ({
        url: "https://rextester.com/rundotnet/api",
        type: "POST",
        data: to_compile
    }).done(function(data) {
    	$("#result").text(data.Result);
    	var json = JSON.stringify(data);
    	console.log(JSON.stringify(data));
    	console.log("성공");
//         alert(JSON.stringify(data));
    }).fail(function(data, err) {
    	console.log("실패");
        alert("fail " + JSON.stringify(data) + " " + JSON.stringify(err));
       });
  });
 });
 </script>

