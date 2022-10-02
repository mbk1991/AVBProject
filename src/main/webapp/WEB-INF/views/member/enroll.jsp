<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="header"></div>
    <div id="contents">
        <div id="wrap">
            <form action="/member/nickname/register.do" method="post">
                <input type="text" id="id" placeholder="아이디를 입력하세요." onblur="idCheck();">
                <div id="idCheck"></div>
                <input type="password" id="pwd" placeholder="비밀번호를 입력하세요.">
                <input type="password" id="rePwd" placeholder="비밀번호를 재입력하세요." onblur="">
                <div id="pwdCheck"></div>
                <input type="text" id="nickname" readonly placeholder="클릭하세요>>"> 
                <button type="button" onclick="randomNick();">랜덤 닉네임</button>
                <button>닉네임 등록</button>
            </form>
        </div>
    </div>
    <div id="footer"></div>
</body>


<script>
function idCheck(){
	//바닐라js 포스트방식 ajax
	
	//1.XMLHttpRequest객체를 생성한다.
	var xhr = new XMLHttpRequest();
	
	//2.응답 시 동작할 함수를 만든다.
	xhr.onload=function(){
		if(xhr.readyState === XMLHttpRequest.DONE){
			if(xhr.status == 200){
				
			}else{
				
			}
		}else{
			
		}
	}

	//3.요청할 때 보낼 데이터
	var inputId = document.querySelector("#id").value;
	
	//4.open()메소드로 HTTP방식과 URL을 설정한다.
	xhr.open("POST","/member/idCheck.do");
	
	//5.POST방식이므로 헤더를 설정한다.
	xhr.setRequestHeader("Content-type",'application/x-www-form-urlencoded');
	
	//6.send()로 전달값을 전하면서 요청한다.
	xhr.send("inputId="+encodeURIComponent(inputId));
}



function randomNick(){
		//바닐라js 겟방식 ajax
		//1.XMLHttpRequest 객체를 생성한다.
		var xhr = new XMLHttpRequest();
		
		//2.응답시 동작할 함수를 만든다
		xhr.onload=function(){
			if(xhr.readyState === XMLHttpRequest.DONE){
				if(xhr.status == 200){
					const jsonObject = JSON.parse(xhr.response);
					
					var combineNickname = jsonObject.combineNickname;
					document.querySelector("#nickname").value = combineNickname;
				}else{
				}
			}
		}
	
		//3.open()메소드, (post방식 시 header설정), send()메소드를 이용하여 요청한다.
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send();
	}
</script>
</html>