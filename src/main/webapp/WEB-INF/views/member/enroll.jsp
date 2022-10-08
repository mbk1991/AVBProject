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
                <input type="text" id="id"  name="memberId" placeholder="아이디는 영소문자,숫자 4~16자입니다." onblur="idCheck(this);" style="width:300px;">
                <div id="idCheck"></div>
                <input type="password" id="pwd" name="memberPwd"   placeholder="비밀번호는 영문,숫자 4~12자입니다." onblur="pwdCheck(this);" style="width:300px;"><br>
                <input type="password" id="rePwd" placeholder="비밀번호를 재입력하세요." onblur="rePwdCheck(this)"  required style="width:300px;">
                <div id="pwdCheck"></div>
                <input type="text" id="nickname" name="nickName"  readonly placeholder="클릭하세요>>" style="width:300px;"><br>
                <button type="button" onclick="randomNick();">랜덤 닉네임</button>
                <button>닉네임 등록</button>
            </form>
        </div>
    </div>
    <div id="footer"></div>
</body>


<script>
function idCheck(thisInput){
	//정규표현식 체크
	var regExId = /^[a-z0-9]{4,16}$/;
	if(!regExId.test(thisInput.value)){
		console.log(!regExId.test(thisInput.value));
		document.querySelector("#idCheck").innerHTML="<span style='color:red';>영소문자,숫자 4~16자로 입력하세요.</span>";
		thisInput.value = "";
	}else{
		//바닐라js 포스트방식 ajax
		
		//1.XMLHttpRequest객체를 생성한다.
		var xhr = new XMLHttpRequest();
		
		//2.응답 시 동작할 함수를 만든다.
		xhr.onreadystatechange =function(){
			if(xhr.readyState === XMLHttpRequest.DONE){
				if(xhr.status == 200){
					const jsonObject = JSON.parse(xhr.response);
					var result = jsonObject.idCheckResult;
					if(!result==0){
						document.querySelector("#idCheck").innerHTML="<span style='color:red';>중복되는 아이디입니다.</span>";
						thisInput.value="";
					}else{
						document.querySelector("#idCheck").innerHTML="<span style='color:green';>사용 가능한 아이디입니다.</span>"
					}
					
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
}

function pwdCheck(thisInput){
	var regExPwd = /^[0-9a-zA-Z]{4,12}$/;
		if(!regExPwd.test(thisInput.value) && (thisInput.value != "")){
			document.querySelector("#pwdCheck").innerHTML="<span style='color:red'>4~12자 영문,숫자로 입력하세요.</span>";
			thisInput.value = "";
		}else{
			document.querySelector("#pwdCheck").innerHTML="";
		}
}

function rePwdCheck(thisInput){
	if(document.querySelector("#pwd").value == ""){
		document.querySelector("#pwdCheck").innerHTML="<span style='color:red'>비밀번호를 입력하세요.</span>";
		thisInput.value = "";
		document.querySelector("#pwd").focus();
	}
	if(document.querySelector("#pwd").value != document.querySelector("#rePwd").value){
		document.querySelector("#pwdCheck").innerHTML="<span style='color:red'>비밀번호가 일치하지 않습니다.</span>";
		thisInput.value = "";
	}else{
		if(thisInput.value!=""){
		document.querySelector("#pwdCheck").innerHTML="<span style='color:green'>비밀번호가 일치합니다.</span>";
		}
	}
}



function randomNick(){
		//바닐라js 포스트방식 ajax
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
		xhr.open("POST","/member/nickname/make.do");
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send();
	}
</script>
</html>