<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <div id="header">
    	 	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </div>
    <div id="contents" class="container">
    	<h3>${paging.totalCount }개의 투표가 있어요.</h3>
        <div id="wrap">
            <div id="search-wrap">
                <input type="text">
                <select name="" id="">
                    <option value="">진행중</option>
                    <option value="">종료</option>
                    <option value="">내가 투표한 투표</option>
                    <option value="">내가 올린 투표</option>
                </select>
                <button type="button">검색</button>
            </div>
            <div id="board-wrap">
                <table class="table table-hover">
                    <tr>
                        <th class="col-4">제목</th>
                        <th class="col">작성자</th>
                        <th class="col">투표진행상태</th>
                        <th class="col">조회수</th>
                        <th class="col">댓글수</th>
                    </tr>
					<c:forEach items="${vList }"  var="vote" >
	                    <tr onclick="location.href='/vote/detail.do?voteNo='+${vote.voteNo }+'';">
	                    	<th>${vote.voteTitle }</th>
	                    	<th>${vote.voteWriter }</th>
	                    	<th>
	                    		<c:if test="${vote.voteEnd eq 'N' }">진행중(${vote.sumCount }/${vote.participantLimit })</c:if>
	                    		<c:if test="${vote.voteEnd ne 'N' }">투표종료(${vote.sumCount }/${vote.participantLimit })</c:if>
	                    	</th>
	                    	<th>${vote.viewCount }</th>
	                    	<th>${vote.replyCount }</th>
	                    </tr>
<!-- 	                    <form> -->
<%-- 	                    	<input type="hidden" name="voteNo" value="${vote.voteNo }"> --%>
<%-- 	                    	<input type="hidden" name="voteWriter" value="${vote.voteWriter }"> --%>
<%-- 	                    	<input type="hidden" name="voteEnd" value="${vote.voteEnd }"> --%>
<!-- 	                    </form> -->
					</c:forEach>                    
                </table>
            </div>
        </div>
<!-- 페이징 -->
		<div id="paging">
			<c:if test="${paging.startNavi > paging.startPage}">
				<a href="/vote/list.do?page=${paging.startNavi -1}"><<</a>
			</c:if>
			<c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				<a href="/vote/list.do?page=${n }">${n}</a>
			</c:forEach>
			<c:if test="${paging.endNavi < paging.endPage}">
				<a href="/vote/list.do?page=${paging.endNavi +1}">>></a>
			</c:if>
		</div>
    </div>
    <div id="footer">
    </div>
</body>
</html>