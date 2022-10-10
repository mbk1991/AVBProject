<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/common.js"></script>
<body>
    <div id="header" class="container">
    	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </div>
    <div id="contents" class="container">
    	<h1>투표를 만들어보세요.</h1>
        <div id="wrap">
            <form action="/vote/write.do" method="post">
           
            	<div class="text-wrap">
	            	<input onkeyup="textCheck(this)" type="text" id="voteTitle" name="voteTitle" placeholder="제목을 입력하세요.(30자)" required>
	            	<input type="hidden" id="memberId" name="memberId" value="${loginUser.memberId }">
	                <input type="hidden" id="voteWriter" name="voteWriter" value="${loginUser.nickName }">
            	</div>
            	<div class="text-wrap">
	            	<textarea id="voteContents"  onkeyup="textareaCheck(this);" name="voteContents" placeholder="내용을 입력하세요.(300자)" required style="height:100%;width:100%;border-style:none;"></textarea>
            	</div>
            	<div style="text-align:left;">
	            	(<span id="typingCount">0</span>/300)
            	</div>
                <div class="text-wrap">
                	<h3>투표 인원을 설정하세요.</h3>
					<input type="text" id="participantLimit" name="participantLimit" readonly value="5" style="width:60px;">
	                <input type="range" min="5" max="100" step="5"  value="5" oninput="document.querySelector('#participantLimit').value=this.value;">
                </div><br>
                <h1>투표 항목을 만들어보세요.</h1>
                <div id="voteCandi-wrap">
                	<div class="text-wrap">
	                    <input onkeyup="textCheck(this)" type="text"   id="firstLabel"  name="firstLabel"  placeholder="후보1" required>
                	</div>
                	<div class="text-wrap">
	                    <input onkeyup="textCheck(this)" type="text"   id="secondLabel" name="secondLabel" placeholder="후보2" required>
                	</div>
                	<div class="text-wrap">
	                    <input onkeyup="textCheck(this)" type="hidden" id="thirdLabel"  class="addList" name="thirdLabel"  placeholder="후보3" >
                	</div>
                	<div class="text-wrap">
	                    <input onkeyup="textCheck(this)" type="hidden" id="fourthLabel" class="addList" name="fourthLabel" placeholder="후보4" >
                	</div>
                	<div class="text-wrap">
	                    <input onkeyup="textCheck(this)" type="hidden" id="fifthLabel"  class="addList" name="fifthLabel"  placeholder="후보5" >
                	</div>
                </div>
                <button class="btn btn-light" type="button" onclick="addList();">항목추가</button>
                <button class="btn btn-light" type="button" onclick="removeList();">항목제거</button>
                <button class="btn btn-success">투표올리기</button>
            </form>
        </div>
    </div>
    
    <div id="footer">
    </div>
</body>
<script>
//text 및 textarea 글자수 제한.


	var index=1;
	function addList(){
		switch(index){
			case 1: 
				document.querySelector("#thirdLabel").type="text";
				document.querySelector("#thirdLabel").required="true";
				index++;
				break;
			case 2: 
				document.querySelector("#fourthLabel").type="text";
				document.querySelector("#fourthLabel").required="true";
				index++;
				break;
			case 3: 
				document.querySelector("#fifthLabel").type="text";
				document.querySelector("#fifthLabel").required="true";
				index++;
				break;
		}
	}
	function removeList(){
		switch(index){
			case 1: 
				document.querySelector("#thirdLabel").value="";
				document.querySelector("#thirdLabel").type="hidden";
				document.querySelector("#thirdLabel").required="false";
				break;
			case 2: 
				document.querySelector("#fourthLabel").value="";
				document.querySelector("#fourthLabel").type="hidden";
				document.querySelector("#fourthLabel").required="false";
				index--;
				break;
			case 3: 
				document.querySelector("#fifthLabel").value="";
				document.querySelector("#fifthLabel").type="hidden";
				document.querySelector("#fifthLabel").required="false";
				index--;
				break;
			case 4: 
				index--;
				break;
		}
	}

</script>

</html>