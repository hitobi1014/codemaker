<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>  	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="/WEB-INF/views/teacher/layout/main_commonLib.jsp" %>
</head>
<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
	<div class="mobile-sticky-body-overlay"></div>
	<div class="wrapper">
		<tiles:insertAttribute name="left"/>
		<div class="page-wrapper">
			<tiles:insertAttribute name="header"/>
			<div class="content-wrapper" style="background-color: #f7f4ef;">
				<div class="content">
					<tiles:insertAttribute name="content"/>
				</div> <!-- content -->
			</div> <!-- content-wrapper -->
		</div> <!-- page-wrapper -->
	</div> <!-- wrapper -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>