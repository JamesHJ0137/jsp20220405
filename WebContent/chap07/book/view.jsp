<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String code = request.getParameter("code");
String viewPageURI = null;

if (code.equals("A")) {
	viewPageURI = "../book/a.jsp";
} else if (code.equals("B")) {
	viewPageURI = "../book/b.jsp";
} else if (code.equals("C")) {
	viewPageURI = "../book/c.jsp";
}
%>
<jsp:forward page="<%=viewPageURI%>" />