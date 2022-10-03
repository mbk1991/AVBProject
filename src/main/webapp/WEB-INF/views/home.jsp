<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
    <div id="header"></div>
    <div id="contents">
        <div id="wrap">
	        <c:if test="${loginUser eq null }">
	        	<div id="input-wrap">
		            <form action="/member/login.do" method="post">
		                <input type="text" name="memberId" placeholder="아이디를 입력하세요.">
		                <input type="password" name="memberPwd" placeholder="비밀번호를 입력하세요.">
		          		<c:if test=""></c:if>
		                <button>로그인</button>
		                <button type="button" onclick="location.href='member/enrollView.do';">닉네임등록</button>
		            </form>
	        	</div>
	        </c:if>
	        <c:if test="${loginUser ne null }">
	        	<div id="login-wrap">
	        		<button type="button" onclick="location.href='vote/list.do';">${loginUser.nickName }님 입장</button>
	        		<button onclick="location.href='member/logout.do';">로그아웃</button>
	        	</div>
	        </c:if>
        </div>
    </div>
    <div id="footer"></div>
</body>

<script>
	
</script>

</html>
