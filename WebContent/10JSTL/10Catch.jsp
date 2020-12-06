<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Catch</title>
</head>
<body>
	<h2>catch 태그</h2>
	<c:set var="fnum" value="100" />
	<c:set var="snum" value="0" />
	
	<h3>에러가 안나는 경우: 에러 내용이 저장되지 않음</h3>
	<!-- 
		아래의 경우는 0으로 나눠서 계산식 자체에는 문제가 있지만
		EL에서 에러가 발생하지는 않기 때문에 
		변수에 에러내용이 저장되지 않는다.
		오류 없이 infinity로 출력된다.
	 -->
	<h4>catch태그 밖에서 실행</h4>
	fnum / snum : ${fnum/snum }
	<br />
	<h4>catch태그 안에서 실행</h4>
	<c:catch var="errorMessage">
		fnum / snum :  ${fnum/snum }
	</c:catch>
	에러내용: ${errorMessage }
	
	<h3>에러가 나는 경우: 원하는 위치에 에러 내용 표시</h3>
	<!-- 
		아래 문장처럼 에러가 발생되는 경우에는 페이지에서 실행할 수 없다.
		이 경우 500에러가 발생하게 되고, var속성에 지정한 변수에
		에러 내용이 저장된다.
	 -->
	<c:catch var="errorMessage">
		${"백"+100 }
	</c:catch>	
	에러내용: ${errorMessage }
	
</body>
</html>