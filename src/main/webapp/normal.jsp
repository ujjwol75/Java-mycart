<%@page import="com.entities.User,com.helper.Message"%>
<%
 User u=(User)session.getAttribute("current-user");
if(u==null){
	Message m=new Message("You are not Logged in!! Login first", "text-white", "danger");
	session.setAttribute("msg",m);
	response.sendRedirect("Login.jsp");
	return;
}
//else{
//	if(u.getUserType().equals("normalUser")){
	//Message m=new Message("You are not Admin.You can't access this page!!!!!", "text-white", "danger");
	//session.setAttribute("msg",m);
	//response.sendRedirect("Login.jsp");
	//return;
//}
//}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="common_components/common_links.jsp" %>
</head>
<body>
			<%@include file="common_components/navbar.jsp" %>
		    <div class="container text-center" id="container">                       
            <div class="mycard" id="login-card">
                <div class="row" id="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                       <div class="container text-center ">
       <img alt="" src="img/person.png" width="150" height="150" class="img-fluid"  style="border-radius:45%">
        <h5 class="text-info display-4"><%=u.getUserName() %></h5>
        <!-- //profile details-->
        <div id="profile-details">
        <table class="table">
 
			  <tbody>
			    <tr>
			      <th scope="row">ID:</th>
			      <td><%=u.getUserID()%></td>
			    </tr>
			    <tr>
			      <th scope="row">Email:</th>
			      <td><%=u.getUserEmail()%></td>
			    </tr>
			    <tr>
			      <th scope="row">Phone</th>
			      <td><%=u.getUserPhone()%></td>
			    </tr>
			     <tr>
			      <th scope="row">Address:</th>
			      <td><%=u.getUserAddress()%></td>
			    </tr>
			     
			  </tbody>
</table>
<button   id="edit-profile-btn"  type="button"  class="btn btn-outline-info">edit</button>
</div></div>
  </div>  </div>
   </div>
  </div>
            
          
            <div id="profile-edit" style="display:none; ">
            <div class="container text-center"  >
            <div class="row">
             <div class="col-md-3"></div>
            <div class="col-md-6 ">
    		<h3 class="text-warning mt-2">Please edit carefully!!</h3>
    		<form action="EditProfileServlet"  method="post"   >
    				 <table  class="table ">
    				     <tr>
				    		  <th scope="row">ID:</th>
				  		 	   <td><%=u.getUserID()%></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Name:</th>
				  		 	   <td><input autocomplete="off" type="text"  class="form-control" name="user_name" value="<%=u.getUserName()%>"></td>
			   			 </tr>
			   			 <tr>
				    		  <th scope="row">Email:</th>
				  		 	   <td><input autocomplete="off" type="email"  class="form-control" name="user_email" value="<%=u.getUserEmail() %>"></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Password:</th>
				  		 	   <td><input autocomplete="off" type="password"  class="form-control" name="user_password" value="<%=u.getUserPassword()%>"></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Address:</th>
				  		 	   <td><input autocomplete="off" type="text"  class="form-control" name="user_address" value="<%=u.getUserAddress()%>"></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Phone Number:</th>
				  		 	   <td><input autocomplete="off" type="text"  class="form-control" name="user_phone" value="<%=u.getUserPhone() %>"></td>
			   			 </tr>
    				</table>
    			    	<div class="container">
    					 <button  type="submit"  class="btn btn-outline-success" >Update</button>
			   			</div>
    		</form>
    		</div></div>
    		</div>
    		 </div>
    			<%@include file="common_components/common_modals.jsp" %>
 <script >
						$(document).ready(function(){
							let editstatus=false;
								$("#edit-profile-btn").click(function(){
									if(editstatus==false){
									$("#profile-details").hide()
									$("#profile-edit").show();
									editstatus=true;
									$(this).text("Back")
									}
									else{
										$("#profile-details").show()
										$("#profile-edit").hide();
										editstatus=false;
										$(this).text("Edit")
									}
								})
						});
						</script>
</body>
</html>