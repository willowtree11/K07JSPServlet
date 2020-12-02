<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>객체를 파라미터로 전달하기</h2>
	<%
		request.setAttribute("dtoObj", new MemberDTO("KOSMO", "1234", "코스모", null));
		request.setAttribute("strObj", "문자열 객체");
		request.setAttribute("integerObj", new Integer(100));
	%>
	<!-- 
		결과페이지로 액션태그를 통해 포워드 처리. 이 때 파라미터도 같이 전달됨.
	 -->
	<jsp:forward page="ObjectResult.jsp">
		<jsp:param value="200" name="firstNum"/></jsp:param>
		<jsp:param value="300" name="secondNum"/>
	</jsp:forward>
</body>
</html>