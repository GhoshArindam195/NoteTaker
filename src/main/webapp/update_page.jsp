<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp" %>
    <title>update notes | NoteTaker</title>
    
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
  	
  	<%
  		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
  		
  		Session s = FactoryProvider.getFactory().openSession();

  		Note note = (Note)s.get(Note.class, noteId);
  	%>
  	
  	<div class="container my-5">
  		<div class="row">
	  		<div class="col-sm-8 offset-sm-2">
	  			<h1 class="text-center">Now, you can update your secret</h1>
		  		<div class="card">
				  	<form action="Update_noteServlet" method="get">
				  		<input value = "<%=note.getId()%>" name="noteId" type="hidden">
				  		<div class="card-body">
							<div class="form-group">
							    <label for="title">Secrets' Title :</label>
								<input type="text" class="form-control" id="title" name="title" value="<%= note.getTitle()%>">
							</div>
										  
							<div class="form-group">
								<label for="secret">Secret :</label>
								<textarea class="form-control" id="secret" name="secret" rows="5"><%=note.getContent()%></textarea>
							</div>
							
							<div class="form-check">
								<input name="private" class="form-check-input" type="checkbox" value="" id="defaultCheck1">
								<label class="form-check-label text-danger" for="defaultCheck1">
									<b>Make it Private !</b>
								</label>
							</div>
						</div>
						<div class="card-footer text-center">
							<button type="submit" class="btn btn-outline-warning">Update it</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>