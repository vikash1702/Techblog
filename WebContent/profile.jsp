<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.User"%>
<%@ page import="com.tech.blog.entities.Category"%>
<%@ page import="com.tech.blog.dao.PostDao"%>
<%@ page import="java.util.ArrayList"%>
<%
	User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

body{
  background: url(pics/bgimg3.jpg);
  background-size: cover;
  background-attachment: fixed;
}
</style>
<meta content='maximum-scale=1.0, initial-scale=1.0, width=device-width' name='viewport'>
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
	
	
	
	
	
	
<main>
<div class="container">
   <div class="row">
   		<!-- first col -->
   		<div class="col-md-4">
   		
   		<!-- categories -->
   		<a href="#" onclick="getPosts(0,this)" class="list-group-item list-group-item-action c-link">All Posts</a>
   		  <%  ArrayList<Category> list1 = PostDao.getAllCategories();
   		  		for (Category cc : list1){
   		  	%>
   		  		<a href="#" onclick="getPosts(<%=cc.getCid() %>,this)" class="list-group-item list-group-item-action c-link"><%= cc.getName() %></a>
   		  	<% 		
   		  		}
   		  %>
   		</div>
   		
   		<!-- second col -->
   		<div class="col-md-8">
   		     <!-- posts -->
   		     <div class="container text-center" id="loader">
   		     	<i class="fa fa-refresh fa-4x fa-spin"></i>
   		     	<h3 class="mt-2">Loading...</h3>
   		     </div>
   		     <div class="container-fluid" id="post-container">
   		     
   		     </div>
   		     
   		</div>
   </div>
</div>
</main>









<!-- post modal -->
		
<div class="modal fade" id="addpost-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primarybackground">
					<h3 class="modal-title container text-center"
						id="exampleModalLabel">Add Post</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
      <div class="modal-body">
        
        <form action="AddPost" method="post" enctype="multipart/form-data">
        
        <div class="form-group">
        <select class="form-control" name="cid">
        <option selected disabled>---Select Category---</option>
        <%
        ArrayList<Category> list = PostDao.getAllCategories();
        for(Category c : list){
        
        %>
        <option value="<%= c.getCid() %>"><%= c.getName() %></option>
        <%
        }
        %>
        </select>
        
        </div>
        
        
         <div class="form-group">
         <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control"/>
         </div>
        
         <div class="form-group">
         <textarea placeholder="Enter Post Content" name="pContent" style="height: 100px;" class="form-control"></textarea>
         </div>
         
         <div class="form-group">
         <textarea placeholder="Enter Code(if any)" name="pCode" style="height: 100px;" class="form-control"></textarea>
         </div>
        
         <div class="form-group">
          <label>Select Post Picture...</label>
          <br>
          <input name="pic" type="file">
         </div>
        <br>
        <br>
        <br>
        <div class="container text-center">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
           <button type="submit" id="add-post-form" class="btn btn-primary">Save changes</button>
        </div>
        
         </form>
      </div>
     
    </div>
  </div>
</div>
<!-- Modal -->


	<!-- Button trigger modal -->

	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primarybackground">
					<h3 class="modal-title container text-center"
						id="exampleModalLabel">Tech Blog</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getPicture()%>" class="ima-fluid"
							style="border-radius: 50%; max-width: 100px;"> <br>
						<h3><%=user.getName()%></h3>
						<br>
					</div>
					<div class="container" id="profile-details">
						<table class="table">

							<tbody>
								<tr>
									<th scope="row">Email</th>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">Gender</th>
									<td><%=user.getGender()%></td>

								</tr>
								<tr>
									<th scope="row">About</th>
									<td><%=user.getAbout()%></td>

								</tr>
								<tr>
									<th scope="row">Register Date</th>
									<td><%=user.getDate()%></td>

								</tr>
							</tbody>
						</table>
					</div>
					<div class="container text-center" id="profile-edit"
						style="display: none;">
						<h3>Please Edit Here</h3>
						<form action="EditServlet" method="post" enctype="multipart/form-data">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									
									<tr>
										<th scope="row">Name</th>
										<td><input type="text" class="form-control"
											value="<%=user.getName()%>" id="user_name" name="user_name"></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input type="password" class="form-control"
											id="user_password" name="user_password"
											value="<%=user.getPassword()%>"></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><input type="radio" id="gender"  name="gender"
											value="male"> Male      <input type="radio"
											 id="gender" name="gender" value="female"> Female</td>

									</tr>
									<tr>
										<th scope="row">About</th>
										<td><textarea class="form-control" id="user_about"
												name="user_about"><%=user.getAbout()%></textarea></td>

									</tr>
									<tr>
										<th scope="row">Photo</th>
										<td><input type="file" class="form-control"
											id="user_profile" name="user_profile"></td>

									</tr>
								</tbody>
							</table>
							<button type="submit" class="btn btn-outline-primary">Save</button>
						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary"
							id="edit-profile-button">Edit</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- javascript -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"
			integrity="sha256-CSXorXvZcTka1x6Yvo6HppcZGetbYMGWSF1Bw8HfCJo="
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
		<script src="js/myjs.js" type="text/javascript"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		<script>
			$(document).ready(function() {
				let editStatus = false;

				$("#edit-profile-button").click(function() {
					if (editStatus == false) {
						$("#profile-details").hide()

						$("#profile-edit").show();
						editStatus = true;
						$(this).text("Back")
					} else {
						$("#profile-details").show()

						$("#profile-edit").hide();
						editStatus = false;
						$(this).text("Edit")
					}
				})

			});
		</script>
		
		<script>
			$(document).ready(function (e) {
				
				$("#add-post-form").on("submit",function(event){
				
					event.preventDefault();
					
					let form = new FormData(this);
					
					$.ajax({
						
						url: "AddPost",
						type: "POST",
						data: form,
						success: function (data, textstatus,jqXHR){
							swal("Good job","Post Saved Successfully","success");
						},
						error: function (data, textstatus, jqXHR){
							swal("Error","Something went wrong","error");
						},
						processData: false,
						contentType: false
						
					})
					
				})
			});
		</script>
		
		<!-- loading post using ajax -->
		<script>
		
		function getPosts(cid,temp){
			$(".c-link").removeClass('active')
			$.ajax({
				url: "load_posts.jsp",
				data:{cid:cid},
				success: function (data, textStatus, jqXHR){
					console.log(data);
					$("#loader").hide();
					$("#post-container").html(data)
					$(temp).addClass('active')
				}
			})
		}
			$(document).ready(function (e){
				let getPostRef = $('.c-link')[0]
				getPosts(0,getPostRef);
				
			})
		
		
		
		
		</script>
</body>
</html>