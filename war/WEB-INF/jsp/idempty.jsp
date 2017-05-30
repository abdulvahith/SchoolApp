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
	out.print("Student RollNumber Cannot be Empty<br>");
	String link=(String)request.getAttribute("retrylink");
	out.print("<a href="+link+">click here to try again</a><br>");
	out.print("<a href='home.html'>click here to go home</a> ");
%>
</body>
</html>