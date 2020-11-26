<%@page import="util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트가 전송한 폼값을 받아온다
	String userid=request.getParameter("user_id");
	String userpw=request.getParameter("user_pw");
	String id_save=request.getParameter("id_save");
	/*
		checkbox의 경우 여러 항목이 존재할 수 있으므로
		getParameterValues()를 통해 배열로 받는것이 기본이나,
		항목이 하나만 있는 경우에는 아래와 같이 처리 가능하다.
	*/
	if("kosmo".equals(userid) && "1234".equals(userpw)){
		//JDBC 연동 없이 회원정보가 위와 같으면 로그인 성공
		CookieUtil.makeCookie(request, response,"LoginId", "kosmo", 60*60*24);
		//아이디 저장하기 체크박스를
		if(id_save==null){
			//체크 해제하면 쿠키를 삭제한다
			CookieUtil.makeCookie(request, response,"SaveId", "", 0);
		}
		else{
			//체크하면 쿠키를 생성한다
			CookieUtil.makeCookie(request, response,"SaveId", "kosmo", 60*60*24);
		}
		response.sendRedirect("CookieLoginMain.jsp");
	}
	/*
		로그인 실패시에는 에러메시지를 리퀘스트 영역에 저장한 후
		메인 페이지로 포워드(페이지 전달)한다. 포워드 된 페이지까지
		리퀘스트 영역이 공유되므로 해당 메시지는 화면에 출력할 수 있다.
	*/
	else{
		request.setAttribute("ERROR_MSG", "회원이 아닙니다");
		request.getRequestDispatcher("CookieLoginMain.jsp").forward(request, response);
	}
%>