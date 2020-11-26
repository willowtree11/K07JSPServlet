<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeAction</title>
</head>
<body>
	<%
		//인클루드 할 페이지의 경로를 String으로 지정
		String directivePath="./include/DirectivePage.jsp";
		String actionTagPath="./include/ActionTagPage.jsp";
		
		//페이지 영역, 리퀘스트 영역에 속성을 저장(setAttribute는 속성을 적용 하는 개념)
		pageContext.setAttribute("pageVar", "페이지 영역에 저장");
		request.setAttribute("requestVar", "리퀘스트 영역에 저장");
	%>
	
	<h2>include 액션태그</h2>
	
	<!-- 
		지시어(디렉티브)를 통한 include는 표현식을 사용할 수 없다.
		반드시 문자열로 기술해야 한다.
	 -->
	<h3>include 지시어로 페이지 포함하기</h3>	
	<%-- <%@include file="<%=directivePath%> --%>
	<%@ include file="./include/DirectivePage.jsp" %>
	
	<h3>include 액션태그로 페이지 포함하기</h3>	
	<jsp:include page="<%=actionTagPath %>" />
	<jsp:include page="./include/ActionTagPage.jsp" />
	
	<!-- 
		include 지시어와 액션태그의 차이점
		지시어
			-JSP소스를 그대로 포함시킨 후 페이지를 실행(컴파일)한다.
			-즉, 현재 페이지와 같은 페이지를 의미한다.
		액션태그
			-JSP소스를 먼저 실행한 후 실행된 결과를 포함시킨다.
			-따라서 기존페이지에서 선언된 변수는 포함시킨 페이지에서 사용할 수 없다.
			-다른 페이지를 의미하므로 page영역은 공유되지 않는다.
			-하지만 forward와 같은 request영역은 공유된다.
	 -->
	<h2>각각의 포함된 페이지 안에서 선언한 변수 사용하기</h2>
	
	<h3>디렉티브 페이지에서 선언한 변수 사용</h3>
	변수 출력: <%=dirString %>

	<h3>액션태그 페이지에서 선언한 변수 사용</h3>
	변수 출력: <%--=actionString --%>
</body>
</html>