<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp" %>
    <title>Add Note | Note Taker</title>
    
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=MuseoModerno:wght@700&display=swap" rel="stylesheet">
    <style>
    	p{
    	font-family: 'MuseoModerno', cursive;
    	}
    </style>
</head>
<body>

	<!-- Nav bar -->
  	<%@include file="navbar.jsp" %>
  	
  	//content form
  	<div class="container my-5">
  		<div class="row">
  			<div class="col-sm-8 offset-sm-2">
  				<div class="card">
  					<div class=" card-header">
  						<img src="https://images.pexels.com/photos/879788/pexels-photo-879788.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" class="img-fluid">
  						<p class="text-center my-1" style="font-size:30px; "><b>You can share your secrets with me!</b></p>
  						<p class="text-center my-1" style="font-size:20px;">Trust me! I am faithful</p>
  					</div>
  				
  					<form action="Add_noteServlet" method="post">
  						<div class="card-body">
						  <div class="form-group">
						    <label for="title">Secrets' Title :</label>
						    <input type="text" class="form-control" id="title" name="title" placeholder="">
						  </div>
						  
						  <div class="form-group">
						    <label for="secret">Secret :</label>
						    <textarea class="form-control" id="secret" name="secret" rows="5"></textarea>
						  </div>
						  <div class="form-check">
							  <input name="private" class="form-check-input" type="checkbox" value="" id="defaultCheck1">
							  <label class="form-check-label text-danger" for="defaultCheck1">
							    <b>Make it Private !</b>
							  </label>
						  </div>
						</div>
						<div class="card-footer text-center">
							<button type="submit" class="btn btn-outline-success">Secure it</button>
						</div>
					</form>
  				</div>
  			</div>
  		</div>
  	</div>
  	


</body>
</html>