<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
#imglogo {
	width: 200px;
}

#imgicon {
	width: 40px;
	height: 40px;
}

.imgMain {
	width: 250px;
	height: 300px;
}

#at {
	color: #2c2e2e;
}

#navicon {
	width: 40px;
	height: 40px;
}

#usericon {
	width: 100px;
	height: 100px;
}
</style>


<head>


<%@ include file="/WEB-INF/views/user/mypage/layout/commonLib.jsp"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- main(css)-->
<link href="/vendor/user/main/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
	<div id="wrapper">
		<tiles:insertAttribute name="left" />
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<tiles:insertAttribute name="header" />
				<tiles:insertAttribute name="content" />
			</div>
		</div>
	</div>
	<tiles:insertAttribute name="footer" />

</body>
 <%@ include file="/WEB-INF/views/user/mypage/layout/commonLib_2.jsp"%>
<!-- Bootstrap core JavaScript-->
<script src="/vendor/user/main/jquery/jquery.min.js"></script>
<script src="/vendor/user/main/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/user/main/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/user/main/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/vendor/user/main/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/js/user/main/demo/chart-area-demo.js"></script>
<script src="/js/user/main/demo/chart-pie-demo.js"></script>
</html>