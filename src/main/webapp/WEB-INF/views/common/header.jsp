<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#headerMenu{
	background-color: white;
   	overflow: auto;
    position: fixed;
}
</style>
<body>
		<div id="headerMenu" class="container">
		  <div class="row">
		    <div class="col">
		      <a href="/">로그인 화면으로</a>
		    </div>
		    <div class="col">
		      <a href="/vote/writeView.do">투표 올리기</a>
		    </div>
		    <div class="col">
		      <a href="/vote/list.do">목록으로</a>
		    </div>
   		    <div class="col">
		      <a href="#top">맨 위로</a>
		    </div>
		  </div>
		</div>
		<div id="top"></div>
		<br><br><br>
</body>
</html>