
<style>
.footer{
background-color: #24262b;
padding: 70px 0;
}
#fotcontainer{
max-width:1170px;
margin: auto;
}
#ull{
list-style: none;
}
#fotrow{
display: flex;
flex-wrap: wrap;
}
.footer-col{
width:25%;
padding: 0 15px;
}
.footer-col h4{
font-size: 18px;
color:white;
text-transform: capitalize;
margin-bottom: 30px;
}
.footer-col ul li{
margin-bottom: 10px;
}
.footer-col ul li a{
font-size: 16px;
text-transform: capitalize;
color:white;
text-decoration: none;
font-weight: 300;
display: block;
color:#bbbbbb;
transition:all 0.3s ease;
}
.footer-col ul li a:hover{
color:white;
padding-left: 10px;
}
 .social-links a{
 transition:all 0.5s ease;
display: inline-block;
height: 40px;
width: 40px;
background-color: rgba(255,255,255,0.2);
margin:0 10px 10px 0; 
text-align: center; 
line-height: 40px;
border-radius: 50%; 
color:#ffffff;
}
 .social-links a:hover{
 color:#24262b;
 background-color:#ffffff;
 font-size: 30px;
 display: inline-block;
height: 50px;
width: 50px;
margin:0 10px 10px 0; 
text-align: center; 
line-height: 50px;
border-radius: 50%; 
 }
 .foth4{
  transition:all 0.2s ease;
   border-bottom: 1px solid #e91e62;
 }
 .foth4:hover{
 border-bottom: 2px solid #e91e63;
padding-top: 3px;

 }
 /*responsive*/
 @media(max-width:767px){
 .footer-col{
 width:50%;
 margin-bottom: 30px;
 }
 }
  @media(max-width:574px){
 .footer-col{
 width:100%;
 margin-bottom: 30px;
 }}
</style>
<footer class="footer">
		<div class="container" id="fotcontainer">
				<div class="row" id="fotrow">
						<div class="footer-col">
										<h4 class="foth4">Devorah Closet</h4>
										<ul id="ull">
													<li><a href="">about us</a></li>
													<li><a href="">Our service</a></li>
													<li><a href="">Privacy Policy</a></li>
													
										</ul>
						</div>
						<div class="footer-col">
										<h4 class="foth4">Get help</h4>
										<ul>
													<li><a href="">FAQ</a></li>
													<li><a href="">Shipping</a></li>
													<li><a href="">returns</a></li>
													<li><a href="">Order Status</a></li>
													<li><a href="">Payament Options</a></li>
										</ul>
						</div>
							<div class="footer-col">
										<h4 class="foth4">Online shop</h4>
										<ul>
													<li><a href="">watch</a></li>
													<li><a href="">bag</a></li>
													<li><a href="">Shoes</a></li>
													<li><a href="">dress</a></li>
										</ul>
						</div>
							<div class="footer-col">
										<h4 class="foth4">Follow us</h4>
										<div class="social-links">
													<a href=""><i class="fab fa-facebook-f"></i></a>
													<a href=""><i class="fab fa-twitter"></i></a>
													<a href=""><i class="fab fa-instagram"></i></a>
													<a href=""><i class="fab fa-linkedin-in"></i></a>
										</div>
						</div>
				</div>
		</div>
</footer>