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
Entity induvidualDetail=null;
try{
	induvidualDetail= (Entity)request.getAttribute("InduvidualStudentMark");
	out.println("============================="+"<br>");
	out.println("Student rollNo= "+induvidualDetail.getProperty("Student RollNo")+"<br>");
	out.println("Tamil= "+induvidualDetail.getProperty("Tamil")+"<br>");
	out.println("English= "+induvidualDetail.getProperty("English")+"<br>");
	out.println("Maths= "+induvidualDetail.getProperty("Maths")+"<br>");
	out.println("Science= "+induvidualDetail.getProperty("Science")+"<br>");
	out.println("Social Science= "+induvidualDetail.getProperty("Social Science")+"<br>");
	out.println("============================="+"<br>");
}
catch(Exception e)
{
	out.println("Sorry your marks not updated yet<br>");
	out.println("<a href=home.html>click here to home</a><br>");
}


%>
</body>
</html>