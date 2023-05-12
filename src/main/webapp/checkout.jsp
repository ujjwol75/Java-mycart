<%
 User u=(User)session.getAttribute("current-user");
if(u==null){
	Message m=new Message("You are not Logged in!! Login first to access ChechOut page", "text-white", "danger");
	session.setAttribute("msg",m);
	response.sendRedirect("Login.jsp");
	return;
}

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart:chekout</title>
<%@include file="common_components/common_links.jsp" %>
		<style>
		:root{
		--first-color:#adb5bd;
		--first-color-light:#f3f3fd;		
		--second-color:#673AB7;		
		--third-color:#fff;
		--four-color:#000;
		--body-font:'Quicksand',sans-serif;
		--normal-font-size:1rem;
		}
		*,::before,::after {
	box-sizing:border-box;
}
#payment{
margin: 0;
font-family: var(--second-color);
min-height: 60vh;
display: flex;
align-items: center;
justify-content: center;
}
.main{
padding: 50px 0;
}
.paycard{
background-color: var(--third-color);
box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
border-radius: 29px;
width:400px;
}
.pay{
font-size: 18px;
color: var(--four-color);
font-weight: 600;
margin-top: 5px;
}
.amount{
background-color: var(--first-color-light);
border-radius: 8px;
}
.inner{
padding:8px 19px;
}
.Rs{
color:var(--first-color);
font-size: 20px;
font-weight: 500;
}
.total{
font-size: 20px;
font-weight: 500;
color:#6458AB;
}
.labeltxt{
font-size:13px;
color:var(--first-color);
margin-top:5px;
font-weight: 500;
}
.image{
position: relative;
top: 44px;
right: 13px;
}
.inputxt:focus{
box-shadow: none;
}
.inputxt{
color:var(--four-color)!important;
font-weight: bold;
font-size: 14px;
padding: 15px 20px;
border: 2px solid  var(--first-color);
border-radius: 7px;
}
.exptxt{
color:var(--first-color);
font-size: 13px;
font-weight: 500;

}
.cvvtxt{
color:var(--first-color);
font-size: 13px;
font-weight: 500;
}
.expiry{
font-size: 14px;
padding: 15px 20px;
width:130px;
font-weight: bold;
border: 2px solid  var(--first-color);
border-radius: 7px;
}
.cvv{
font-size: 14px;
padding: 15px 20px;
width:130px;
border: 2px solid  var(--first-color);
border-radius: 7px;
}
.cancel{
color:var(--first-color);
font-weight: 500;
font-size: 14px;
border: none;
}
.cancel:hover,
.cancel:focus {
	box-shadow: none;
	color:var(--third-color);
	background-color: var(--first-color);
}
.payment{
background-color:var(--second-color);
color:var(--third-color);
font-weight: 600;
font-size: 14px;
border: none;
padding:15px 10px;
border-radius:11px;
cursor:pointer;
width:150px;
}
.payment:hover {
	color:var(--four-color);
}
		</style>
</head>
<body>
<%@include file="common_components/navbar.jsp" %>
<div class="container">
		<div class="row mt-5">
				<div class="col-md-6 ">
						<div class="card  my-3">
						<div class="card-header   allpro"><h3 class="text-center text-white"><b>Your selected Items</b></h3></div>
							<div class="card-body " id="cartdetails">
							<div class="cart-body"></div>
							</div>
						</div>
				</div>
				<div class="col-md-6">
				<div class="card  my-3 " id="yourdetails">
						<div class="card-header   allpro"><h3 class="text-center text-white"><b>Your Details for Order</b></h3></div>
							<div class="card-body " id="cartdetails">
                                        <div class="myLeftCtn my-3">
                                              <form>
                                              <div class="form-group">
                                                  <label for="email">Email address</label>
                                                  <input value="<%=u.getUserEmail() %>" type="email" class="form-control" id="email" placeholder="Enter your email address" aria-describedby="emailHelp">
                                                  <small id="emailHelp" class="form-text text-muted" >we'll never share your details</small>                                                  
                                              </div>
                                                <div class="form-group">
                                                  <label for="name">Your name</label>
                                                  <input value="<%=u.getUserName() %>"  type="text" class="form-control" id="name" placeholder="Enter your name" aria-describedby="emailHelp">
                                                    </div>
                                                     <div class="form-group">
                                                  <label for="phone">Email address</label>
                                                  <input value="<%=u.getUserPhone() %>" type="text" class="form-control" id="phone" placeholder="Enter your valid phone number" aria-describedby="emailHelp">
                                                  <small id="emailHelp" class="form-text text-muted" >Your valid number </small>                                                  
                                              </div>
                                                    <div class="form-group">
                                                  <label for="address">Your shipping  address</label>
                                                  <input type="text"  value="<%=u.getUserAddress()%>"  class="form-control" id="address" placeholder="Ente your address" aria-describedby="emailHelp">
                                                </div>    <div class="container text-center">
                                                    <button  type="button"  id="fororder"class="btn btn-outline-success">Order Now</button>
                                                     <a href="index.jsp" class="btn btn-outline-primary ">Continue shopping</a>
                                                    </div>
                                                   
                                              </form>
                                           
                                        
                                       
							</div>
						</div>
				</div>
								
								<div class="card  my-3  allpro"  id="payment" style="display:none; "> 
								<div id="main" class="container mt-4 d-flex justify-content-center main allpro" >
								   <form action="PaymentServlet" method="get">
							             <div class="card paycard">
							               <div class=" d-flex justify-content-between px-3 pt-4 ">
							               <span class="pay">Pay amount</span>
							               <div class="amount">
							               		<div class="inner">
							               		    <div class="Rs">Rs.00</div>
							               		    <span class="total"></span>
							               		</div>
							               </div>
							               </div>
							               <div class="px-3 pt-3">
							               <label id="one" for="card-number" class="d-flex justify-content-between">
							                    <span class="labeltxt">CARD NUMBER</span>
							                    <img src="img/mastercard_logo.png"   width="25px" class="image">
							               </label>
							            
							               <input required="required" type="number" name="number" class="form-control inputxt" placeholder="8812 2515 1515 1515">
							               </div>
							        <div class="d-flex justify-content-between px-3 pt-4">
							               <div>
							               		<label for="date" class="exptxt">Expiry</label>
							               		 <input required="required" type="number" name="number" class="form-control expiry" placeholder="MM/YY ">	
							               </div>
							               <div>
							               	<label for="cvv" class="cvvtxt">CVV/CVC</label>
							               		 <input required="required" type="number" name="number" class="form-control cvv" placeholder="123 ">	
							               </div>
							     </div>
							         <div class="d-flex align-content-center justify-content-between px-3 py-4">
							         			<div>
							         			<a href="checkout.jsp" type="button" class="btn cancel">Cancel</a>
							         			</div>
							         			
							         			<div>
							         			<button type="submit" class="btn payment">Make Payment</button>
							         			</div>
							         			
							         </div>
							     
							     </div>   </form>
							               	
							     
							                  
                                                  
                                           </div>
								</div>
		</div>
</div>
</div>
	<%@include file="common_components/common_modals.jsp" %>
	<script >
						$(document).ready(function(){
							let editstatus=false;
								$("#fororder").click(function(){
									if(editstatus==false){
									$("#yourdetails").hide()
									$("#payment").show();
									editstatus=true;
									$(this).text("Pay")
									}
									else{
										$("#yourdetails").show()
										$("#payment").hide();
										editstatus=false;
										$(this).text("Order Now")
									}
								})
						});
						</script>
					
</body>
</html>