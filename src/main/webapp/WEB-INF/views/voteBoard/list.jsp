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
            <button onclick="location.href='/vote/writeView.do';">투표 올리기</button>
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
                <table>
                    <tr>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>투표진행상태</th>
                        <th>조회수</th>
                        <th>댓글수</th>
                    </tr>
					<c:forEach items="${vList }"  var="vote" >
	                    <tr onclick="location.href='/vote/detail.do?voteNo='+${vote.voteNo }+'voteWriter='+${vote.voteWriter }+'voteEnd='+${vote.voteEnd }+'';">
	                    	<th>${vote.voteTitle }</th>
	                    	<th>${vote.voteWriter }</th>
	                    	<th>${vote.voteEnd }</th>
	                    	<th>${vote.viewCount }</th>
	                    	<th>${vote.replyCount }</th>
	                    </tr>
	                    <form>
	                    	<input type="hidden" name="voteNo" value="${vote.voteNo }">
	                    	<input type="hidden" name="voteWriter" value="${vote.voteWriter }">
	                    	<input type="hidden" name="voteEnd" value="${vote.voteEnd }">
	                    </form>
					</c:forEach>                    
                </table>
            </div>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>