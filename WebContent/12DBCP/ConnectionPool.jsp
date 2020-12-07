<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connection Pool</title>
</head>
<body>
<%
/*
	JNDI(Java Naming and Directory Interface)
		: 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서
		참고(lookup)하는 API로, 쉽게 말해 외부에 있는 객체를
		이름으로 찾아오기 위한 기술이다.

	DBCP(DataBase Connction Pool)
		: DB와 연결된 커넥션 객체를 미리 만들어 Pool에 저장해 두었다가
		필요할 때 가져다 쓰고 반납하는 기법을 말한다. DB의 부하를 줄이고
		자원을 효율적으로 관리할 수 있다. 게임에서는 풀링시스템(Pooling System)
		이라는 용어로 사용한다.
*/

/*
	커넥션 풀을 사용하기 위한 절차
	1. InitialContext객체를 생성한다.
*/
	Context initctx = new InitialContext();
/*
	2. 위의 객체를 통해 JNDI서비스 구조의 초기 ROOT디렉토리를 얻어온다.
	여기서 얻어오는 톰캣의 루트 디렉토리명은 java:comp/env로
	이미 정해져 있으므로 그대로 사용하기만 하면 된다.
*/
	Context ctx = (Context)initctx.lookup("java:comp/env"); 
/*
	3. server.xml에 등록한 네이밍을 lookup하여 DataSource를 얻어온다.
	해당 데이터 소스는 DB에 연결된 정보를 가지고 있다.
*/
	DataSource source = (DataSource)ctx.lookup("jdbc/myoracle"); 
//4. 커넥션 풀에 톰캣이 생성해놓은 커넥션 객체를 가져다가 사용한다.	
	Connection conn = source.getConnection();
	
	if(conn!=null){
		out.println("<h2>DBCD 연결 성공</h2>");
	}
	else{
		out.println("<h2>DBCD 연결 실패</h2>");
	}
//5. DB작업이 완료된 후에는 Pool에 다시 객체를 반납한다.
conn.close();
%>
</body>
</html>