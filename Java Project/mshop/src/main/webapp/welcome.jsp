<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<title>Mshop</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
	body{
	font-family: 'Poppins', sans-serif;
	position: absolute;
	background: #edeff2;
	}
	*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	}
	a{
	text-decoration: none;
	color: black;
	}
	
	.carts{
		display: flex;
		flex-wrap:wrap;
		gap:30px;
		padding: 10px 170px;
	}
	.cart{
		background: white;
		margin: 10px ;
		width: 250px;
		min-height: 240px;
		text-align: left;
		border-radius: 4px;
		padding: 10px;
	}
	.top-header{
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 15px 50px;
		
		background: white;
		
	}
	.top-header-menu{
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap:20px;
	}
	.top-header-menu > div,.top-header-menu a > div  {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap:5px;
	}
	nav{
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 10px 170px;
	}
	.material-symbols-outlined{
	font-size: 18px}
	
	.brand-name{
		font-size: 23px;
	}
	
	.slider{
		margin: 10px 170px;
		background: url("https://img.freepik.com/free-vector/realism-hand-drawn-horizontal-banner_23-2150203461.jpg");
		border-radius:4px;
		height: 40vh;
	}
	
	.cart-model{
		position: fixed;
		display:flex;
		flex-direction:column;
		gap:16px;
		top: 0;
		right: 0;
		background:white;
		width: 30vw; 
		min-height: 100vh;
		padding: 30px;
		display: none;
		border-left: 1px solid gray;
		z-index: 99;
		text-align: left;
		overflow: auto; 
	}
	
	.cartmodel-head{
		display: flex;
		justify-content: space-between;
	}
	
	#cart-items-list >  li{
		display: flex;
		justify-content:space-between;
		padding: 18px;
		margin: 10px 0;
		border-bottom: 1px solid gray;
	}
	
	button{
		padding: 10px;
		background: #E2E8F0;
		outline: none;
		border: none;
		font-weight: bold;
		margin: 0 auto;
		border-radius: 4px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		cursor: pointer;
		
	}
	.price{
		color: red;
	}
	
	#showCart{
		position: relative;
	}
	
	.count{
		position: absolute;
		bottom:0;
		left: 0;
		background: red;
		color:white;
		padding: 5px;
		border-radius: 50%;
		width: 20px;
		height: 20px;
		font-size: 14px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	#total-price{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	
        
	
</style>
</head>
<body >
	
	
	<div class="cart-model" id="cartModel">
        <div class="cartmodel-head">
            <span class="close-button" style="cursor: pointer; font-size: 22px" id="closeCart">&times;</span>
            <h3>Cart </h3>
        </div>
        <ul id="cart-items-list">
            <!-- Cart items will be displayed here -->
        </ul>
        <div id="total-price"></div> <br>
        <button style=" margin-top:20px;  background: red;color: white;" onclick="sendCartDataToAPI()">PROCEED TO CHECKOUT </button>
    </div>
    
    
	
	
	
	<header>
		<div class="top-header">
			Welcome to Mshop Sri Lanka
			<div class="top-header-menu">
				<div><span class="material-symbols-outlined">location_on</span>Store Locator</div>
				<div><span class="material-symbols-outlined">local_shipping</span>Track Your Order</div>
				<a href="http://localhost:8090/mshop"><div><span class="material-symbols-outlined">shopping_bag</span>Shop</div></a>
				<a href="http://localhost:8090/mshop/account"><div><span class="material-symbols-outlined">person</span>My Account</div></a>
			</div>
		</div>
		<nav>
			<h3 class="brand">Mshop</h3>
			<h3 id="showCart" ><div class="count" id="count">0</div><span i class="material-symbols-outlined " style="font-size: 33px;cursor: pointer;">shopping_bag</span></h3>
		</nav>
	</header>
	<div id="closeCart">
		<div class="slider"></div>
		<h4 style="margin: 10px 170px">items</h4>
		
	
	
		
		<div class="carts">
	        <c:forEach var="item" items="${listitem}">
	            <div class="cart" style="position: relative;">
	            	<c:out value="${item.name}" /><br><br>
	                <img style="width: 100%; auto;" src="data:image/png;base64,${item.image}" alt="Item Image"><br>
	                <div class="price"><c:out value="RS.${item.price}" /></div><br>
	                <c:out value="${item.details}" /><br><br><br>
	                <button class="add-to-cart" style="position:absolute ; bottom: 10px; margin" onclick="addToCart('${item.name}', ${item.price}, '${item.image}')"><span class="material-symbols-outlined">add_shopping_cart</span>Add to Cart</button>
	            </div>
	        </c:forEach>
	    </div>
	</div>
    
    
    <script>
        document.getElementById("showCart").addEventListener("click", function() {
            var cartModel = document.getElementById("cartModel");
            if (cartModel.style.display === "none" || cartModel.style.display === "") {
                cartModel.style.display = "block";
            } else {
                cartModel.style.display = "none";
            }
        });

        document.getElementById("closeCart").addEventListener("click", function() {
            document.getElementById("cartModel").style.display = "none";
        });
        function addToCart(name, price, image) {
            var cartItemsList = document.getElementById("cart-items-list");
            var newItem = document.createElement("li");
            newItem.innerHTML = name + "&nbsp; &nbsp; &nbsp; &nbsp; " + "RS." + price + " " + `
                <button class="remove-from-cart" onclick="removeFromCart(this)">Remove</button>
            `;
            cartItemsList.appendChild(newItem);
            document.getElementById("cartModel").style.display = "block";
            document.getElementById("count").innerHTML = cartItemsList.childElementCount;
            
            
            
            //show total price
            var total = 0;
            var cartItemsListnew = document.getElementById("cart-items-list").getElementsByTagName("li");
            var totalPriceElement = document.getElementById("total-price");
            for (var i = 0; i < cartItemsListnew.length; i++) {
              var itemText = cartItemsListnew[i].textContent;
              var itemPrice = parseFloat(itemText.split("RS.")[1]);
              total += itemPrice;
            }

            totalPriceElement.innerHTML = " <span>Total Price: RS. </span> " + total.toFixed(2); // Display total with 2 decimal places

            
            
            
        }

        function removeFromCart(button) {
            button.parentElement.remove();
            document.getElementById("count").innerHTML = parseInt(document.getElementById("count").textContent) - 1;
            
            
          //show total price
            var total = 0;
            var cartItemsListnew = document.getElementById("cart-items-list").getElementsByTagName("li");
            var totalPriceElement = document.getElementById("total-price");
            for (var i = 0; i < cartItemsListnew.length; i++) {
              var itemText = cartItemsListnew[i].textContent;
              var itemPrice = parseFloat(itemText.split("RS.")[1]);
              total += itemPrice;
            }

            totalPriceElement.innerHTML = " <span>Total Price: RS. </span> " + total.toFixed(2); // Display total with 2 decimal places
        }
        
        
        
        function sendCartDataToAPI() {
            // Get the cart items as an array of objects
            var cartItems = [];
            var cartItemsList = document.getElementById("cart-items-list").getElementsByTagName("li");
            
            for (var i = 0; i < cartItemsList.length; i++) {
                var itemText = cartItemsList[i].textContent;
                var itemName = itemText.split("RS.")[0].trim();
                var itemPrice = parseFloat(itemText.split("RS.")[1]);
                
                cartItems.push({
                    name: itemName,
                    price: itemPrice
                });
            }
            
            console.log(cartItems);
            
            // Define the API endpoint
            var apiUrl = "https://example.com/api/cart";

            // Prepare the data to send
            var data = {
                cartItems: cartItems
            };

            // Make the POST request
            fetch(apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            })
            .then(response => response.json())
            .then(data => {
                // Handle the API response here, if needed
                console.log("API response:", data);
            })
            .catch(error => {
                // Handle errors
                console.error("Error:", error);
            });
        }

    </script>
	
	

</body>
</html>