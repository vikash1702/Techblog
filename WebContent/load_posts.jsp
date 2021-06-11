<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tech.blog.dao.PostDao"%>
    <%@ page import="java.util.*"%>
    <%@ page import="com.tech.blog.entities.Posts"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row">
<%
	PostDao d = new PostDao();
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Posts> posts ;
	if(cid==0){
	 posts = d.getAllPost();
	}else{
	 posts = d.getPostByCid(cid);
	}
	for (Posts p : posts){
%>
<div class="col-md-6 mt-2">
	<div class="card">
	<img class="card-img-top" src="pics/<%= p.getpPic() %>" width="300" height="300"/>
		<div class="card-body">
		   <b><%= p.getpTitle() %></b>
		   <p><%= p.getpContent() %></p>
		  <div class="card-footer text-center">
		  		<a href="show_post.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More</a>
		  		<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i></a>
		  		<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting"></i></a>
		  </div>
		</div>
	</div>

</div>

<%
	}
%>
</div>
</body>
</html>