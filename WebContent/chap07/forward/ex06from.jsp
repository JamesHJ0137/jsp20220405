<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<% request.setCharacterEncoding("utf-8");%>


<%

String o = "sunja";
List<String> list = new ArrayList<>();
list.add("James");
list.add("Kein");
list.add("Son");


request.setAttribute("job", o);
request.setAttribute("job", "strange");
request.setAttribute("names", list);
%>

<jsp:forward page="ex06to.jsp"/>