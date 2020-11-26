<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	포워드된 페이지나 인클루드 된 페이지로 파라미터를 전달하는 경우
	한글이 포함되어 있다면, 반드시 포워드 시키는 최초 페이지에서
	인코딩을 설정setCharacterEncoding("UTF-8")해야 한다.
*/
	request.setCharacterEncoding("UTF-8");
	request.setAttribute("member", new MemberDTO("Sung", "9999", "성춘향", null));
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamAction</title>
</head>
<body>
	<h2>인클루드 되는 페이지로 파라미터 전달하기</h2>
	
	<!-- 
		아래와 같이 설정하면 쿼리스트링 형태로 파라미터가 전송된다.
		(액션 태그 사이에 주석은 사용할 수 없다. 에러발생)
	 -->
	<jsp:include page="ParamActionIncludeResult.jsp">
			<jsp:param value="이몽룡" name="name"/>
			<jsp:param value="Lee" name="id"/>
	</jsp:include>
	<%
		/*
			http://localhost:9999/K07JSPServlet/07ActionTag/ParamAction.jsp?query=4%EC%8B%9C40%EB%B6%84
			'=' 이후에 아무 글자나 한글로 적으면 querystring부분에 적혀나옴
		*/
		String pageURL="ParamActionForwardResult.jsp?query=반갑습니다";
		String paramValue="KOSMO";
		
		request.setAttribute("member", new MemberDTO("Lee", "7777", "이몽룡", null));
	%>
	
	<jsp:forward page="<%=pageURL %>">
		<jsp:param value="한국소프트웨어인재개발원" name="name"/>
		<jsp:param value="<%=paramValue %>" name="id"/>
	</jsp:forward>
	 
</body>
</html>