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
<%-- 절대경로 (/) --%>
<%-- 클라이언트가 사용하면 context root(path) 작성해야함 --%>
<a href="/jsp20220405/chap07/path/ex02.jsp">ex02로 이동(절대경로)</a>

<br />

<%-- 절대경로 with contextPath --%>
<a href="<%= request.getContextPath() %>/chap07/path/ex02.jsp">ex02로 이동 (절대경로 with contextOath)</a>
<br />
<%-- 상대경로 --%>
<a href="ex02.jsp">ex02로 이동(상대경로)</a>
<br />

<%-- forward 상대경로 --%>
<%-- <jsp:forward page="ex02.jsp" /> --%>

<%-- forward 절대경로 --%>
<%-- <jsp:forward page="/chap07/path/ex02.jsp"></jsp:forward> --%>


</body>
</html>