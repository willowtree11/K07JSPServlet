<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 값 받기
	String id=request.getParameter("user_id");
	String pw=request.getParameter("user_pw");
	
	//web.xml에 저장된 컨텍스트 초기화  파라미터 가져옴
	String drv=application.getInitParameter("JDBCDriver");
	String url=application.getInitParameter("ConnectionURL");
	
	//DAO객체 생성 및 DB연결
	MemberDAO dao=new MemberDAO(drv, url);
	
	//1. Map컬렉션에 저장된 회원정보를 통해 세션영역에 저장
	Map<String, String> memberMap=dao.getMemberMap(id, pw); 
	if(memberMap.get("id")!=null){
		//2. 로그인 성송 시 세션영역에 아래 속성을 저장한다.(입력시 받은게 아니라 DTO에 저장된 정보를 불러옴)
		session.setAttribute("USER_ID", memberMap.get("id"));
		session.setAttribute("USER_PW", memberMap.get("pass"));
		session.setAttribute("USER_NAME", memberMap.get("name"));
		
		//로그인 페이지로 이동
		response.sendRedirect("Login.jsp");
	}
	else{
		//로그인 실패시 리퀘스트 영역에 속성을 저장 후 로그인 페이지로 포워드
		request.setAttribute("ERROR_MSG", "아이디가 없습니다. 가입이 필요합니다.");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>