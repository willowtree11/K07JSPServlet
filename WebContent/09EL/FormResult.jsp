<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL(JSP Standard Tag Library)을 사용하기 위한 선언문장 -->
<!-- http://java.sun.com/jstl/core 이거 아님 'jsp' 가 없음 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormResult</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>파라미터 값 받기</h2>
	<h3>JSP(자바코드)로 받기</h3>
	<ul>
		<li>이름: <%=request.getParameter("name") %></li>
		<li>성별: <%=request.getParameter("gender") %></li>
		<li>관심사: <%
					String[] inters=request.getParameterValues("inter");
					for(String s:inters){
						out.println(s+" ");
					} %></li>
		<li>학력: <%=request.getParameter("grade") %></li>
	</ul>
	<%--
		EL로 폼 값 받기
			:	text, radio와 같은 폼 값은 ${param.폼 이름}
				checkbox와 같은 다중 폼 값은 ${paramValues.폼 이름}
		또한 쿼리 스트링으로 전달되는 파라미터도 동일하게 받을 수 있다.
		웹 주소.html?nowPage=10 => ${param.nowPage}
	 --%>
	<h3>EL로 받기</h3>
	<ul>
		<li>이름: ${param.name }</li>
		<li>성별: ${param.gender }</li>
		<li>관심사항:
			<!-- forEach 배열에서 꺼내는 iterator같은 역할 -->
			<c:forEach items="${paramValues.inter }" var="s"> <!-- var가 배열에서 하나씩 꺼내오는 참조변수 -->
				${s }&nbsp;
			</c:forEach>
		</li>
		<li>학력: ${param.grade }</li>
	</ul>
</body>
</html>