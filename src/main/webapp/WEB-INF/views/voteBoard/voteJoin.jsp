<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>
    <div id="header">
    	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </div>
    <div id="contents" class="container">
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
            	<div><h2>투표에 참여해보세요!</h2></div>
            	<form action="/vote/join.do" method="post">
            		<input type="hidden" name="voteNo" value="${vote.voteNo}">
					<div id="vote-wrap">
						<div id="candiFirst" class="raw">
							<input type="radio" id="first" value="1" name="voteCheck" class="form-check-input me-1">
							<label for="first">${vote.firstLabel }</label>
						</div>
						<div id="candiSecond" class="raw">
							<input type="radio" id="second" value="2" name="voteCheck" class="form-check-input me-1">
							<label for="second">${vote.secondLabel }</label>
						</div>
						<c:if test="${vote.thirdLabel ne null }">
							<div id="candiThird" class="raw">
								<input type="radio" id="third" value="3" name="voteCheck" class="form-check-input me-1">
								<label for="third">${vote.thirdLabel }</label>
							</div>
						</c:if>
						<c:if test="${vote.fourthLabel ne null }">
							<div id="candiFourth" class="raw">
								<input type="radio" id="fourth" value="4" name="voteCheck" class="form-check-input me-1">
								<label for="fourth">${vote.fourthLabel }</label>
							</div>
						</c:if>
						<c:if test="${vote.fifthLabel ne null }">
							<div id="candiFifth" class="raw">
								<input type="radio" id="fifth" value="5" name="voteCheck" class="form-check-input me-1">
								<label for="fifth">${vote.fifthLabel }</label>
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