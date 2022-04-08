<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "chap07.*" %>
<% request.setCharacterEncoding("utf-8");%>


<%
Car car1 = new Car();
Car car2 = new Car();
car1.setName("hyundai");
car1.setPrice(1000);
car2.setName("kia");
car2.setPrice(800);

request.setAttribute("myCar", car1);
request.setAttribute("yourCar", car2);

%>

<jsp:forward page="ex09to.jsp" />