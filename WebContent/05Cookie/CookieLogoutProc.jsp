<%@page import="util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	쿠키를 지울 때는 값을 빈 값으로, 유효시간은 0으로 만들어준다.
*/
	CookieUtil.makeCookie(request, response, "LoginId", "", 0);

	/*
		JSP코드와 JS코드가 같은 블럭내에 존재하면 JSP코드가 우선 실행된다.
	*/
	//response.sendRedirect("CookieLoginMain.jsp");
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="CookieLoginMain.jsp";
</script>
