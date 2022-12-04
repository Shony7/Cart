function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	let product = { productId: pid, productName: pname, productPrice: price, productQuantity: 1 };
	let products = []
	if (cart == null) {
		products.push((product));
		localStorage.setItem("cart", JSON.stringify(products));
	}
	else {
		let pcart = JSON.parse(cart);
		let oldproduct = pcart.find((item)=> item.productId == pid);
		if (oldproduct) {
			oldproduct.productQuantity = oldproduct.productQuantity + 1;
			pcart.map((item)=>{
				if(item.productQuantity == oldproduct.productQuantity){
					pcart.productQuantity = oldproduct.productQuantity
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
		}
		else {
			pcart.push((product));
			localStorage.setItem("cart", JSON.stringify(pcart));
		}
	}
}


//update the cart count
function updatecart(){
	let cart = JSON.parse(localStorage.getItem('cart'));
	console.log(cart)
	if(cart == null || cart.length ==0){
		console.log(cart)
		$(".cart-item").html("(0)")
		$(".cart-body").html("<h3>Cart does not have items</h3>")
		$(".checkout-btn").addClass('disabled')
	}
	else{
		//there is something in cart
		
	}
}

$(document).ready(function(){
	updatecart();r
})