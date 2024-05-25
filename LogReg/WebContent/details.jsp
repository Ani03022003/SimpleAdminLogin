<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Table</title>
<style type="text/css">
table,th,td{
  border: 1px solid black;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","root");
String qry2 = "select * from skills";
String qry = "select * from employees";
PreparedStatement ps = con.prepareStatement(qry);
PreparedStatement ps2 = con.prepareStatement(qry2);
ResultSet rs = ps.executeQuery();
ResultSet rs2 = ps2.executeQuery();
%>
<center><h1 style="margin-top: 250px;">EMPLOYEE DETAILS</h1></center>
<center>
  <a href="login.html" style="margin-bottom: 10px;" class="btn btn-primary" >ADD</a>
  <table class="table table-success table-striped" style="width: 50%;text-align: center;">
     <thead>
         <tr>
           <th>ID</th>
           <th>NAME</th>
           <th>EMAIL</th>
           <th>PHONE NUMBER</th>
           <th>DEPARTMENT</th>
           <th>SKILLS</th>
           <th>ACTION</th>
         </tr>
     </thead>
     <tbody>
     <%
     while(rs.next() && rs2.next()){
     %>
         <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs2.getString(2)%></td>
            <td>
            <a href="update.jsp?em=<%=rs.getInt(1)%>" class="btn btn-outline-primary" >UPDATE</a>
            <a href="delete.jsp?em=<%=rs.getInt(1)%>" class="btn btn-outline-danger" >DELETE</a>
            </td>
         </tr>
     <%
     }
     %>    
     </tbody>
  </table>
 </center>
</body>
</html>