<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
</head>
<body>

<%--div>span>i.fa-brands.fa-apple^a*3 --%>


<%-- include directive --%>
<%-- file 속성으로 이 위치에 포함될 파일의 경로를 작성 --%>
<%-- 다른 파일의 내용을 현재 위치에 삽입(복붙)후 java로 변환 --%>
<%@ include file="module/header01.jsp" %>

<%--div>(h1>lorem1^p>lorem)*3 --%>
<div>
	<h1>Lorem.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis libero perferendis sit nostrum! Mollitia praesentium necessitatibus laudantium sapiente dolores dolor qui repellendus minima corporis eos officia beatae fugit ea itaque.</p>
	<h1>Error?</h1>
	<p>Est harum culpa velit optio! Voluptates quasi eveniet libero molestiae dolore aut quaerat cum odit quam optio. A ad inventore ipsam. Nobis illo autem vero quidem nisi dicta eaque doloremque.</p>
	<h1>Fugit.</h1>
	<p>Officia error adipisci molestias repudiandae et id voluptas in accusantium iure ipsum ducimus laboriosam totam magni nihil ratione quidem quisquam! Quis fuga maiores aperiam eveniet qui repellat blanditiis! Adipisci incidunt.</p>
</div>

</body>
</html>