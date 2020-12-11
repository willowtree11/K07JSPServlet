<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MailForm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<table border=1>
		<tr>
			<td>제목</td>
			<td>아무제목</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>아무내용</td>
		</tr>
		<tr>
			<td>이미지</td>
		<!-- 
			내 서버가 아닌 다른 서버에 전송하는 경우 
			상대경로가 아닌 절대경로 기재 필요
		 -->
			<td><img src="http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg" alt="KOSMO_logo" /></td>
		</tr>
	</table>
</body>
</html>