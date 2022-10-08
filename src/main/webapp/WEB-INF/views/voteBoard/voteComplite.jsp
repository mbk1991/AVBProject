<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div id="header"></div>
    <div id="contents">
        <div id="wrap">
<!-- 글 내용 -->
            <div id="detail-area">
            	<table>
					<tr>
						<td>제목</td>
						<td>${vote.voteTitle }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${vote.voteWriter }</td>
						
					</tr>
					<tr>
						<td colspan="2">${vote.voteContents }</td>
					</tr>
					<tr>
						<td colspan="2">조회수: ${vote.viewCount } 댓글수: ${vote.replyCount } 날짜: ${vote.voteTime }</td>
					</tr>
					</tr>
					<tr>
						<td>투표진행상태</td>
						<td>${vote.sumCount } / ${vote.participantLimit }</td>
					</tr>            	
            	</table>
            </div>
<!-- 투표결과 -->
            <div id="result-area">
            	<table id="resultTable"  border="1px">
            		<tr>
            			<th>항목</th>
            			<th>나의 표</th>
            			<th>득표수</th>
            			<th>최다득표</th>
            		</tr>
            		<tr>
            			<td>${vote.firstLabel }</td>
            			<td><c:if test="${userChoice eq 1 }">V</c:if></td>
            			<td>${vote.firstCount }</td>
            			<td><c:if test="${vote.firstCount eq mostCount }">V</c:if></td>
            		</tr>
               		<tr>
            			<td>${vote.secondLabel }</td>
            			<td><c:if test="${userChoice eq 2 }">V</c:if></td>
            			<td>${vote.secondCount }</td>
            			<td><c:if test="${vote.secondCount eq mostCount }">V</c:if></td>
            		</tr>
            		<c:if test="${vote.thirdLabel ne null }">
	            		<tr>
	            			<td>${vote.thirdLabel }</td>
	            			<td><c:if test="${userChoice eq 3 }">V</c:if></td>
	            			<td>${vote.thirdCount }</td>
	            			<td><c:if test="${vote.thirdCount eq mostCount }">V</c:if></td>
	            		</tr>
	            	</c:if>
	            	<c:if test="${vote.fourthLabel ne null }">
            		<tr>
            			<td>${vote.fourthLabel }</td>
            			<td><c:if test="${userChoice eq 4 }">V</c:if></td>
            			<td>${vote.fourthCount }</td>
            			<td><c:if test="${vote.fourthCount eq mostCount }">V</c:if></td>
            		</tr>
            		</c:if>
            		<c:if test="${vote.fifthLabel ne null }">
            		<tr>
            			<td>${vote.fifthLabel }</td>
            			<td><c:if test="${userChoice eq 5 }">V</c:if></td>
            			<td>${vote.fifthCount }</td>
            			<td><c:if test="${vote.fifthCount eq mostCount }">V</c:if></td>
            		</tr>
            		</c:if>
            	</table>
            </div>
<!-- 댓글 -->
            <div id="reply">
                <div id="replyInput">
	            	<input id="replyContents" type="text" name="replyContents" placeholder="댓글을 입력해보세요" >
	            	<button id="submitReply" type="button">댓글등록</button>
	            </div>
            	<div id="replyList">
					<li class="Reply">
						<div class="info">
							<div>작성자</div>
							<div>날짜</div>
						</div>
						<div class="contents"> 댓글 내용입니다.</div>
						<div><a href="#">답글</a></div>
						
						<div class="reReply-area">
<!-- 답글 리스트						 -->
							<li class="reReply">
								<div class="info">
									<div>작성자</div>
									<div>날짜</div>
								</div>
								<div class="contents"> 답글 내용입니다.</div>
							</li>
							
<!-- 답글 입력창					 -->
							<div>
								<input type="text" name="reReplyContents" placeholder="답글을 입력해보세요" >
							</div>
						</div>
						
					</li>            	
            	</div>
            </div>
            
        </div>
    </div>
    <div id="footer">
    	<a href="/vote/list.do">목록으로</a>
    </div>
</body>
<script>

