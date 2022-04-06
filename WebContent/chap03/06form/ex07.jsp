<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>check box 예제</h1>
<h1>좋아하는 영화를 고르세요</h1>
	<form action="ex08.jsp">
		<input type="checkbox" name="movie" id="" value="avengers" /> 어벤져스
		<br />
		<input type="checkbox" name="movie" id="" value="scream" /> 스크림
		<br />
		<input type="checkbox" name="movie" id="" value="about-time" /> 어바웃타임
		<br />
		<input type="checkbox" name="movie" id="" value="morbious" /> 모비우스
		<br />
		<input type="checkbox" name="movie" id="" value="secret" /> 말할수없는비밀
		<br />
		<input type="submit" value="선택" />
	</form>
</body>
</html>