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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/common.js"></script>

<style>

/* .graph{ */
/* 	background-color:gray; */
/* 	height:50px; */
/* } */
</style>

<body>
    <div id="header" class="container">
    	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </div>
    <div id="contents" class="container">
        <div id="wrap">
	    <h2>투표가 완료되었어요.(${vote.sumCount } / ${vote.participantLimit })</h2><br>
<!-- 글 내용 -->
        <div id="wrap">
            <div id="detail-area">
            	<table class="table table-hover">
					<tr>
						<td><h1>${vote.voteTitle }</h1></td>
					</tr>
					<tr>
						<td>
							<div style="height:150px;">
								${vote.voteContents }
							</div>
						</td>
					</tr>
					<tr>
						<td>└ ${vote.voteWriter }  ${vote.voteTime }</td>
					</tr>
            	</table>
            </div>
<!-- 투표결과 -->
            <div id="result-area">
            	<table id="resultTable"  class="table table-hover" border="1px">
            		<tr>
            			<div style="text-align:left">1. ${vote.firstLabel }</div>
            			<div class="graph">
            				<div id="firstProgress" class="progress"></div>
            			</div>
            			<div class="markWrap">
            				<div class="count">${vote.firstCount }표</div>
	            			<c:if test="${vote.firstCount eq mostCount}"> <div class="best">best</div></c:if>
	            			<c:if test="${userChoice eq 1 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
               		<tr>
            			<div style="text-align:left">2. ${vote.secondLabel }</div>
            			<div class="graph">
            				<div id="secondProgress" class="progress"></div>
            			</div>
            			<div class="markWrap">
            				<div class="count">${vote.secondCount }표</div>
	            			<c:if test="${vote.secondCount eq mostCount}"> <div class="best">best</div></c:if>
	            			<c:if test="${userChoice eq 2 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
            		<c:if test="${vote.thirdLabel ne null }">
	            		<tr>
            			<div style="text-align:left">3. ${vote.thirdLabel }</div>
            			<div class="graph">
            				<div id="thirdProgress" class="progress"></div>
            			</div>
            			<div class="markWrap">
            				<div class="count">${vote.thirdCount }표</div>
	            			<c:if test="${vote.thirdCount eq mostCount}"> <div class="best">best</div></c:if>
	            			<c:if test="${userChoice eq 3 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
	            	</c:if>
	            	<c:if test="${vote.fourthLabel ne null }">
            		<tr>
            			<div style="text-align:left">1. ${vote.fourthLabel }</div>
            			<div class="graph">
            				<div id="fourthProgress" class="progress"></div>
            			</div>
            			<div class="markWrap">
            				<div class="count">${vote.fourthCount }표</div>
	            			<c:if test="${vote.fourthCount eq mostCount}"> <div class="best">best</div></c:if>
	            			<c:if test="${userChoice eq 4 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
            		</c:if>
            		<c:if test="${vote.fifthLabel ne null }">
            		<tr>
            			<div style="text-align:left">1. ${vote.fifthLabel }</div>
            			<div class="graph">
            				<div id="fifthProgress" class="progress"></div>
            			</div>
            			<div class="markWrap">
            				<div class="count">${vote.fifthCount }표</div>
	            			<c:if test="${vote.fifthCount eq mostCount}"> <div class="best">best</div></c:if>
	            			<c:if test="${userChoice eq 5 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
            		</c:if>
            	</table><br>
            </div>
<!-- 댓글 -->
            <div id="reply" style="text-align:left;">
            	<div id="replyCount"></div>
                <div id="replyInput" style="margin:20px">
                	<div class="text-wrap">
		            	<textarea onkeyup="textareaCheck(this);" id="replyContents" type="text" name="replyContents"  required placeholder="댓글을 입력해보세요(300자" ></textarea>
                	</div>
                	<div style="text-align:right;">
<!--                 		<span style="float:left;">(0/300)</span> -->
		            	<button onclick="submitReply();" type="button" style="width:150px; height:50px;">댓글등록</button>
                	</div>
	            </div>
            	<div id="replyList">
					<li class="Reply">
						<div class="info">
							<div>작성자</div>
							<div>날짜</div>
						</div>
						<div class="contents"> 댓글 내용입니다.</div>
						<div><a href="#">답글</a></div>
					</li>            	
            	</div>
            </div>
        </div>
    </div>
    <div id="footer">
    </div>
