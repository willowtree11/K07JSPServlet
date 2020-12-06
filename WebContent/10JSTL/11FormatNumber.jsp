<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL의 국제화 라이브러리를 사용하기 위한 지시어 선언 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11FormatNumber</title>
</head>
<body>
	<h2>formatNumber 태그</h2>
	<c:set var="money" value="10000" />
	
	<h3>EL로 출력</h3>
	money : ${money } -> 10000
	
	<h3>JSTL 국제화 태그로 출력</h3>
	<!-- groupingUsed 의 디폴트값이 true이므로 콤마 출력 -->
	money : <fmt:formatNumber value="${money }"/> -> 10,000
	
	<!-- 콤마 생략 원할 시 groupingUsed=false -->
	<h3>JSTL 국제화 태그로 출력 - 천 단위 콤마 생략</h3>
	money : <fmt:formatNumber groupingUsed="false" value="${money }"/>
	
	<h3>type="currency" 이고 currencySymbol 생략 시 - 현재 통화단위로 출력</h3>
	money : <fmt:formatNumber value="${money }" type="currency" currencySymbol="$"/>
	
	<!-- value 속성 값으로 전달되는 값을 %단위로 변환하여 출력 -->
	<h3>type="percent"</h3>
	money : <fmt:formatNumber value="0.02" type="percent"/>
	
	<h3>var속성: 원하는 위치에 출력하고 싶을 때</h3>
	money : <fmt:formatNumber value="${money }" type="currency" var="price"/>
	가격이 <strike>15,000원</strike> -> <span style="font-size:1.5em;">${price }</span>로 인하!
	
	<h2>자바코드로 1000단위 콤마 표시하기</h2>
	<%
		String moneyStr=pageContext.getAttribute("money").toString();
		int money=Integer.parseInt(moneyStr);
		/*
			NumberFormat클래스는 싱글턴 패턴으로 제작된 클래스로
			new 연산자를 통해 객체를 생성할 수 없는 대표적인 클래스이다
			getInstance()를 통해 이미 생성된 static 형태의 객체를
			반환받아 사용하게 된다.
		*/
		NumberFormat nf=NumberFormat.getInstance();
		
		out.println("<h3>천 단위 콤마 찍기 전</h3>");
		out.println(money);
		
		out.println("<h3>천 단위 콤마 찍은 후</h3>");
		String commaMoney=nf.format(money);
		out.println(commaMoney);
		
		//현지 통화 기호 얻기
		Currency currency = nf.getCurrency();
		String currencySymbol=currency.getSymbol();
		out.println("<h3>통화 기호 추가</h3>");
		out.println(currencySymbol+commaMoney);
	%>
</body>
</html>