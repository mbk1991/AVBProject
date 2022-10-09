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
<link href="/resources/css/common.css" rel="stylesheet">
</head>
<body>
    <div id="header" class="container">
    	 	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </div>
    <div id="contents" class="container">
    	<h1>${paging.totalCount }개의 투표가 있어요.</h1><br>
        <div id="wrap">
            <div id="search-wrap">
	            <form action="/vote/search.do" method="get" >
	                <select class="form-select" name="searchCondition" id="" style="padding:10px;" >
	                	<option <c:if test="${search.searchCondition eq '' }">selected</c:if> value="">전체</option>
	                    <option <c:if test="${search.searchCondition eq 'VOTE_WRITER' }">selected</c:if> value="VOTE_WRITER">작성자</option>
	                    <option <c:if test="${search.searchCondition eq 'VOTE_TITLE' }">selected</c:if> value="VOTE_TITLE">제목</option>
	                </select>
	            	<div class="text-wrap">
		                <input type="text" name="searchValue" placeholder="검색어를 입력해보세요" value="${search.searchValue }">
	            	</div>
	               
	               	<label><input checked type="radio" name="searchFilter" value="" class="form-check-input" >전체</label>
	               	<label><input <c:if test="${search.searchFilter eq 'N' }">checked</c:if> type="radio" name="searchFilter" value="N" class="form-check-input" >진행중</label>
					<label><input <c:if test="${search.searchFilter eq 'Y' }">checked</c:if> type="radio" name="searchFilter" value="Y" class="form-check-input" >투표완료</label>
	                <button class="btn btn-light"  type="">검색</button>
	                <hr>
	            </form>
            </div>
            <div id="board-wrap">
                <table class="table table-hover">
					<c:forEach items="${vList }"  var="vote" >
	                    <tr class="listTr" onclick="location.href='/vote/detail.do?voteNo='+${vote.voteNo }+'';">
	                    	<td>
	                    		<div>
	                    			<h2>${vote.voteTitle }</h2>
	                    		</div>
	                    		<div>
		                    		<small>${vote.voteWriter }님의 투표가 </small>
		                    		<c:if test="${vote.voteEnd eq 'N' }"><small id="continueText" ">진행중(${vote.sumCount }/${vote.participantLimit })</small></c:if>
	                    			<c:if test="${vote.voteEnd ne 'N' }"><small id="compliteText">완료됨(${vote.sumCount }/${vote.participantLimit })</small></c:if>
<%-- 	                    			<small>${vote.voteTime }</small> --%>
	                    		</div>
	                    	</td>
	                    </tr>
					</c:forEach>                    
                </table>
            </div>
        </div>
<!-- 페이징 -->
		<div id="paging">
			<c:if test="${paging.startNavi > paging.startPage}">
				<a href="/vote/${url }.do?page=${paging.startNavi -1}&searchValue=${search.searchValue }&searchCondition=${search.searchCondition}&searchFilter=${search.searchFilter}"><</a>
			</c:if>
			<c:forEach begin="${paging.startNavi }" end="${paging.endNavi }" var="n">
				<a href="/vote/${url }.do?page=${n }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition}&searchFilter=${search.searchFilter}">${n}</a>
			</c:forEach>
			<c:if test="${paging.endNavi < paging.endPage}">
				<a href="/vote/${url }.do?page=${paging.endNavi +1}&searchValue=${search.searchValue }&searchCondition=${search.searchCondition}&searchFilter=${search.searchFilter}">></a>
			</c:if>
		</div>
    </div>
    <div id="footer">
    </div>
</body>
</html>