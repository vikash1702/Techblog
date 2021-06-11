<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
	<meta content='maximum-scale=1.0, initial-scale=1.0, width=device-width' name='viewport'>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container-fluid " >
<div class="row">

<div class="col-sm-6 offset-md-3 mt-5">

<div class="card">

<div class="card-header text-center text-white" style="background-color:blue"><span class="fa fa-user-plus fa-3x"></span><br>Register Here</div>
<div class="card-body">
<form id="reg-form" action="RegisterServlet" method="post">
<div class="form-group">
    <label for="UserName">User Name</label>
    <input type="text" class="form-control" id="UserName" name="UserName" placeholder="User Name">
  </div>
  <div class="form-group">
    <label for="Email">Email address</label>
    <input type="email" class="form-control" id="Email" name="Email" placeholder="email@example.com">
  </div>
  <div class="form-group">
    <label for="Password">Password</label>
    <input type="password" class="form-control" id="Password" name="Password" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="gender">Gender</label>
    <br>
    <input type="radio"  id="gender" name="gender" value="male"> Male
    <br>
    <input type="radio"  id="gender" name="gender" value="female"> Female
  </div>
  <div class="form-group">
    <label for="About">About</label>
    <input type="text" class="form-control" id="About" name="About" placeholder="Write Something about yourself.">
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="Check" name="Check">
    <label class="form-check-label" for="Check">
      Agree terms and conditions
    </label>
  </div>
  <br>
  <div class="container text-center" id="loader" style="display:none;">
        <span class="fa fa-refresh fa-spin fa-4x"></span>
        <h4>Please wait....</h4>
  </div>
  <button id="submit-btn" type="submit" class="btn btn-primary">Register</button>
</form></div>
</div>
</div>
</div>

</div>


<!--javascript-->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTka1x6Yvo6HppcZGetbYMGWSF1Bw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
   $(document).ready(function () {
	   console.log("loaded.......")
	   
	   $('#reg-form').on('submit', function (event){
		  event.preventDefault();
		  
		  
		  let form = new FormData(this);
		  
		  $("#submit-btn").hide();
		  $("#loader").show();
		  //send register servlet:
			  $.ajax({
				  url: "RegisterServlet",
				  type: 'POST',
				  data: form,
				  success: function (data, textstatus,jqXHR){
					  console.log(data)
					  
					  $("#submit-btn").show();
					  $("#loader").hide();
					  
					  if (data.trim() === 'done')
						  {
					  swal("Registered Successfully....")
					         .then((value) = {
					        	 window.location = "login.jsp"
					         });
						  }else
							  {
							  swal(data);
							  }
				  },
				  error: function (jqXHR, textstatus, errorThrown) {
					  $("#submit-btn").show();
					  $("#loader").hide();
					  
					  swal("Something went wrong....")
					 
				  },
				  processData: false,
				  contentType: false
			  });
		   
	   });
	   
   });


</script>


</body>
</html>