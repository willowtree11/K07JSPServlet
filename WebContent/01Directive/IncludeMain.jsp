<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 지시어: 공통으로 사용할 jsp파일을 생성한 후
				    현재 문서에 포함시킬 때 사용한다. 각각의 jsp파일 상단에는
				    반드시 page지시어가 삽입되어야 한다.
				    단, 하나의  jsp파일에서는 page지시어가 중복선언되면 안된다.
				    
 --%>
<%@ include file="IncludePage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 
	CSS코드는 양이 많으므로 외부파일로 선언하여 현재 문서에 링크시킨다.
 -->
<link rel="stylesheet" href="./css/div_layout.css">
</head>
<body>
	<div class="AllWrap">
		<div class="header">
			<!-- GNB영역(Global Navigation Bar, 공통메뉴) -->
			<%@ include file="../common/Top.jsp" %>
		</div>
		<div class="body">
			<div class="left_menu">
				<!-- LNB영역(Local Navigation Bar), 로컬메뉴 -->
				<%@ include file="../common/Left.jsp" %>
			</div>
			<div class="contents">
				<!-- Contents -->
				<!-- 
					해당 변수는 외부파일에 선언하여 본 문서에 include처리 되었다.
					include는 문서자체를 포함시키는 개념이므로 에러가 발생하지 않는다.
				 -->
				<h2>오늘의 날짜: <%=todayStr %></h2>
				<br /><br />
				2019년 12월31일. 44년 차 기자인 도널드 맥닐은 감염병 모니터링 사이트 프로메드(ProMED) 화면을 한참 동안 들여다보았다. 도널드 맥닐은 〈뉴욕타임스〉의 노련한 과학 기자다. 1976년 입사 후 다양한 부서와 여러 나라의 특파원을 거쳤다. 2002년부터는 과학팀에서 에이즈, 에볼라, 말라리아, 지카 등 감염병을 전문적으로 취재해왔다.
				맥닐이 프로메드에서 본 것은 ‘중국에 원인 미상의 폐렴이 발생했다’는 공지였다. ‘20년 전 사스가 시작되었던 방식과 비슷하네’라는 생각이 들었지만 바로 기사를 쓰지는 않았다. 그간 경험에 비춰보면, 이런 정보 대부분은 얼마 뒤 대수롭지 않은 것으로 밝혀지기 일쑤였다. 몇 년 전 아프리카의 한 결혼식에서 하객 여러 명이 사망하는 의문의 사건이 발생했다. 새로운 감염병을 의심했지만, 조사 결과 집에서 담근 술에 독성이 있었다고 드러났다.
				신종 바이러스의 위력이 아직 알려지지 않았던 1월, 맥닐은 중국 주재 〈뉴욕타임스〉 기자들에게 신종 감염병에 대해 이렇게 설명해줬다. “만약 사스 같은 바이러스라면 ‘제한적인’ 사람 간 감염이 있을 것이다. 오직 ‘지속적인’ 사람 간 감염만이 큰 재난이 될 것이다.” 당시 중국 우한 지방 정부는 구체적인 정보를 공개하지 않고 있었다. 바이러스가 얼마나 퍼질지 짐작하기 어려웠다. 1월29일에야 중국 정부는 확진자 1만명과 사망자 200명이 발생했다고 밝혔다. “세상에 이건 팬데믹이 되겠어. 큰일이다.” 맥닐은 신종 바이러스가 곧 태평양을 건너오리라고 직감했다.
				반면 과학팀의 에디터(팀장급 기자)들은 대유행을 예고하는 맥닐의 예측에 회의적이었다. 기사를 쓰기 전, 먼저 전문가 10여 명에게 의견을 들어보라는 지시가 떨어졌다. 맥닐은 감염병 전문가 12명에게 연락했다. 전문가들의 답변은 ‘8(그렇다)대 2(아니다)대 2(모르겠다)’였다. 대유행이 오리라는 예측에 ‘그렇다’고 답한 8명 중에는 국립알레르기·감염병연구소의 앤서니 파우치 박사도 있었다. 그제야 과학팀의 에디터는 맥닐에게 기사 작성을 허락했다(44년차 감염병 전문기자가 말하는 팬데믹 시대 언론의 역할 기사 참조).
				2월2일 〈뉴욕타임스〉에는 ‘전문가들은 우한 코로나바이러스가 점점 더 팬데믹처럼 보인다고 말한다(Wuhan Coronavirus Looks Increasingly Like a Pandemic, Experts Say)’라는 기사가 실렸다. 세계보건기구(WHO)가 팬데믹을 선언하고, 미국에서 코로나19 대유행이 본격적으로 시작된 것은 3월 중순 무렵이다. 맥닐은 그보다 한 달 반 빠르게 ‘경고 알람’을 울렸다. 2020년 내내 〈뉴욕타임스〉 지면을 채우게 된 코로나19 보도의 서막이었다.
				전 세계 언론사들은 어마어마한 양의 코로나19 기사를 쏟아냈다. 그러나 늘어난 뉴스만큼 명성을 높인 언론사는 손에 꼽힌다. 그중에 〈뉴욕타임스〉는 독보적이다. 팬데믹이 불러온 경기침체 속에서 이 유서 깊은 언론사는 170년 역사에서도 드문 호시절을 보내고 있다. 왜 〈뉴욕타임스〉는 코로나19 보도에서 기억될 단 하나의 이름이 되었을까. 〈뉴욕타임스〉는 뛰어난 기자와 높은 수준의 전문성을 보유했다. 어떤 뉴스가 진정 큰 사건으로 판명되었을 때 그들은 거침없이 뛰어든다.
				<br /><br />
			</div>
			<div class="copyright">
				<!-- Copyright -->
				<%@ include file="../common/Copyright.jsp" %>
			</div>
		</div>
	</div>
</body>
</html>