<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.helper.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart:Login</title>
<%@include file="common_components/common_links.jsp" %>
</head>
<body>
<%@include file="common_components/navbar.jsp" %>
<div class="container text-center" id="container">                           
            <div class="mycard" id="login-card">
                <div class="row" id="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                                        <div class="myLeftCtn">
                                              <form class="my form text-center" id="myloginform" action="LoginServlet"  method="post" autocomplete="off">
                                                    <header style="margin-right:50px">Please Log In
                                                    </header>  
                                                    	<div class="container text-center">
                                                    	  <%	Message m=(Message) session.getAttribute("msg");
											 if(m!=null){
												 %>
												 <div class="alert alert-<%=m.getCssClass()%> alert-dismissible fade show"   role="alert">
																	  <strong style="<%=m.getType()%>"><%=m.getContent()%></strong>
																	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"  >
																	    <span aria-hidden="true">&times;</span>
																	  </button>
																	</div>
										  <%
											 }
											 session.removeAttribute("msg");
											 %></div>
                                                       <div class="form-group" style="margin-right: -30px; ">
                                                    <i class="fas fa-envelope" ></i>
                                                    <input class="myInput"  name="email"  type="text"  placeholder="Email"  id="email" required>
                                                    <div class="invalid-feedback">Please fill out this field</div>
                                                     </div>
                                                    <div class="form-group" style="margin-right:-30px; ">
                                                    <i class="fas fa-lock"> </i>
                                                    <input class="myInput"  name="password"  type="password"  placeholder="password"  id="password" required>
                                                      <i class="far fa-eye" id="togglePassword" style="margin-left: -30px; cursor: pointer;"></i>
                                                     </div>        
                                                               
                                                     <input type="submit" class="butt" value="Login"  style="width:120px;	">
                                                     <input type="reset" class="buttreset " value="RESET" style="width:120px;">
                                                     
                                              </form>
                                              <div class="container text-center">
                                             If you are new  <a   href="Register.jsp" style="margin-right:40px,color:red">Register from here</a>
                                        </div>
                                        </div>
                                       
                        </div>
                       
                </div>
            </div>
        </div>
        <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        togglePassword.addEventListener('click', function (e) {
          // toggle the type attribute
          const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
          password.setAttribute('type', type);
          // toggle the eye slash icon
          this.classList.toggle('fa-eye-slash');
          });
        </script>
</body>
</html>