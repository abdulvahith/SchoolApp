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

 List<Entity> studentsMarksDetails = (List<Entity>)request.getAttribute("studentsMarks");
		    for(Entity e : studentsMarksDetails){
		    	out.println("RollNo : "+e.getProperty("Student RollNo"));
		    	out.println("<br>Tamil : "+e.getProperty("Tamil"));
				out.println("<br>English : "+e.getProperty("English"));
				out.println("<br>Maths : "+e.getProperty("Maths"));
				out.println("<br>Science : "+e.getProperty("Science"));
				out.println("<br>Social Science : "+e.getProperty("Social Science"));
				out.println("<br>---------------------------------------------------------------------------------------------------------------------------------------------------------------------------"+"<br>");
		    }%>
 
</body>
</html>