<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamActionForwardResult</title>
</head>
<body>
	<h2>포워드 된 페이지</h2>
	<h3>파라미터로 전달된 데이터</h3>
	<ol>
		<li>query: <%=request.getParameter("query") %></li>
		<li>name: <%=request.getParameter("name") %></li>
		<li>id: <%=request.getParameter("id") %></li>
	</ol>
	<h3>영역에 저장되어 전달된 객체</h3>
	<%=request.getAttribute("member") %>
</body>
</html>