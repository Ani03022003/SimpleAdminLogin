<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Update Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Animated Login Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free Web Designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href='reg/css/bootstrap.min.css' media='all' rel='stylesheet'>
<link href="reg/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="reg/css/animate.min.css"> 
<!-- //Custom Theme files -->
<!-- web font -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'><!--web font-->
<!-- //web font --> 
</head>
<body>
<a href="details.jsp" style="margin-left: 30px;margin-top: 20px;color: black;" class="btn btn-warning">Go Back</a>
<%
String a = request.getParameter("em");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","root");
String qry = "select * from employees where employee_id='"+a+"'";
String qry2 = "select * from skills where employee_id='"+a+"'";
PreparedStatement ps = con.prepareStatement(qry);
PreparedStatement ps2 = con.prepareStatement(qry2);
ResultSet rs2 = ps2.executeQuery();
ResultSet rs = ps.executeQuery();

if(rs.next() && rs2.next()) {
%>
	<!-- main-agileits -->
	<div class="agileits">
		<h1>Update Data</h1>
		<div class="w3-agileits-info">
			<form class='form animate-form' id='form1' action="Update" method="post">
				<p class="w3agileits">Add Employee</p>
				<div class='form-group has-feedback wthree'>
					<label class='control-label sr-only' for='name'>Employee name</label> 
					<input class='form-control' id='name' name='en' placeholder='Employee name' type='text'><span class='glyphicon glyphicon-ok form-control-feedback'></span>
				</div>
				<div class='form-group has-feedback wthree'>
					<label class='control-label sr-only' for='email'>Email address</label> 
					<input class='form-control' id='email' name='em' placeholder='Email address' type='text'><span class='glyphicon glyphicon-ok form-control-feedback'></span>
				</div>
				<div class='form-group has-feedback agile'>
					<label class='control-label sr-only' for='phonenumber'>Phone_Number</label>
					<input class='form-control w3l' id='phonenumber' name='phno' placeholder='Phone_Number' type='text'><span class='glyphicon glyphicon-ok form-control-feedback'></span>
				</div>
				<div class='form-group has-feedback wthree'>
					<label class='control-label sr-only' for='department'>Department</label><span class='glyphicon glyphicon-ok form-control-feedback'></span>
					<select class='form-control' id='department' name='department'>
						<option value=''>Select Department</option>
						<option value='HR'>HR</option>
						<option value='Finance'>Finance</option>
						<option value='Engineering'>Engineering</option>
						<option value='Sales'>Sales</option>
					</select>
				</div>
				<div class='form-group has-feedback wthree' style="display: flex; justify-content:space-between; flex-wrap: wrap;">
					<label class='control-label sr-only' for='skills' style="display: flex;">Skills</label> <span class='glyphicon glyphicon-ok form-control-feedback'></span>
						<label><input type='checkbox' name='skills' value='JavaScript'> JavaScript</label><br>
						<label><input type='checkbox' name='skills' value='Python'> Python</label><br>
						<label><input type='checkbox' name='skills' value='Java'> Java</label><br>
						<label><input type='checkbox' name='skills' value='C++'> C++</label><br>
				</div>
				<div class='submit w3-agile'>
					<input class='btn btn-lg' type='submit' value='UPDATE'>
				</div>
			</form>
		</div>	
	</div>	
	
	<%
         }
	%>
	<!-- //agileits -->
	<!-- copyright -->
	<div class="w3-agile-copyright">
	</div>
	<!-- //copyright -->  
	<!-- js -->
	<script src="reg/js/jquery-2.2.3.min.js"></script>
	<script src='reg/js/jquery.validate.min.js'></script>
	<script src='reg/js/formAnimation.js'></script>
	<script src='reg/js/shake.js'></script> 
	<!-- //js -->
</body>
</html>