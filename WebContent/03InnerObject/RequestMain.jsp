<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestInfo.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>전송방식(Post, Get) 테스트</h2>
	<!-- 
		Get방식에는 3가지 전송방식이 있다.
		1. <a href='' 를 사용하는 방법
		2. JS의 location.href='' 를 사용하는 방법
		3. <form method='get' 을 사용하는 방법
	 -->
	<h3>Get방식 전송</h3>
	<a href="RequestInfo.jsp?paramNum=123&paramEng=Hello&paramHan=안녕">Get방식</a>
	
	<h3>Post방식 전송</h3>
	<form action="RequestInfo.jsp" method="post">
		문자열 입력: <input type="text" name="paramHan" />
		<input type="submit" value="Post방식" />
		<!-- 포스트방식은 QueryString 값이 null -->
	</form>
	
	<h2>파라미터 및 값 전달</h2>
	<!-- 
		한글을 전송하는 경우 서버 환경에 따라 깨질 수 있으므로 인코딩 후 전달하는 것이 안전하다.
	 -->
	<%
		String encodeName = URLEncoder.encode("홍길동", "UTF-8");
	%>
	<a href="RequestParameter.jsp?name=<%=encodeName%>
	&id=hong&gender=man&favorite=&self_intro=">Get방식</a>
	<br />
	<br />
	<script>
		function checkForm(f){
			if(f.id.value==""){
				alert("아이디를 입력해주세요");
				f.id.focus();
				return false;
			}
		}
	</script>
	<form method="post" name="regFrm" action="RequestParameter.jsp" onsubmit="return checkForm(this);">
		이름: <input type="text" name="name" value="홍길동" /> <br />
		아이디: <input type="text" name="id" value="" /><br />
		관심사:
		<input type="checkbox" name="favorite"
			value="sport" checked="checked"/>스포츠
		<input type="checkbox" name="favorite"
			value="economic"/>경제
		<input type="checkbox" name="favorite"
			value="politics"/>정치<br />
		성별:
		<input type="radio" name="gender"
			value="man" />남자
		<input type="radio" name="gender"
			value="woman" checked="checked"/>여자<br>
		자기소개:
		<!-- 
			textarea는 태그와 태그사이에 컨텐츠가 들어가므로
			정렬을 위해 줄바꿈을 사용하게 되면 필요없는 공백이 포함됨
		 -->
		<textarea name="" id="" cols="30" 
		rows="10">textarea는 태그와 태그사이에 컨텐츠가 들어가므로 정렬을 위해 줄바꿈을 사용하게 되면 필요없는 공백이 포함됨</textarea>
		<br />
		<input type="submit" value="POST방식" />
	</form>
</body>
</html>