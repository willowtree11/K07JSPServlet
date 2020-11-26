<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#popup{
		position: absolute; top:100px; left: 200px;
		width: 300px; height: 200px; color: yellow;
		border: 0px solid gray; background-color: gray;
	}
	div#popup>div{
		position: relative; background-color: #fff; top:50px;
		border: 1px solid gray; padding: 10px; color: black;
	}
</style>
</head>

<body>
	<h2>팝업 메인페이지</h2>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.<br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.<br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.<br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.<br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.<br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.<br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다.<br>
	<%
		String isPopup="on"; //on 상태일 때 팝업이 열림
		//생성된 모든 쿠키를 가져온다
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			//쿠키 갯수만큼 반복
			for(Cookie c:cookies){
				//쿠키명과 값을 가져온다
				String cookieName=c.getName();
				String cookieValue=c.getValue();
				//그 중 PopupClose라는 이름의 쿠키가 있으면(팝업 닫기 관련 항목이 있으면) 저장된 값을 가져온다
				if(cookieName!=null && cookieName.equals("PopupClose")){ //쿠키값이 on이면 닫아줌
					isPopup = cookieValue;
				}
			}
		}
		System.out.println(isPopup);
		if(isPopup.equals("on")){
	%>
	<script>
		function popClose(){
			//팝업창의 아이디 속성을 통해 닫아준다.
			var popup=document.getElementById('popup');
			popup.style.display="none";
			
			/*
				오늘 하루 열지 않음 체크박스를 체크한 후 닫기를 누르면 JS를 통해 폼값을 전송한다.
				target을 iframe으로 설정하여 페이지 이동이 없는(비동기) 것 처럼 보이게 한다.
			*/
			var frm=document.popFrm;
			if(frm.isToday.checked==true){
				console.log("isToday check..");
				frm.action='PopupCookie.jsp';
				frm.target='hiddenFrame';
				frm.method='post';
				frm.submit();
			}
		}
	</script>
	<div id="popup">
		<h2>공지사항</h2>
		<p>
			1. 사용방법은 아주 간단하고 쉽습니다.<br>
			1. 사용방법은 아주 간단하고 쉽습니다.<br>
			1. 사용방법은 아주 간단하고 쉽습니다.
		</p>
		<div>
			<form name="popFrm">
				<input type="checkbox" name="isToday" value="1"/>
				오늘 하루 열지 않음
				<input type="button" value="닫기" onclick="popClose();" />
			</form>
		</div>
	</div>
	<!-- 폼값은 여기로 전송 -->
	<iframe name="hiddenFrame" stlye="display:block; width: 400px;"></iframe> <!-- display:hidden으로 해야 꺼지지만 테스트 위해 block -->
	<% } %>
</body>
</html>