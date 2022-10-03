<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 투표 영역 -->
            <div id="vote-area">
            	<form action="/vote/join.do" method="post">
            		<input type="hidden" name="voteNo" value="${vote.voteNo}">
					<div id="vote-wrap">
						<div id="candiFirst">
							<label for="first">${vote.firstLabel }</label>
							<input type="radio" id="first" value="1" name="voteCheck">
						</div>
						<div id="candiSecond">
							<label for="second">${vote.secondLabel }</label>
							<input type="radio" id="second" value="2" name="voteCheck">
						</div>
						<c:if test="${vote.thirdLabel ne null }">
							<div id="candiThird">
								<label for="third">${vote.thirdLabel }</label>
								<input type="radio" id="third" value="3" name="voteCheck">
							</div>
						</c:if>
						<c:if test="${vote.fourthLabel ne null }">
							<div id="candiFourth">
								<label for="fourth">${vote.fourthLabel }</label>
								<input type="radio" id="fourth" value="4" name="voteCheck">
							</div>
						</c:if>
						<c:if test="${vote.fifthLabel ne null }">
							<div id="candiFifth">
								<label for="fifth">${vote.fifthLabel }</label>
								<input type="radio" id="fifth" value="5" name="voteCheck">
							</div>
						</c:if>		
						<button>투표하기</button>
					</div>            	
            	</form>
            </div>
<!-- 댓글 -->
            <div id="reply">
            </div>
        </div>
    </div>
    <div id="footer">
    </div>
</body>
<script>
</script>

</html>