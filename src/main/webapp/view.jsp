<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jsp_db", "postgres", "root");

	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from contact");
	%>

	<h2>ALL CONTACTS</h2>

	<table border="1" cellpadding="10">

		<tr>
			<th>NAME</th>
			<th>PHONE</th>
			<th>EMAIL</th>
		</tr>

		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("phone")%></td>
			<td><%=rs.getString("email")%></td>

		</tr>


		<%
		}
		con.close();
		%>


	</table>






</body>
</html>