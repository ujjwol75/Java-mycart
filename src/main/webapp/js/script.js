function add_to_Cart(pId,pName,pPrice)
{
let cart=	localStorage.getItem("cart");
	if(cart==null){
		//no cart yet
		let products=[];
		let product={productId:pId,productName:pName,productQuantity:1,productPrice:pPrice}
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		showToast( product.productName+" is added to cartQuantity="+product.productQuantity)
	}else{
		//cart is already present	
		let pcart=JSON.parse(cart);
    	let oldproduct=pcart.find((item)=>item.productId==pId)
	  console.log(oldproduct);
	if(oldproduct){
		oldproduct.productQuantity=oldproduct.productQuantity+1
		pcart.map((item)=>{
			if(item.productId===oldproduct.productId){	
		  			item.productQuantity=oldproduct.productQuantity;
			}
		})
			localStorage.setItem("cart",JSON.stringify(pcart));
	     	showToast(oldproduct.productName+" Quantity is Increased,Quantity="+oldproduct.productQuantity)
	}
	else{
		let product={productId:pId,productName:pName,productQuantity:1,productPrice:pPrice}
		 pcart.push(product)
		 localStorage.setItem("cart",JSON.stringify(pcart));
			showToast(product.productName+" is added to cart")
	}
	}
	update_cart();
}

//update cart
function update_cart(){
	let cartString =localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0){
		console.log("cart is empty");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart does not have any Items</h3>");
		 $(".checkout-btn").css("cursor","no-drop");
		$(".checkout-btn").attr('disabled',true);
		$(".checkout-btn").addClass('btn-light ');
	}
	else{
		//shome thing to show
		console.log(cart)
  	$(".cart-items").html(`(${cart.length})`);
  	let table=`
  	<table class="table">
  <thead>
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  	`;
  	let totalPrice=0;
  	cart.map((item)=>{
	table+=`
	<tr>
			<td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td>${item.productQuantity}</td>
			<td>${item.productQuantity*item.productPrice}</td>
			<td><button onclick='deleteItemfromCart(${item.productId})' class="btn-danger btn-sm">Remove</button></td>
	</tr>
	`;
	totalPrice+=item.productPrice*item.productQuantity;
	let tp=`${totalPrice}`;
	let tph=`<span id="totalpp">${totalPrice}</span>`;
		$(".Rs").html("Rs."+tp);
	let pid=`${item.productId}`;
			$("#pid").html(pid);
})
  	table=table+`
  	<tr>
  	<td colspan="5" class="text-right">Total Price:${totalPrice}</td>
  	</tr></table>`
  	$(".cart-body").html(table);
  	$(".checkout-btn").css("cursor","pointer");
  	$(".checkout-btn").removeClass('btn-light ');
  	$(".checkout-btn").addClass('btn-success '); 
  	$(".checkout-btn").attr('disabled',false );
	}
}

function deleteItemfromCart(pid){
   let cart=	JSON.parse(localStorage.getItem('cart'));
  let newcart= cart.filter((item)=>item.productId!=pid)
  localStorage.setItem('cart',JSON.stringify(newcart))
  $(".Rs").html("Rs."+00);
  update_cart();
  	showToast("Item is removed from cart")
}

$(document).ready(function(){
		update_cart();
})

function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		$("#toast").removeClass("display");
	},2000)
}


function goTocheckout(){
	window.location="checkout.jsp";
}


