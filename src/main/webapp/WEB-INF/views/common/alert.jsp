<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="msg" value="${msg }">
	<input type="hidden" id="url" value="${url }">

</body>
<script>
	var msg = document.querySelector("#msg").value;
	var url = document.querySelector("#url").value;
	alert(msg + "하였습니다.");
	location.href=url;

</script>
</html>