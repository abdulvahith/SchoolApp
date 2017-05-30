<%@page import="java.util.List"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
out.println("<a href=home.html>click here to home</a><br>");
Entity induvidualDetail= (Entity)request.getAttribute("InduvidualStudent");
out.println("============================="+"<br>");
out.println("Student Name= "+induvidualDetail.getProperty("Student Name")+"<br>");
out.println("Student RollNo= "+induvidualDetail.getProperty("Student RollNo")+"<br>");
out.println("Student Address= "+induvidualDetail.getProperty("Student Address")+"<br>");
out.println("============================="+"<br>");
%>
</body>
</html>