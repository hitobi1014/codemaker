<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>  	
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
#imglogo{width: 200px;}
#imgicon{width: 40px; height:40px; }
.imgMain{width: 250px;height: 300px;}
#at{color: #2c2e2e;}
</style>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/user/main/layout/commonLib.jsp"%>
</head>
<<<<<<< HEAD

=======
<%@ include file="/WEB-INF/views/user/main/layout/commonLib.jsp"%>
>>>>>>> 875041c1c61f9fe9e34e102181a9737aa127715b
<body id="page-top">
	<div id="wrapper">
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:choose>
					<c:when test="${MEMBER_INFO !=null}">
						<tiles:insertAttribute name="loginHeader" />
					</c:when>
					<c:otherwise>
						<tiles:insertAttribute name="header" />
					</c:otherwise>
				</c:choose>
				<tiles:insertAttribute name="content"/>
			</div>
		</div>
	</div>
 <tiles:insertAttribute name="footer"/>

</body>
</html>