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
	<%
		Connection conexion = null;
			Statement sentencia = null;
			ResultSet rs = null;
			String id = request.getParameter("id");
			
			try{
		Class.forName("com.mysql.jdbc.Driver");
		conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/librodb2", "root", "balonmano2014");
		sentencia = conexion.createStatement();
		
		rs=sentencia.executeQuery("SELECT * FROM libro WHERE id="+id);
		rs.next();
	%>
	
	<form action="EditarLibro.jsp" method="post">
		<fieldset>
			<legend>Insertar Libro</legend>
			<p>
				<input type="hidden" value="<%=rs.getString("id")%>" name="id" />
			</p>
			<p>
				<label for="isbn">ISBN: </label>
				<input type="text" value="<%=rs.getString("isbn")%>" name="isbn"  />
			</p>
			<p>
				<label for="titulo">Titulo: </label>
				<input type="text" value="<%=rs.getString("titulo")%>" name="titulo" />
			</p>
			<p>
				<label for="categoria">Categoría: </label>
				<input type="text" value="<%=rs.getString("categoria")%>" name="categoria" />
			</p>
			<p>
				<input type="submit" value="Guardar" />
			</p>

		</fieldset>
	</form>


	<%
		}catch(ClassNotFoundException e){
		System.out.println("Error en la carga del driver: "+e.getMessage());			
			}catch(SQLException e){
		System.out.println("Error accediendo a las BDs: " +e.getMessage());
			}finally{
		if(rs!=null){
			try{
				rs.close();
			}catch(SQLException e){
				System.out.println("Error cerrando el ResultSet: "+e.getMessage());
			}
			
		}
		if(sentencia!=null){
			try{
				sentencia.close();
			}catch(SQLException e){
				System.out.println("Error cerrando sentencia: "+e.getMessage());
			}
			
		}
		if(conexion!=null){
			try{
				conexion.close();
			}catch(SQLException e){
				System.out.println("Error cerrando la conexión: "+e.getMessage());
			}
		}
			}
	%>
</body>
</html>