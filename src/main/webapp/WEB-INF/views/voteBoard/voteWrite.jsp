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
            <form action="/vote/write.do" method="post">
            	제목
            	<input type="text" id="voteTitle" name="voteTitle" required>
            	<input type="hidden" id="memberId" name="memberId" value="${loginUser.memberId }">
                <input type="hidden" id="voteWriter" name="voteWriter" value="${loginUser.nickName }"><br>
            	내용
            	<input type="text" id="voteContents" name="voteContents" required><br>
                투표인원
				<input type="text" id="participantLimit" name="participantLimit" readonly value="5"><br>
                <input type="range" min="5" max="100" step="5"  value="5" oninput="document.querySelector('#participantLimit').value=this.value;">
<!--  				<select id="participantLimit" name="participantLimit"> -->
<!--  					<option value="3">3</option> -->
<!--  					<option value="5">5</option> -->
<!--  					<option value="7">7</option> -->
<!--  					<option value="9">9</option> -->
<!--  					<option value="11">11</option> -->
<!--  					<option value="13">13</option> -->
<!--  					<option value="15">15</option> -->
<!--  					<option value="17">17</option> -->
<!--  					<option value="19">19</option> -->
<!--  					<option value="21">21</option> -->
<!--  				</select> -->
                <br>
                <div id="voteCandi-wrap">
                    <input type="text"   id="firstLabel"  name="firstLabel"  placeholder="후보1" required><br>
                    <input type="text"   id="secondLabel" name="secondLabel" placeholder="후보2" required><br>
                    <input type="hidden" id="thirdLabel"  class="addList" name="thirdLabel"  placeholder="후보3" ><br>
                    <input type="hidden" id="fourthLabel" class="addList" name="fourthLabel" placeholder="후보4" ><br>
                    <input type="hidden" id="fifthLabel"  class="addList" name="fifthLabel"  placeholder="후보5" ><br>
                </div>
                <button type="button" onclick="addList();">항목추가</button>
                <button type="button" onclick="removeList();">항목제거</button>
                
                <br>
                <button>투표올리기</button>
            </form>
        </div>
    </div>
    <div id="footer">
		<a href="/vote/list.do">목록으로</a>
    </div>
</body>
<script>

	var index=1;
	function addList(){
		switch(index){
			case 1: 
				document.querySelector("#thirdLabel").type="text";
				index++;
				break;
			case 2: 
				document.querySelector("#fourthLabel").type="text";
				index++;
				break;
			case 3: 
				document.querySelector("#fifthLabel").type="text";
				index++;
				break;
		}
	}
	function removeList(){
		switch(index){
			case 1: 
				document.querySelector("#thirdLabel").value="";
				document.querySelector("#thirdLabel").type="hidden";
				break;
			case 2: 
				document.querySelector("#fourthLabel").value="";
				document.querySelector("#fourthLabel").type="hidden";
				index--;
				break;
			case 3: 
				document.querySelector("#fifthLabel").value="";
				document.querySelector("#fifthLabel").type="hidden";
				index--;
				break;
			case 4: 
				index--;
				break;
		}
	}

</script>

</html>