<%@page import="com.helper.deshelper"%>
<%@page import="com.mysql.jdbc.SocketMetadata.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.Categorydao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Productdao"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MyCart:HOME</title>
<%@include file="common_components/common_links.jsp" %>
<style >
@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400&family=Roboto:wght@300;400;500;700;900&display=swap');
:root{
	--white-light:rgba 255,255,255,0.5;
	--alice-blue:#f8f9fa;
	--carribean-pink:#FAACA8;
	--gray:#ededed;
}
*{
padding:0;
margin:0;
box-sizing:border-box;
}
 body{
 font-family:'Quicksand',san-serif;
 }
 img{
 width:100%;
 display:block;

 }
 .container{
 width:78vw;
 margin:0 auto;
 }
 .lg-title,
 .md-title,
 .sm-title{
  font-family:'Roboto',sans-serif;
  padding
  }
 .lg title{
 font-size:2.5rem;
 font-weight:500;
 text-align:center;
 padding:1.3rem 0;
 opacity:0.9;
 }
 .md-title{
  font-size:2rem;
    font-family:'Roboto',sans-serif; 
 }
 .sm-title{
  font-weight:300;
  font-size:1rem;
  text-transform:uppercase;
 }
 .text-dark{
 font-weight:600;
 line-height:1.5;
 opacity:0.5;
   font-size:1rem;
   margin:0.4 rem 0;
 }
 .products{
 padding:3.2rem 0;
 }
 .products .text-dark
 {text-align:center;
 width:70%;
 margin:0.9rem auto;
 }
 .product{
 margin:2rem;
 position:relative;
 }
 .product-content{
 background:var(--gray);
 padding:3rem 0.5rem 2rem 0.5rem;
 cursor:pointer;
 }
 .product-img{
 background:var(--white-light);
 box-shadow: 0 0 20px 10px var(--white-light);
 width:200px;
 height:200px;
 margin:0 auto;
 border-radius:50%;
 transition:background 0.5s ease;
 }
 .product-btns{
 display:flex;
 justify-content:center;
 margin-top:1.4rem;
 opacity:0;
 transition:opacity 0.6s ease;
 }
 .btn-cart,.btn-buy{
 background:transparent;
 border:1px solid black;
 padding:0.8rem 0;
 width:125px;	
 font-family:inherit;
 text-transform:uppercase;
 cursor:pointer;
 border:none;
 transition: all 0.6s ease;
 }
 .btn-cart{
 background:black;
 color:white;
 border-radius:10px;
 }
 .btn-cart:hover {
	 background:var(	--carribean-pink);
	 color:#808080;
	}
.btn-buy{
background:white;
 border-radius:10px;
}
.btn-buy:hover {
	background:var(	--carribean-pink);
	color:#808080;
}
.products-info{
background:white;
padding:2rem ;
}
.product-info-top{
display:flex;
justify-content:space-between;
align-items:center;
}
.rating span{
color:var(--carribean-pink);
}
.product-name{
color:black;
display:block;
text-decoration:none;
font-size:1rem;
text-transform:uppercase;
font-weight:bold;
}
.product-price{
padding-top:0.6rem;
padding-right:0.6rem;
display:inline-block;
}
.product-price:first-of-type{
text-decoration:line-through;
color:var(--carribean-pink);
}
.product-img img{
transition: transform 0.6s ease;
height:200px;
}
.product-content:hover .product-img img{
transform:scale(1.1);
z-index:-1;
}
.product-content:hover .product-img{
background:var(--carribean-pink);
}
.product-content:hover .product-btns{
opacity:1;
}
.off-info .sm-title{
background:var(--carribean-pink);
color:white;
display:inline-block;
padding:0.5rem;
position:absolute;
left:0;
top:0;
writing-mode:vertical-lr;
transform:rotate(180deg);
z-index:1;
letter-spacing:3px;
cursor: pointer;
 }
 @media screen and (min-width:800px){
 .product-item{
 display:grid;
 grid-template-columns:repeat(2,1fr);
 }
 }
  @media screen and (min-width:1115px){
 .product-item{
 display:grid;
 grid-template-columns:repeat(3,1fr);
 }
 .product{
 margin-right:1rem;
 margin-left:1rem;
 }
 .products .text-dark{
 width:50%;
 }}
  @media screen and (min-width:1336px){
 .product-item{
 display:grid;
 grid-template-columns:repeat(4,1fr);
 }
 }
 .product-collection{
 padding:3.2rem 0;
left:-20%;
 }
 .product-collection-wrapper{
 padding:3.2rem 0;
 }
 .product-col-left{
 background:linear-gradient(rgba(0,0,0,0),rgba(0,0,0,0.3)),url("img/products/man-collection.jpg")center/cover no-repeat;
 }
  .product-col-r-top{
 background:linear-gradient(rgba(0,0,0,0),rgba(0,0,0,0.3)),url("img/products/womens collection.jpg")center/cover no-repeat;
 }
 .flex{
 display:flex;
 justify-content:center;
 align-items:flex-end;
 height:50vh;
 padding:2rem 1.5rem 3.2rem;
 margin:15px;
 }

 .product-col-r-buttom > div:first-child{
 background:#eaa001;
 }
 .product-col-r-buttom > div:last-child{
 background:#0090ff;
 }
 .product-col-content ,.text-p{
 text-align:center;
 color:white;
 justify-content: center;
 }
 .product-collection .text-p{
 opacity:1;
 font-size:0.8;
 font-weight:400;
 line-height:1.7;
 }
 .btn-dark{
 background:black;
 color:white;outline:0;
  border-radius:25px;
  padding:0.7rem 1rem;
  border:0;
  margin-top:1rem;
  cursor: pointer;
  transition:all 0.6s ease;
  font-size:1rem;
  font-family:inherit;
 }
 .btn-dark:hover{
 background:var(--carribean-pink);
 }
