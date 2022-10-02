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
            <button>투표 올리기</button>
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
                        <th>닉네임</th>
                        <th>제목</th>
                        <th>상태</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>