</body>
<script>


//게이지
	var $replyList =  $("#replyList");
	$replyList.html("");
	printReplyList();

	fillGage();
	function fillGage(){
			var firstProgress = "${vote.firstCount}" / "${vote.participantLimit}";
			var secondProgress = "${vote.secondCount}" / "${vote.participantLimit}";
			var thirdProgress = "${vote.thirdCount}" / "${vote.participantLimit}";
			var fourthProgress = "${vote.fourthCount}" / "${vote.participantLimit}";
			var fifthProgress = "${vote.fifthCount}" / "${vote.participantLimit}";
		
			document.querySelector("#firstProgress").style.width=firstProgress*100+"%";
			document.querySelector("#secondProgress").style.width=secondProgress*100+"%";
			document.querySelector("#thirdProgress").style.width=thirdProgress*100+"%";
			document.querySelector("#fourthProgress").style.width=fourthProgress*100+"%";
			document.querySelector("#fifthProgress").style.width=fifthProgress*100+"%";
			
	}


//댓글 리스트 출력 함수. 
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
					$("#replyCount").text("댓글 ("+vList.length+")");
					for(var i in vList){
						if(vList[i].reReplyYn == 'N'){
							var $li = $("<li class='reply list-group-item'>");
							var $divInfo = $("<div class='info'>").html("<h4 class='mb-2'>"+vList[i].replyWriter+"</h4><small>"+vList[i].replyTime+"</small>");
							var $divContents =$("<div class='contents'>").text(vList[i].replyContents);
							var $arcodianReReply = $("<button style='width:150px; height:50px;'  class='reBtn' onclick='reReplyList(this);'>답글 달기</button>");
							var $divReReplyArea = $("<div class='reReply' style='display:none;'>").html("<div class='reReplyList'></div><div class='reReplyInput'><div class='text-wrap'><textarea onkeyup='textareaCheck(this);' required placeholder='답글을 입력해보세요.(300자)'></textarea></div><div style='text-align:right;'><button style='width:150px; height:50px;' onclick='submitReReply(this,"+vList[i].replyNo+");'>답글등록</button></div></div>");
							$li.append($divInfo);
							$li.append($divContents);
							$li.append($arcodianReReply);
							$li.append($divReReplyArea);
							$replyList.append($li);
							var reReplyCount = 0;
						}else{
							reReplyCount++;
							var $lastReReplyList = $(".reReplyList").last();
							var $li = $("<li class='reReply list-group-item' style='background-color:beige;'>");
							var $divInfo = $("<div class='info'>").html("<h5 class='mb-2'>└"+vList[i].replyWriter+"</h5><small>"+vList[i].replyTime+"</small>");
							var $divContents =$("<div class='contents'>").text(vList[i].replyContents);
							$li.append($divInfo);
							$li.append($divContents);
							$lastReReplyList.append($li);
							$(".reBtn").last().text("답글("+reReplyCount+")");
						}
					}
				}
			},
			error:function(){}
		});
	}
	
	
//답글리스트 아코디언. 
	function reReplyList(thisBtn){
		var display = $(thisBtn).next().css("display");
		console.log(display);
		if(display == 'none'){
			$(thisBtn).next().css("display","block");
		}else{
			$(thisBtn).next().css("display","none");
		}
	}
	

	

	
	
//댓글 등록버튼 이벤트

	function submitReply(){
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
					$("#replyContents").val("");
				}else{
					console.log("실패");
				}
			},
			error:function(){}
			
		});
	}

//답글 등록버튼 onclick 이벤트 동작 함수
	function submitReReply(thisButton,refReplyNo){

		var voteNo = "${vote.voteNo}";
		var replyMemberId = "${loginUser.memberId}";
		var replyWriter = "${loginUser.nickName}";
		var replyContents = thisButton.parentNode.previousSibling.firstChild.value;
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