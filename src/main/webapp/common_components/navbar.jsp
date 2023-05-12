<%@page import="com.entities.User,com.helper.Message"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.FactoryProvider"%>
<%
User u1=(User)session.getAttribute("current-user");
%>
<nav id="nav" class=" navbar navbar-expand-lg navbar-light navbar-color ">
        <div class="container">
          <a class="navbar-brand"  id="logo" href="index.jsp">Devorah Closet</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
              <li class="nav-item active">
                <a id="links" class="nav-link" href="index.jsp">Home </a>
              </li>
             
          
              
              </li>
              <li class="nav-item">
                <a id="links" class="nav-link" href="#"><span class="fa fa-address-card-o"></span>Contact</a>
              </li>
            
            </ul>
             <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
              <li class="nav-item">
                  <a data-toggle="modal" data-target="#cart-modal"  class="nav-link" href="#"><i class="fa fa-cart-plus " style="font-size:25px;color:#29B6F6"></i><span class="cart-items" style="font-size:13px;color:#29B6F6">(0)</span></a>
                </li>
               <%
              if(u1==null){
            	  %>
            	  <li class="nav-item">
                  <a id="links" class="nav-link" href="Login.jsp"><span class="fa fa-user-circle "></span>  Login</a>
                </li>
                <li class="nav-item">
                  <a id="links" class="nav-link" href="Register.jsp"><span class="fa fa-user-plus"></span> Sign Up</a>
                </li>
                <%
                 }else{
            	 %>
            	 <li class="nav-item" >
                  <a  class="btn btn-outline-light"  href="<%
                  if(u1.getUserType().equals("normalUser"))
                  {
                  %>normal.jsp
                  <%
                  } 
                 else if(u1.getUserType().equals("adminUser"))
                  {
                	  %>admin.jsp<% 
                  }
                  %>" id="links" class="nav-link"><span class="fa fa-user-circle "></span><%=u1.getUserName()%></a>
                </li>
                <li class="nav-item">
                  <a id="links" class="nav-link" href="LogoutServlet"><span class="fa fa-user-minus"></span> LogOut</a>
                </li>
            	 <%
              }
              %>
               
             </ul>
          </div>
          </div>
        </nav>