//댓글 리스트 출력 함수. 
	var $replyList =  $("#replyList");
	$replyList.html("");
	printReplyList();

	function printReplyList(){
		var voteNo = "${vote.voteNo}";
		$.ajax({
			url:"/reply/list.do",
			data:{
				"voteNo":voteNo
			},
			type:"get",
			success:function(vList){
				if(vList!=null){
					for(var i in vList){
						var $li = $("<li class='reply'>");
						var $divInfo = $("<div class='info'>").html("<div>"+vList[i].replyWriter+"</div><div>"+vList[i].replyTime+"</div>");
						var $divContents =$("<div class='contents'>").text(vList[i].replyContents);
						var $arcodianReReply = $("<a href='#' onclick=';'>").text("답글 달기");
						var $divReReplyArea = $("<div class='reReply-area'>").html("<input type='text' placeholder='답글을 입력해보세요.'><button onclick='submitReReply(this,"+vList[i].replyNo+");'>답글등록</button>");
						
						$li.append($divInfo);
						$li.append($divContents);
						$li.append($arcodianReReply);
						$li.append($divReReplyArea);
						$replyList.append($li);
					}
				}
			},
			error:function(){}
		});
	}
//댓글 등록버튼 이벤트
	var submitReply = $("#submitReply").on("click",function(){
		
		var voteNo = "${vote.voteNo}";
		var replyMemberId = "${loginUser.memberId}";
		var replyWriter = "${loginUser.nickName}";
		var replyContents = document.querySelector("#replyContents").value;
		
		$.ajax({
			url:"/reply/registerOrigin.do",
			data:{
					"voteNo":voteNo,
					"memberId":replyMemberId,
					"replyWriter":replyWriter,
					"replyContents":replyContents
				  },
			type:"post",
			success:function(result){
				if(result == "success"){
					console.log("확인");
					
					$replyList.html("");
					printReplyList();
				}else{
					console.log("실패");
				}
			},
			error:function(){}
			
		});
		
	});

//답글 등록버튼 onclick 이벤트 동작 함수
	function submitReReply(thisButton,refReplyNo){

		var voteNo = "${vote.voteNo}";
		var replyMemberId = "${loginUser.memberId}";
		var replyWriter = "${loginUser.nickName}";
		var replyContents = thisButton.previousSibling.value;
		console.log(replyContents);
		
		$.ajax({
			url:"/reply/registerReReply.do",
			data:{
					"voteNo":voteNo,
					"memberId":replyMemberId,
					"replyWriter":replyWriter,
					"replyContents":replyContents,
					"refReplyNo":refReplyNo
				  },
			type:"post",
			success:function(result){
				if(result == "success"){
					console.log("확인");
					
					$replyList.html("");
					printReplyList();
				}else{
					console.log("실패");
				}
			},
			error:function(){}
			
		});
	

		
	}


//바닐라js ajax 뭔가 잘 안됨..
// 	var submitReply = document.querySelector("#submitReply");
// 	submitReply.addEventListener("click",function(){
// 		alert("!");
		
// 		var xhr = new XMLHttpRequest();
// 		xhr.onload=function(){
// 			if(xhr.readyState === 4){
// 				if(xhr.status === 200){
// 					if(xhr.response == "success"){
// 						console.log("성공");
// 					}else{
// 						console.log("실패");
// 					}
// 				}else{
// 				}			
// 			}
// 		}
		
// 		var voteNo = "${vote.voteNo}";
// 		var replyMemberId = "${loginUser.memberId}";
// 		var replyWriter = "${loginUser.nickName}";
// 		var replyContents = document.querySelector("#replyContents").value;
		
// 		var jsonObj = {
// 				"voteNo":voteNo,
// 				"memberId":replyMemberId,
// 				"replyWriter":replyWriter,
// 				"replyContents":replyContents
// 		}
		
// 		console.log(jsonObj);
// 		var jsonSerialization = JSON.stringify(jsonObj);
// 		console.log(jsonSerialization);
		
// 		console.log(encodeURIComponent(voteNo));
		
// 		xhr.open("post","/reply/register.do",true);
// 		xhr.setRequestHeader("Content-type","application/json;charset=utf-8");
// 		xhr.send(jsonSerialization);
		
// 	});

</script>


</html>