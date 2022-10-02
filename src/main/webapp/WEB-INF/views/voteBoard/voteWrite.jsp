<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="POST/vote" method="post">
                투표인원
                <input type="text">
                <button>항목 추가</button>
                <div id="vote-list-wrap">
                    <input type="text">
                    <input type="text">
                </div>
                <button>투표올리기</button>
            </form>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>