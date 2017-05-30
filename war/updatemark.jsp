<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
    
    function checkRollNo()
    {
    	var rollNo=document.updatestudentmark.stdrollno.value;
    	
    	var url="check?rollNo="+rollNo;
    	
    	var request=new XMLHttpRequest();
    	
    	request.open("GET",url,true);
    	request.send();
    	
    	request.onreadystatechange = function() 
		  {
		    if (request.readyState == 4 && request.status == 200) 
		    {
		    	if(request.responseText!="success")
				  {
		    		alert("sorry rollNo not valid");
		    		document.updatestudentmark.stdrollno.value="";
				  }
		    }
		  };
    }
    </script>
    </head>

<body>
<h4>Enter students marks here</h4>
	<form action="updatestudentmark" name="updatestudentmark" method="post">
	<input type="text" name="stdrollno" onblur="checkRollNo()">: Enter student rollno<br>
	<b>Enter student mark here</b><br>
	<input type="text" name="tamil">: Tamil<br>
	<input type="text" name="english">: English<br>
	<input type="text" name="maths">: Maths<br>
	<input type="text" name="science">: Science<br>
	<input type="text" name="socialscience">: Social Science<br>
	<input type="submit">
	</form>
	<br><a href="home.html">click here to home</a>
</body>
</html>