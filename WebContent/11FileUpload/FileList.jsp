<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//업로드 폴더의 물리적 경로 가져오기
	String saveDirectory=application.getRealPath("/Upload");
	//경로를 기반으로 File객체 생성
	File file=new File(saveDirectory);
	//listFiles ~~ 설명확인
	File[] fileList=file.listFiles();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList</title>
</head>
<body>
	<h2>업로드 된 파일 리스트 보기(디렉토리 읽어오기)</h2>
	<ul>
	<%
		int fileCnt=1;
		//위에서 얻어온 파일 목록을 기반으로 반복 출력
		for(File f:fileList){
	%>
			<li>
				파일명: <%=f.getName() %>
				&nbsp;&nbsp;
				파일크기: <%=(int)Math.ceil(f.length()/1024.0) %>kb
				&nbsp;&nbsp;
				<a href="Download1.jsp?fileName=<%=URLEncoder.encode(f.getName(), "UTF-8")%>">[다운로드 1-1]</a>
			</li>
	<%
		fileCnt++;
		}
	%>
	</ul>
</body>
</html>