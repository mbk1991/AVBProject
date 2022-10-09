<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="/resources/css/common.css" rel="stylesheet">
<body>
    <div id="header" class="container">
    
    </div>
    <div id="contents" class="container">
   
        <div id="wrap">
	        <c:if test="${loginUser eq null }">
	         <div><h1>로그인 후 입장해보세요</h1></div>
	        	<div id="input-wrap">
		            <form action="/member/login.do" method="post">
		            	<div class="text-wrap">
			                <input type="text" name="memberId" placeholder="아이디를 입력하세요." required>
		            	</div>
		            	<div class="text-wrap">
			                <input type="password" name="memberPwd" placeholder="비밀번호를 입력하세요." required>
		            	</div>
		          		<c:if test=""></c:if>
		                <button class="btn btn-success">로그인</button>
		                <button class="btn btn-light" type="button" onclick="location.href='member/enrollView.do';">닉네임등록</button>
		            </form>
	        	</div>
	        </c:if>
	        <c:if test="${loginUser ne null }">
	        <div><h1>안녕하세요. 환영합니다.</h1></div>
	        	<div id="login-wrap">
	        		<button class="btn btn-success" id="loginBtn" type="button" onclick="location.href='vote/list.do';">${loginUser.nickName }님 입장</button>
	        		<button class="btn btn-light" id="enrollBtn" onclick="location.href='member/logout.do';">로그아웃</button>
	        	</div>
	        </c:if>
        </div>
    </div>
    <div id="footer"></div>
</body>

<script>
	
</script>

</html>
