<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<h4>Signup here!</h4>
	
	<form action="uploadquestion" method="post">
	<input type="radio" name="subjects" value="tamil">: Tamil<br>
	<input type="radio" name="subjects" value="english">: English<br>
	<input type="radio" name="subjects" value="maths">: Maths<br>
	<input type="radio" name="subjects" value="science">: Science<br>
	<input type="radio" name="subjects" value="socialscience">: Social Science<br>
	<br>
	<input type="date" name="testDate">: Test Date<br>
	<b>enter question here</b><br>
	<textarea rows="5" cols="50" name="question" ></textarea><br>
	<input type="submit"> 
	</form>
	
	<br>
	<a href="home.html">click here to home</a>
</body>
</html>