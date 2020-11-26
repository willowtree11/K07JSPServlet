<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//선언부 선언
	
	public int getBaesu(int start, int end, int baesu){
		int sum=0;
		//start에서 end까지 반복한다.
		for(int i=start; i<=end; i++){
			//증가하는 i를 baesu로 나누어 떨어지는 경우에만 누적하여
			if(i%baesu==0){
				//i를 전부 합한다(sum 변수에 저장)
				sum += i;
			}
		}
		return sum;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>선언부에서 메소드 정의</h2>
	<h4>스크립트렛에서 결과값 출력</h4>
	<h4>표현식에서 결과값 출력</h4>
	<p style="color:#888;">
		연습문제] 1부터 100사이의 숫자 중 3의 배수의 합을 반환하는
		함수를 선언한 후 결과를 출력하시오
		함수명 : getBaesu()
	</p> 
	
	1~200사이의 숫자 중 5의 배수의 합은?
	<%=getBaesu(1, 200, 5) %>
</body>
</html>