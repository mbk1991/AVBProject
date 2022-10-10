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
<script src="/resources/js/common.js"></script>
<body>
    <div id="header">
    	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </div>
    <div id="contents" class="container">
    	<h2>투표가 진행중이에요.(${vote.sumCount } / ${vote.participantLimit })</h2>
    	<h2> 투표에 참여해보세요.</h2><br>
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
            <div id="vote-area">
            	<form action="/vote/join.do" method="post">
            		<input type="hidden" name="voteNo" value="${vote.voteNo}">
					<div id="vote-wrap">
						<table id="resultTable"  class="table table-hover" border="1px">
		            		<tr>
		            			<label for="first" style="display:block;">
			            			<div style="text-align:left">1. ${vote.firstLabel }</div>
			            			<div class="graph"></div>
		            			</label>
		            			<div class="markWrap">
		            				<div class="count">??표</div>
		            				<div class="voteCheck">
			            				<input type="radio" id="first" value="1" name="voteCheck" class="form-check-input me-1">
		            				</div>
		            			</div>
		            		</tr>
		               		<tr>
		               			<label for="second" style="display:block;">
		            			<div style="text-align:left">2. ${vote.secondLabel }</div>
		            			<div class="graph"></div>
		            			</label>
		            			
		            			<div class="markWrap">
		            				<div class="count">??표</div>
		            				<div class="voteCheck">
			            				<input type="radio" id="second" value="2" name="voteCheck" class="form-check-input me-1">
		            				</div>
		            			</div>
		            		</tr>
		            		<c:if test="${vote.thirdLabel ne null }">
			            		<tr>
			            		<label for="third" style="display:block;">
			            			<div style="text-align:left">3. ${vote.thirdLabel }</div>
			            			<div class="graph"></div>
		            			</label>
		            			<div class="markWrap">
		            				<div class="count">??표</div>
		            				<div class="voteCheck">
			            				<input type="radio" id="third" value="3" name="voteCheck" class="form-check-input me-1">
		            				</div>
		            			</div>
		            		</tr>
			            	</c:if>
			            	<c:if test="${vote.fourthLabel ne null }">
		            		<tr>
		            			<label for="fourth" style="display:block;">
			            			<div style="text-align:left">4. ${vote.fourthLabel }</div>
			            			<div class="graph"></div>
		            			</label>
		            			<div class="markWrap">
		            				<div class="count">??표</div>
		            				<div class="voteCheck">
			            				<input type="radio" id="fourth" value="4" name="voteCheck" class="form-check-input me-1">
		            				</div>
		            			</div>
		            		</tr>
		            		</c:if>
		            		<c:if test="${vote.fifthLabel ne null }">
		            		<tr>
		            			<label for="fifth" style="display:block;">
			            			<div style="text-align:left">5. ${vote.fifthLabel }</div>
			            			<div class="graph"></div>
		            			</label>
		            			<div class="markWrap">
		            				<div class="count">??표</div>
		            				<div class="voteCheck">
			            				<input type="radio" id="fifth" value="5" name="voteCheck" class="form-check-input me-1">
		            				</div>
		            			</div>
		            		</tr>
	            			</c:if>
	            	</table><br>
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
</html>