<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<h4>select your option!</h4>
	
	<%String rollno=request.getParameter("rollNo"); %>
	
	<a href="studentprofile?rollNo=<%=rollno%>">click here to profile page</a><br>
	<a href="viewquestions">click here to test questions</a><br>
	<a href="induvidualstudentmark?rollNo=<%=rollno%>">click here to view your marks </a><br>
	
	<br>
	<a href="home.html">click here to home</a>
	
</body>
</html>