</style>
</head>
<body>
<%@include file="common_components/navbar.jsp" %>
		<div class="row mt-3 mx-2">
		       <!-- fetch produc -->
		       <%
		         String cat=  request.getParameter("category");
		       Productdao pdao=new Productdao(FactoryProvider.getFactory());
		       List<Product> list=null;
		       if(cat==null||cat.trim().equals("all")){	
		    	list= pdao.getProducts();
		       }else{
		    	   int catid=Integer.parseInt(cat.trim());
		         	list=pdao.getProducbyId(catid);
		       }
		          Categorydao cdao=new Categorydao(FactoryProvider.getFactory());
					List<Category> listofCategories=cdao.getCategories();
	            
		       %>
		           <!-- categories -->
		           <div class="col-md-2">
						<div class="list-group">
						<a href="index.jsp?category=all"  class="list-group-item list-group-item-action  allpro">All products </a>
					  <%
						 for(Category clist: listofCategories)
						 {
							%>
							  <a href="index.jsp?category=<%=clist.getCategoryId()%>" class="list-group-item list-group-item-action"><%=clist.getCategoryTitle() %></a>
							  <%
						 }
						 %>
									 </div>
					</div>
					    <!-- products -->
						<div class="col-md-10">
						<div class="products">
						<div class="container">
						<h1 class="lg-title">Special offers for new products</h1>
					<!-- 	<p class="text-dark">lasddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
						asdddddddddddasdsssss  </p>-->
						
						<div class="product-item">
					<%
			for(Product plist:list){
	%>
					<div class="product">
					<div class="product-content">
						
					<div class= "product-img">
							<img  alt="" src="img/products/<%=plist.getProductPic()%>"> 				
					</div>
			
					<div class="product-btns"> 
					<button type="button" class="btn-cart">add to cart
					<span ><i class="fas fa-plus"></i></span></button>
					<button type="button" class="btn-buy">buy now
					<span ><i class="fas fa-shopping-cart"></i></span></button>
					</div>
					</div> 
					<div class="product-info">
					<div class="product-info-top">
					<h2 class="md-title"></h2>
					<div class="rating">
				<span>	<i class="fas fa-star" ></i></span>
             	<span>	<i class="fas fa-star" ></i></span>
				<span>	<i class="fas fa-star" ></i></span>
              	<span>	<i class="far fa-star" ></i></span>
					</div>
						</div>
					<a href="#" class="product-name"><%=plist.getProductName()%></a>
					<p class="product-price">Rs.<%=plist.getProductPrice() %></p>
					<p class="product-price">Rs.
					<%=plist.getProductPrice()-(plist.getProductPrice()*plist.getProductDiscount())/100%></p>
					</div>
					<div class="off-info">
					<h2 class="sm-title"><%=plist.getProductDiscount()%>% off</h2>
					</div>
					</div>																					
	<%} 
	if(list.size()==0){%>
	<div class="container">
		<h3 class='text-info'>No items in this category</h3></div>
	<%}
	%>
	</div>
	</div>
</div>

<!-- collection show  -->
<div class="product-collection">
<div class="container">
<div class="product-collection-wrapper">
<!-- collection show left col  -->
<div class="product-col-left flex">
 <div class="product-col-content">
 <h2 class="sm-title">Men's T-shirt</h2>
  <h2 class="md-title">Men's Collection</h2>
  <p class="text-p">An essay is generally a short piece of writing outliningacademic in nature and tackle serious topics.</p>
  <a type="button" class="btn-dark " href="#" style="text-decoration:none;">Shop Now</a>
 </div>
</div>
<!-- collection show right col  -->
<div class="product-col-right">
 <div class="product-col-r-top flex">
 <div class="product-col-content">
 <h2 class="sm-title">Women's T-shirt</h2>
  <h2 class="md-title">Women's Collection</h2>
  <p class="text-p">An essay is generally a short piece of writinademic in nature and tackle serious topics.</p>
   <a type="button" class="btn-dark " href="#" style="text-decoration:none;">Shop Now</a>
 </div>
 </div>
 <div class="product-col-r-buttom">
 <!-- left -->
 <div class="flex">
 <div class="product-col-content">
 <h2 class="sm-title">Summar sale</h2>
  <h2 class="md-title">Extra 50% off</h2>
  <p class="text-p">An essay is generally a short lly academic in nature and tackle serious topics.</p>
  <a type="button" class="btn-dark " href="#" style="text-decoration:none;">Shop Now</a>
 </div>
 </div>
  <div class="flex">
   <div class="product-col-content">
 <h2 class="sm-title">Half pant</h2>
  <h2 class="md-title">Best sellers</h2>
  <p class="text-p">An essay is generally a short piece ocademic in nature and tackle serious topics.</p>
  <a type="button" class="btn-dark " href="#" style="text-decoration:none;">Shop Now</a>
 </div>
  </div>
 </div>
</div>
</div>
</div>
</div>
	</div></div>
	
	
</body>
</html>