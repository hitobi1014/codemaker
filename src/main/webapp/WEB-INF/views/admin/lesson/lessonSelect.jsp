<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form name="lessonVO" commandName="lessonVO" id="le">
	<form:select path="lesId" cssClass="form-control" id="lesson">
		<form:option value="99">강의</form:option>
		<form:options items="${lessonList}" itemLabel="lesNm" itemValue="lesId" />
	</form:select>
</form:form>
