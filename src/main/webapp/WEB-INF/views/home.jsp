<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
    <div id="header"></div>
    <div id="contents">
        <div id="wrap">
            <form action="#" method="post">
                <input type="text" name="userId" placeholder="아이디를 입력하세요.">
                <input type="password" name="userPwd" placeholder="비밀번호를 입력하세요.">
                <button onclick="location.href='vote/list.do';">입장</button>
                <button type="button" onclick="location.href='member/enrollView.do';">닉네임등록</button>
            </form>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>
