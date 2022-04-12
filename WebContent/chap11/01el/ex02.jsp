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
	<h1>EL</h1>
	<%
	pageContext.setAttribute("pageAttr1", "PAGE ATTRIBUTE1");
	request.setAttribute("reqAttr1", "REQUEST ATTRIBUTE1");
	session.setAttribute("setAttr1", "SESSION ATTRIBUTE1");
	application.setAttribute("appliAttr1", "APPLICATION ATTRIBUTE1");
	%>
	
	<%-- Attriute 명을 잘 작성할 것 --%>
	<p>\${pageAttr1 } : ${pageAttr1 }</p>
	<p>\${reqAttr1 } : ${reqAttr1 }</p>
	<p>\${sesAttr1 } : ${sesAttr1 }</p>
	<p>\${appAttr1 } : ${appAttr1 }</p>
</body>
</html>