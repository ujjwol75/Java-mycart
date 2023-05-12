<%@page import="java.util.Map"%>
<%@page import="com.helper.helper"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.User,com.helper.Message"%>
<%
 User u=(User)session.getAttribute("current-user");
if(u==null){
	Message m=new Message("You are not Logged in!! Login first", "text-white", "danger");
	session.setAttribute("msg",m);
	response.sendRedirect("Login.jsp");
	return;
}
else{
	if(u.getUserType().equals("normalUser")){
	Message m=new Message("You are not Admin.You can't access this page!!!!!", "text-white", "danger");
	session.setAttribute("msg",m);
	response.sendRedirect("Login.jsp");
	return;
}
}
%>
   <%
       		     Categorydao cat=new Categorydao(FactoryProvider.getFactory());
       		        	List<Category> li=	cat.getCategories();
       		       %>
       		       <%
       		   Map<String,Long> map= helper.getcounts(FactoryProvider.getFactory());
       		       
       		       %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart:Admin</title>
<style>
.blink {
  animation: blink 1s linear infinite;
}

@keyframes blink {
  50% {
    opacity: 0;
  }
}</style>
<%@include file="common_components/common_links.jsp" %>
</head>
<body>
			<%@include file="common_components/navbar.jsp" %>
		
          <div class="container admin">
          <div class="container-fluid text-center">
           <%	Message m=(Message) session.getAttribute("msg");
											 if(m!=null){
												 %>
												 <div style="font-size:25px" class="mt-3 <%=m.getCssClass() %> blink alert addcat text-white alert-dismissible fade show"   role="alert">
																	  <strong style="<%=m.getType()%>"><%=m.getContent()%></strong>
																	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"  >
																	    <span aria-hidden="true">&times;</span>
																	  </button>
																	</div>
										  <%
											 }
											 session.removeAttribute("msg");
											 %>
											 </div>
              	<div class="row mt-3">
              			<div class="col-md-4">
		              			    <div class="card text-center border border-white">
		              			    		<div id="rc1" class="card-body" >
		              			    				<div class="container" >
		              			    						<img style="max-width:150px" class="img-fluid" alt="" src="adimage/user.png">
		              			    				</div>
					              			    		<h1><%=map.get("usercount") %></h1>
					              			    		  <h3 class=" text-uppercase text-muted">Users</h3>
		              			    		</div>
		              			    </div>
              			</div>
              			<div class="col-md-4">
              			     <div class="card text-center border border-white">
		              			    		<div id="rc2" class="card-body">
		              			    		<img style="max-width:150px" class="img-fluid" alt="" src="adimage/category.png">
		              			    		<h1><%=li.size()%></h1>
		              			    		  <h3 class=" text-uppercase text-muted">categories</h3>
		              			    		</div>
		              			    </div>
              			
              			</div>
              			<div class="col-md-4">
              			     <div class="card text-center border border-white">
		              			    		<div id="rc3" class="card-body">
		              			    		<img style="max-width:150px" class="img-fluid" alt="" src="adimage/product.png">
		              			    		<h1><%=map.get("productcount") %></h1>
		              			    		  <h3 class=" text-uppercase text-muted">Products</h3>
		              			    		</div>
		              			    </div>
              			
              			</div>
              	
              	</div>
              	
              	<!-- second row -->
              	<div class="row mt-5">
              				<div class="col-md-6">
              							 <div class="card text-center border border-white " data-toggle="modal" data-target="#categorymodal">
		              			    		<div id="rc4" class="card-body">
		              			    		<img style="max-width:150px" class="img-fluid" alt="" src="adimage/addcat.png">
		              			    		<p class="mt-2">Add new Categories</p>
		              			    		  <h3 class=" text-uppercase text-muted">Add Categories</h3>
		              			    		  
		              			    		</div>
		              			    </div>
              				</div>
              				<div class="col-md-6">
              				   <div class="card text-center border border-white" data-toggle="modal" data-target="#productmodal">
		              			    		<div id="rc5" class="card-body">
		              			    		<img style="max-width:150px" class="img-fluid" alt="" src="adimage/add-product.png">
		              			    	<p class="mt-2">Add new Products</p>
		              			    		  <h3 class=" text-uppercase text-muted">Add Products</h3>
		              			    		</div>
		              			    </div>
              				</div>
              	</div>
              	
          </div>
          <!-- category modal -->

<!-- Modal -->
<div class="modal fade" id="categorymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header  navbar-color text-white">
      <div class="container text-center">
        <h3 class="modal-title " id="exampleModalLabel">Fill Category Details</h3>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		<form id="catform" action="ProductOperationServlet" method="post">
       		<input type="hidden" name="operation" value="addcategory">
       		   <div class="form-group">
       		         <input type="text"  class="form-control modalin" name="catTitle"  placeholder="Enter category title" required="required">
       		   </div>
       		     <div class="form-group">
       		         <textarea  style="height:100px;"  class="form-control modalin" name="catDescription"  placeholder="Enter category Description" required="required"></textarea>
       		   </div>
       		   <div class="container text-center">
       		   <button type="submit" class="butt btn text-white addcat">Add Category</button>
       		     <button type="button" class="btn  text-white closecat" data-dismiss="modal">Close</button>
       		   </div>
       		</form>
      </div>
    </div>
  </div>
</div>          
               <!--end of  category modal -->
              <!--start of product modal -->
              
<!-- Modal -->
<div class="modal  fade" id="productmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  navbar-color text-white">
          <div class="container text-center">
        <h3 class="modal-title " id="exampleModalLabel">Fill Product Details</h3>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="container text-center">
      <div class="modal-body">
       		<form id="productform" action="ProductOperationServlet" method="post" enctype="multipart/form-data">
       		<input type="hidden" name="operation" value="addproduct">
       		   <!-- product category -->
       		    
       		       <div class="form-group">
       		       <select  name="catID"  class="form-control modalin" id="pCat" required="required">
       		       <option selected disabled>---------Select Product  Category-------</option>
       		       <% 
       		       for(Category c:li)
       		       {
       		    	   %>
       		             <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>
       		             <%} %>
       		       </select>
       		          </div>
       		   <div class="form-group">
       		         <input type="text"  class="form-control modalin" name="proTitle"  placeholder="Enter product name" required="required">
       		   </div>
       		    <div class="form-group">
       		        <input type="number"  class="form-control modalin" name="proPrice"  placeholder="Enter price of the product" required="required">
       		       </div>
       		         <div class="form-group">
       		        <input type="number"  class="form-control modalin" name="proDiscount"  placeholder="Enter discount percentage of  the product" required="required">
       		       </div>
       		         <div class="form-group">
       		        <input type="number"  class="form-control modalin" name="proQuantity"  placeholder="Enter  product Quantity" required="required">
       		       </div>
       		     <div class="form-group">
       		         <textarea  style="height:100px;"  class="form-control modalin" name="proDescription"  placeholder="Enter Product Description" required="required"></textarea>
       		   </div>
       		       <!-- product photo -->
       		       <div class="form-group">
       		       <label for="pPic">Select picture for product:-</label>
       		       		<input id="pPic"   class="modalin" type="file" name="pPic" required="required"/>
       		       </div>
       		   <div class="container text-center">
       		   <button type="submit" class="butt btn text-white addcat">Add Product</button>
       		     <button type="button" class="btn  text-white closecat" data-dismiss="modal">Close</button>
       		   </div>
       		</form>
      </div>
       </div>
    </div>
  </div>
</div>
                 <!--end of product modal -->
                 	<%@include file="common_components/common_modals.jsp" %>
</body>

				
</html>