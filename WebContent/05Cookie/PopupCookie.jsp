<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//체크박스를 통해 전송된 폼값을 받음
	String chkVal=request.getParameter("isToday");
	//체크된 값이 있는 경우 쿠키를 생성
	if(chkVal!=null && chkVal.equals("1")){
		Cookie cookie = new Cookie("PopupClose", "off");
		cookie.setPath(request.getContextPath());//경로설정
		cookie.setMaxAge(60*60*24); //유효시간으로 하루(86400 s)를 설정한다.
		response.addCookie(cookie);
		System.out.println("하루동안 열지 않음"); //로그에서 확인
		out.println("하루동안 열지 않음"); //웹브라우저에서 확인
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>