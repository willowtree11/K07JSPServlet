<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImportPage</title>
</head>
<body>
	<h4>포함된 페이지(ImportPage.jsp)</h4>
	<hr />
	<h5>저장된 값(방법 1): ${requestVar }
	<br>저장된 값(방법 2): ${requestScope.requestVar }</h5>
	<h5>파라미터로 전달된 값</h5>
	파라미터 1: ${param.user_id }<br>
	파라미터 2: ${param.user_pw }<hr>
</body>
</html>