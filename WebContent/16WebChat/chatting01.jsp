<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting01</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<fieldset style="width:350px; text-align:center;">
		<legend>채팅창</legend>	
		<!-- 대화입력창 -->	
		<input type="text" id="inputMessage" style="width:300px; margin-bottom:5px;"/>
		<br />
		<input type="button" onclick="sendMessage();" value="보내기"/>
		<input type="button" onclick="disconnect();" value="채팅종료"/>	
		<br />
		<!-- 대화출력창 -->
		<textarea id="messageWindow" style="width:300px; height:400px; margin-top:10px;" readonly></textarea>
	</fieldset>	
	
	<!-- 스크립트는 아래쪽에 쓰는것이 좋음. 화면이 다 불러와진 다음 DOM객체를 불러오는 순서이므로 -->
	<script>
	/*
		JS의 WebSocket객체를 이용해 웹소켓 서버에 연결한다.
		웹소켓이므로 ws://로 시작한다. 
		마지막 경로에는 @ServerEndpoint 어노테이션으로
		지정했던 요청명을 사용한다.
	*/
		var webSocket = new WebSocket("ws://localhost:9999/K07JSPServlet/ChatServer01");
		
	//	대화 입력창/출력창의 DOM을 가져온다.
		var messageWindow=document.getElementById("messageWindow");
		messageWindow.value="";
		var message=document.getElementById("inputMessage");
		
	//	웹소켓이 연결되었을 때 발생하는 이벤트
		webSocket.onopen=function(event){
			messageWindow.value += "서버 연결됨\n";
		};
	//	종료되었을 때
		webSocket.onclose=function(event){
			messageWindow.value += "서버 종료됨\n";
		};
	//	에러발생시
		webSocket.onerror=function(event){
			messageWindow.value += "채팅 중 에러 발생\n";
		};
	//	메시지가 서버에서 클라이언트로 전송되었을 때
		webSocket.onmessage=function(event){
			//매개변수를 통해 서버가 보낸 메시지를 출력할 수 있다.
			messageWindow.value += "서버 에서 수신 => "+event.data+"\n";
		};
	/*
		클라이언트가 "보내기" 버튼을 눌렀을 때
		메시지를 서버로 전송하는 메소드 sendMessage()
	*/
		function sendMessage(){
			//입력창의 DOM을 가져와서
			var message=document.getElementById("inputMessage");
			//입력된 내용을 출력창에 출력하고
			messageWindow.value += "서버로 전송 => "+message.value+"\n";
			//웹소켓 서버로 입력한 내용을 전송한다
			webSocket.send(message.value);
			//입력창의 내용을 비워준다.
			message.value="";
		}
		
	//	웹소켓 종료
		function disconnect(){
			webSocket.close();
		}
	/*
		이런 프로그램은 F5키는 막아놓는것이 권장됨
		채팅내역이 전부 날아가고 재접속하게 되므로..
		K05Javascript > J15Event05.html 파일 참고(키보드 이벤트)
	*/
	</script>
</body>
</html>