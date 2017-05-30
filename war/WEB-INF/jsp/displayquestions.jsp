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

 List<Entity> QestionDetails = (List<Entity>)request.getAttribute("Questions");
		    for(Entity e : QestionDetails){
		    	out.println("Test Date : "+e.getProperty("Test Date"));
		    	out.println("<br>Subject : "+e.getProperty("Subject Name"));
				out.println("<br>Question : "+e.getProperty("Question"));
				out.println("<br>---------------------------------------------------------------------------------------------------------------------------------------------------------------------------"+"<br>");
		    }%>
 
</body>
</html>