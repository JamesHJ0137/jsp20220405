<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<%
	String id = request.getParameter("memberId");
	if(id != null&&id.equals("madvirus")) {
		response.sendRedirect("../book/index.jsp");
	} else {
		
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>로그인에 실패</title>
</head>
<body>
잘못된 아이디 입니다.
</body>
</html>


<%
	}

%>