<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//폼값 받기
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	//DTO객체(bean) 생성
	MemberDTO member1 = new MemberDTO();
	//setter()메소드를 통해 값 설정
	member1.setId(id);
	member1.setPass(pass);
	member1.setName(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormResult</title>
</head>
<body>
	<h2>useBean 액션태그로 폼의 하위 요소값 받기</h2>
	<h3>자바 코드를 통해 받기</h3>
	<ul>
		<li><%=member1.getId() %></li>
		<li><%=member1.getPass() %></li>
		<li><%=member1.getName() %></li>
	</ul>
	
	<!-- 
		useBean을 통해 객체생성시 scope속성을 지정하지 않으면
		 가장 작은 영역(Page)에 저장됨.
		 자바 빈을 생성한 후 전송된 폼 값을 한번에 설정한다.
		 폼의 name속성과 1:1로 매칭되는 DTO의 멤버변수들이
		 있기 때문에 이와같은 작업이 가능하게 된다.
	 -->
	<h3>액션태그로 폼 값 받기</h3>
	<jsp:useBean id="actionMember" class="model.MemberDTO"/> <!-- scope를 지정하지 않으면 가장 작은 영역(Page)에 저장됨 -->
	<jsp:setProperty property="*" name="actionMember"/>
	<ul>
		<li><%=member1.getId() %></li>
		<li><%=member1.getPass() %></li>
		<li><%=member1.getName() %></li>
		
	</ul>
	
</body>
</html>