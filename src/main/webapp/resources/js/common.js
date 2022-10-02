/**
 * 
 */
	function randomNick(){

		//1.XMLHttpRequest 객체 생성
		var xhr = new XMLHttpRequest();
		
		//2.요청방식, 주소, 비동기 여부
		xhr.open("POST","/member/nickname/make.do",true);
		
		//3.(post방식) http 요청 헤더 설정
		xhr.setRequestHeader("Content-type","application/json");
		
		//4. 요청 전송
		xhr.send();
		
		//5. 통신 후 작업
		xhr.onload=function(){
			
			//6.통신 성공
			if(xhr.status == 200){
				const jsonObject = JSON.parse(xhr.response);
				
				var combineNickname = jsonObject.combineNickname;
				document.querySelector("#nickname").value = combineNickname;
				
				//7.통신 실패
			}else{
			}
		}
	}
