<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp" %>
    <title>show notes | NoteTaker</title>
    
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Fascinate&display=swap" rel="stylesheet">
    <style>
    	p{
    	font-family: 'Fascinate', cursive;
    	}
    </style>
</head>
<body>
	<!-- Nav bar -->
  	<%@include file="navbar.jsp" %><br>
  	
  	<div class = "container my-5" style="font-size:30px;">
  		<p class="text-center text-uppercase"><b>Your Notes</b></p>
  		<%
  			Session s = FactoryProvider.getFactory().openSession();
  			
  			Query q = s.createQuery("from Note");
  			
  			List<Note> list = q.list();
  			
  			for(Note n : list)
  			{
  					%>
  		<div class="row">
  			<dic class="col-sm-8 offset-sm-2 ">
  				<div class="card mt-3">
  					<img class="card-img-top img-fluid m-3" style="max-width:100px;" alt="" src="https://www.flaticon.com/premium-icon/icons/svg/2822/2822606.svg">
  					<p class="text-primary ml-auto"><%= n.getAddedDate()%></p>
  					
  						<div class="text-center">
  							<b><%=n.getTitle() %></b>
  						</div>
  						
  					<div class="card-body text-center" style="font-size:35px;">
  						<b><%=n.getContent() %></b>
  					</div>
  					<div class="card-footer text-center">
  						<a href="RemoveServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Remove</a>
  						<a href="update_page.jsp?note_id=<%=n.getId() %>" class="btn btn-warning">Update</a>
  					</div>
  				</div>
  				
  			</dic>
  		</div>
  				
  					<%
  			}
  			
  			s.close();
  		%>
  	</div>

</body>
</html>