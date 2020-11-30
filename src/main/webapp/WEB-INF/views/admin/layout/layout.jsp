<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>  	
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/admin/layout/commonLib.jsp" %>

</head>
<%@ include file="/WEB-INF/views/admin/layout/commonLib.jsp" %>

<body id="page-header">
	<div id="wrapper">
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:choose>
					<c:when test="">
						<tiles:insertAttribute name="header"/>
					</c:when>
					<c:otherwise>
						<tiles:insertAttribute name="nav"/>
					</c:otherwise>
				</c:choose>
				<tiles:insertAttribute name="content"/>
			</div>
		</div>
	</div>
	<tiles:insertAttribute name="footer"/>
</body>
</html>