<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting03Main</title>
</head>
<body>
	<script>
	function chatWin03(){
		//아이디 입력창에 입력된 내용을 가져오기 위해 DOM객체를 얻어온다
		var id = document.getElementById("chat_id");
		if(id.value==""){
			alert("닉네임을 입력후 채팅창을 열어주세요");
			id.focus();
			return; 
		}
	/*
		open()메소드의 두번째 속성은 창의 이름을 부여하는 속성으로
		만약 이름을 임의로 부여하게 되면 항상 같은 창에서 열리게 된다.
	*/
		window.open("chatting03.jsp?chat_id="+id.value, 
				"",
				"width=300,height=400");
		id.value="";
	}
	</script>
	<h2>웹소켓03 - 아이디 적용해서 채팅창 띄워주기</h2>
	아이디 : <input type="text" id="chat_id" />
	<button type="button" onclick="chatWin03();">채팅창열기</button>
</body>
</html>