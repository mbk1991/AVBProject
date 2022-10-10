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
<link href="/resources/css/common.css" rel="stylesheet">
<body>
    <div id="header" class="container">
    	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </div>
    <div id="contents" class="container">
    	<h2>투표가 진행중이에요.(${vote.sumCount } / ${vote.participantLimit })</h2>
        <div id="wrap">
<!-- 글 내용 -->
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
<!-- 투표 영역 -->

			 <div id="result-area">
            	<table id="resultTable"  class="table table-hover" border="1px">
            		<tr>
            			<div style="text-align:left">1. ${vote.firstLabel }</div>
            			<div class="graph">
            			</div>
            			<div class="markWrap">
            				<div class="count">??표</div>
	            			<c:if test="${userChoice eq 1 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
               		<tr>
            			<div style="text-align:left">2. ${vote.secondLabel }</div>
            			<div class="graph">
            			</div>
            			<div class="markWrap">
            				<div class="count">??표</div>
	            			<c:if test="${userChoice eq 2 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
            		<c:if test="${vote.thirdLabel ne null }">
	            		<tr>
            			<div style="text-align:left">3. ${vote.thirdLabel }</div>
            			<div class="graph">
            			</div>
            			<div class="markWrap">
            				<div class="count">??표</div>
	            			<c:if test="${userChoice eq 3 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
	            	</c:if>
	            	<c:if test="${vote.fourthLabel ne null }">
            		<tr>
            			<div style="text-align:left">1. ${vote.fourthLabel }</div>
            			<div class="graph">
            			</div>
            			<div class="markWrap">
            				<div class="count">??표</div>
	            			<c:if test="${userChoice eq 4 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
            		</c:if>
            		<c:if test="${vote.fifthLabel ne null }">
            		<tr>
            			<div style="text-align:left">1. ${vote.fifthLabel }</div>
            			<div class="graph">
            			</div>
            			<div class="markWrap">
            				<div class="count">??표</div>
	            			<c:if test="${userChoice eq 5 }"><div class="mine">mine</div></c:if>
            			</div>
            		</tr>
            		</c:if>
            	</table><br>
            </div>
<!-- 댓글 -->
            <div id="reply">
            	<h2>투표가 완료되면 댓글창이 오픈됩니다!</h2>
            </div>
        </div>
    </div>
    <div id="footer">
    </div>
</body>
</html>