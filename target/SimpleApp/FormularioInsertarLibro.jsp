<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="InsertarLibro.jsp" method="post">
		<fieldset>
			<legend>Insertar Libro</legend>
			<p>
			<label for="isbn">ISBN: </label>
			<input type="text" name="isbn" />
			</p>
			<p>
			<label for="titulo">Titulo: </label>
			<input type="text" name="titulo" />
			</p>
			<p>
			<label for="categoria">Categoría: </label>
			<input type="text" name="categoria" />
			</p>
			<p>
				<input type="submit" value="Guardar"/>
			</p>
			
		</fieldset>
	</form>
</body>
</html>