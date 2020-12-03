<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- summernote -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
<script>
$(function(){
	$('#summernote').summernote({
		placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        width: 700,
		toolbar: [
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['view', ['fullscreen', 'codeview', 'help']]
		]
	});
})

</script>
<style>
#d1{
 	background-color: snow;
}
</style>
<title>note Insert</title>
</head>
<body>
<div id="d1">
	<form method="post" action="/note/insertNote">
		<input type="text" value="test하는중" name="noteTitle"> 
		<textarea id="summernote" name="noteCont"></textarea>
		<input type="submit" value="등록">
	</form>
</div>
</body>
</html>