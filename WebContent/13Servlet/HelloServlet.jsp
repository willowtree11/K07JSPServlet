<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿만들기</title>
</head>
<body>
<!-- 서블릿 경로란 컨택스트루트 제외 슬래시로 시작하는 경로 의미 -->
<!-- 
	서블릿 작성순서
	1. 서블릿을 호출하기 위한 요청명을 제일 먼저 결정
	아래 경로는 상대경로이므로 컨텍스트 루트를 신경 쓸 필요가 없다.
	2. web.xml에서 서블릿 매핑을 진행한다.
	3. 요청을 처리할 서블릿을 제작한다.
	
 -->
	<h2>서블릿 만들기</h2>
	<h3>First Servlet</h3>
<!-- 
	상대경로의 경우 컨텍스트 루트와는 상관 없이 현재경로 하위의 요청명을 기술하면 되고
	절대경로의 경우 컨텍스트 루트부터 전체경로를 기술해야한다.
 -->
	<a href="./NoJSPServlet.do">
		JSP파일 없이 화면에 결과 출력하기(Servlet에서 바로 출력) - 상대경로
	</a>
	<br />
	<a href="http://localhost:9999/K07JSPServlet/13Servlet/NoJSPServlet.do">절대경로인 경우 컨텍스트루트 포함 전부(JSP파일 없이 화면에 결과 출력하기)</a>
	
	<h3>HelloServlet</h3>
	<h4>${message }-${HELLO }</h4>
	<h4><%=request.getAttribute("Message") %></h4>
	<a href="HelloServlet.do">JSP파일(View)에서 화면 출력하기</a>
	<!-- 요청된 리소스 [/K07JSPServlet/13Servlet/HelloServlet.do]은(는) 가용하지 않습니다. -> 매핑안됐다는 뜻 -->
	
	<h3>@WebServlet 어노테이션으로 서블릿 매핑하기</h3>
	<a href="../13Servlet/AnnoWebServlet.do">AnnoWebServlet.do 바로가기</a>
	
	<h3>서블릿으로 간단한 사칙연산 계산기 만들기</h3>
	<form method="get" action="<%=request.getContextPath()%>/Servlet/Calculate.kosmo">
		<input type="text" name="firstNum" size="5" />
		<select name="operator">
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>			
		</select>
		<input type="text" name="secondNum" size="5" />
		<input type="submit" value="연산결과는?" />
		<h4 style="color:red; font-size:1.5em;">
			${calResult }
		</h4>
	</form>
</body>
</html>