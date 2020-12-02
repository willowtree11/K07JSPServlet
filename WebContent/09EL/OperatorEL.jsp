<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OperatorEL</title>
</head>
<body>
	<h2>EL의 연산자들</h2>
	
	<h3>EL에서의 null 연산</h3>
	<%
		/*
			Java에서는 null과 연산을 수행할 수 없다.
			하지만 EL에서는 null을 0으로 간주하여 계산한다.
		*/
		//int a=null + 10; null과의 연산이므로 에러 발생
	%>
	
	\${null+10 }: ${null+10 }<br> <!-- 결과: 10 -->
	<!-- 
		최초 실행시에는 파라미터가 없으므로 0으로 간주되어 계산됨.
		만약
			해당페이지 ? myNumber=20 => 결과 30 출력
			해당페이지 ? myNumber=	=> 0으로 간주되어 10출력
			해당페이지 ? myNumber=Thirty => 문자는 숫자로 변경할 수 없어 에러 발생함
	 -->
	\${param.myNumber+10 }: ${param.myNumber+10 }<br><br>
	<!-- 
		null값과 비교연산에서는 false를 반환한다.
		산술연산에서는 0으로 간주하고 연산을 진행하지만
		비교연산은 null과의 비교가 불가하기 때문
	 -->
	\${param.myNumber>10 }: ${param.myNumber>10 }<br><br>
	\${param.myNumber<10 }: ${param.myNumber<10 }<br><br>
	
	<h3>JSTL로 EL에서 사용할 변수선언</h3>
	<%
		/*
			EL에서는 JSP에서 선언한 변수는 직접 사용할 수 없다. 
			값이 출력되지 않고 null로 인식하게 된다.
			JSP에서 변수를 EL에 사용할 수 없는 이유는 
			EL은 4가지 영역에 저장된 속성들만 사용하기 때문이다. 
			JSTL도 동일한 특성을 가지고 있다.
		*/
		
		String varScriptLet="스크립트렛 안에서 변수 선언";
	%>
	<!-- null로 인식되어 결과는 100이 출력된다. -->
	\${varScriptLet+100 }: ${varScriptLet+100 } <br>
	
	<!-- 
		JSP에서 선언한 변수를 EL에서 사용해야 할 경우에는
		JSTL의 set태그를 이용해서 변수를 선언한다.
		JSP에서 선언 후 바로 사용하려면 영역에 저장해야 한다.
	 -->
	<c:set var="elVar" value="<%=varScriptLet %>"/>
	\${elVar }:${elVar }
	
	<!-- 
		Tomcat8.0부터는 EL에서 변수할당이 가능해졌다.
		하지만 개발시에는 실제 서비스 할 웹서버의 버전을 확인한 후
		사용여부를 결정해야 한다.
		EL은 전통적으로 값을 표현(출력) 하는 용도로 사용되어졌으므로
		표현용으로만 사용하는 것이 좋다.
	 -->
	<h3>EL변수에 값 할당</h3>
	<c:set var="fnum" value="9"/>
	<c:set var="snum" value="5"/>
	\${fnum=99 }: ${fnum=99 } <!-- 99로 재할당되어 99가 출력됨 -->
	
	<h3>EL의 산술연산자</h3>
	<!-- 
		EL에서는 정수와 정수를 연산하더라도 실수의 결과가 나올 수 있다.
		즉 자동형변환 되어 출력된다.
		나눗셈을 위한 /연산자 대신 div, 
		나머지를 구하는 %대신 mod를 사용할 수 있다.
	 -->
	<ul>
		<li>\${fnum+snum }: ${fnum+snum }</li>
		<li>\${fnum/snum }: ${fnum/snum }</li>
		<li>\${fnum div snum }: ${fnum div snum }</li>
		
		<li>\${fnum%snum }: ${fnum%snum }</li>
		<li>\${fnum mod snum }: ${fnum mod snum }</li>
		
		<!-- 
			EL에서는 +연산자를 덧셈의 용도로만 사용한다.
			문자열을 연결하기 위한 용도로는 사용할 수 없다.
			아래 문장중 "100"은 자동으로 숫자로 변경된 후 연산된다.
			그 외에는 NumberFormatException 발생
		 -->
		<li>\${"100"+100 } : ${"100"+100 }</li>
		<li>\${"Hello~"+"EL~" } : \${"Hello!"+"EL~" }</li>
		<li>\${"일"+2 } : \${"일"+2 }</li>
	</ul>
	
	<h3>EL의 비교연산자</h3>
	<!-- 
		EL에서는 비교연산자를 이용한 비교시 변수의 값을 모두 문자열로 인식
		String 클래스의 compareTo()와 같은 방식으로 비교
		즉, 첫번째 문자부터 하나씩 비교해나간다.
		단 실제 숫자의 비교시에는 일반적인 숫자비교가 이루어진다.
		
		변수에 저장할때 영역에 저장되므로 object 영역.. 
	 	문자열의 비교처럼 comepareTo로 하게됨
	 	fnum 변수에 저장된 100은 아스키코드로 해석하지만 숫자 100은 숫자로 인식
		아스키코드의 순서를 비교하는 compareTo 처럼 해석하므로 결과가 조금 다를 수 있다
		100<90 이 되는건 1의 아스키코드가 9의 아스키코드보다 전에 있으므로
	 -->
	<c:set var="fnum" value="100"/>
	<c:set var="snum" value="90"/>
	<ul>
		<!-- 
			fnum과 snum은 영역에 저장된 데이터이므로 
			Object형으로 저장된다. 따라서 비교시 객체상태에서 비교가 이루어지게 된다.
			100과 90은 실제 숫자로 비교가 이루어진다.
		 -->
		<li>\${fnum > snum }: ${fnum > snum }</li> <!-- 결과 : false -->
		<li>\${100 > 90 }:${100 > 90 }</li> <!-- 결과 : false -->
		
		<!-- 
			Java에서는 문자열을 비교할 때 equals()로 비교하지만
			EL에서는 ==의 형태로 비교한다.
		 -->
		<li>\${"JAVA"=='JAVA'}: ${"JAVA"=='JAVA' }</li>
		<li>\${'Java'=="JAVA"}: ${'Java'=="JAVA" }</li>
	</ul>
	<!-- 
		> : gt(Greater Then)
		>= : ge(Greater then Equal)
		< : lt(Less Then)
		<= : le(Less then Equal)
		== : eq(EQual)
		!= : ne(Not Equal)
		&& : And
		|| : Or
	 -->
	<h3>EL의 논리연산자</h3>
	<ul>
		<li>\${5>=5 && 10!=10 } : <!-- 참 && 거짓 => 거짓 -->
				${5 ge 5 and 10 ne 10 }</li>
		<li>\${5>6 || 10<100 } : <!-- 거짓 || 참 => 참 -->
				${5 gt 6 or 10 lt 100 }</li>
	</ul>
	
	<h3>EL의 삼항연산자</h3>
	\${10 gt 9 ? "참" : "거짓" }: ${10 gt 9 ? "참" : "거짓" }
	
	<!-- 
		empty연산자
		: 	null이거나 ""(빈 문자열) 일 때 
			배열인 경우 길이가 0일 때
			컬렉션인 경우 size가 0일 때
			
			-> true를 반환하는 연산자
	 -->
	<h3>EL의 empty연산자 : null일 때 true를 반환하는 연산자</h3>
	<%
		String nullStr=null;
		String emptyStr="";
		Integer[] lengthZero=new Integer[0];
		Collection sizeZero=new Vector();
	%>
	<c:set var="elnullStr" value="<%=nullStr %>" />
	<c:set var="elemptyStr" value="<%=emptyStr %>" />
	<c:set var="ellengthZero" value="<%=lengthZero %>" />
	<c:set var="elsizeZero" value="<%=sizeZero %>" />
	
	<ul>
		<li>\${empty elnullStr}: ${empty elnullStr }</li>
		<li>\${not empty elemptyStr }: ${not empty elemptyStr }</li>
		<li>${empty ellengthZero ? "배열 크기가 0" : "배열 크기 0 아님" }</li>
		<li>${not empty slsizeZero ? "컬렉션에 저장된 객체 있음" : "컬렉션에 저장된 객체 없음" }</li>
	</ul>
</body>
</html>