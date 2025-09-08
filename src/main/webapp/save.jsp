<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<%
	String name = request.getParameter("myname");
	String phone = request.getParameter("myphoneno");
	String email = request.getParameter("myemail");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jsp_db", "postgres", "root");

	PreparedStatement ps = con.prepareStatement("insert into contact values(?,?,?)");

	ps.setString(1, name);
	ps.setString(2, phone);
	ps.setString(3, email);

	ps.executeUpdate();

	con.close();
	%>


	<h2>CONTACT ADDED SUCCESSFULLY</h2>
	<br>
	<br>

	<a href="add.jsp">ADD NEW CONTACT</a>
	<br>
	<br>
	<a href="view.jsp">VIEW SAVED CONTACTS</a>


</body>
</html>