<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tech.blog.dao.PostDao"%>
    <%@ page import="com.tech.blog.dao.UserDao"%>
    <%@ page import="com.tech.blog.dao.LikeDao"%>
    <%@ page import="java.util.*"%>
    <%@ page import="com.tech.blog.entities.Posts"%>
    <%@ page import="com.tech.blog.entities.User"%>
    <%
	User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<%
 int postId= Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao();
Posts p = d.getPostByPid(postId);
%>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getpTitle() %></title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"></script>
<script scr="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>

<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
.banner-background {
	clip-path: polygon(50% 0%, 100% 1%, 100% 35%, 100% 85%, 85% 95%, 61% 100%, 26% 92%,
		0 99%, 0% 35%, 0 0);
}
.user-info{
  font-weight: bold;
 }

.brdr{
  border: 0px;
  border-color: black;
  padding: 10px;
}

body{
  background: url(pics/bgimg1.jpg);
  background-size: cover;
  background-attachment: fixed;
}
</style>
<meta content='maximum-scale=1.0, initial-scale=1.0, width=device-width' name='viewport'>
<script src="js/myjs.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg primarybackground text-white">
		<a class="navbar-brand" href="#"><span class="fa fa-gears"></span>
			TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-institution"></span> Home <span
						class="sr-only">(current)</span></a></li>


				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-phone"></span> Contact Us</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#addpost-modal"><span 
						class="fa fa-phone"></span>Add Post</a></li>
			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user"></span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-user-circle"> Logout</span></a></li>

			</ul>

		</div>
	</nav>
	


<!-- main body -->

<div class="container">

	<div class="row">
		<div class="col-md-8 offset-md-2">
		
			<div class="card">
				<div class="card-header text-center primarybackground my-2">
				
				<h3><%= p.getpTitle() %></h3>
				
				</div>
				
				<div class="card-body">
					<img class="card-img-top" src="pics/<%= p.getpPic() %>" width="600" height="400"/>
					
					<div class="row my-3 brdr">
						<div class="col-md-8">
						<% UserDao dao = new UserDao();
							User user1 = dao.getUserbyUserId(p.getUserid());
							LikeDao ldao = new LikeDao();
						%>
							<p class="user-info"><a href="#!"><%= user1.getName() %></a> has posted : </p>
						</div>
						
						<div class="col-md-4">
							<p><%= p.getDate().toLocaleString() %></p>
						</div>
					
					
					</div>
					
					<h5><%= p.getpContent() %></h5>
					<br>
					<br>
					<p><%= p.getpCode() %></p>
				</div>
				
				 <div class="card-footer primarybackground text-center">
		  		
		  		<a href="javascript:void(0)" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLike(p.getPid()) %></span></i></a>
		  		<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting">20</i></a>
		  </div>
			</div>
		
		</div>
	
	</div>
</div>




</body>
</html>