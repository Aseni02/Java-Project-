<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Delivery</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
	body{
	font-family: 'Poppins', sans-serif;
	text-align: center;
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
	

        body {
            font-family: 'Poppins', sans-serif;
            text-align: center;
            background: #edeff2;
            margin: 0;
            padding: 0;
            
        }
        a {
            text-decoration: none;
            color: black;
        }
        
        
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        form{
        	padding: 20px 20vw;
        }
        
        .form-group {
            margin: 10px 0;
        }
        label {
            display: block;
            font-weight: bold;
            text-align: left;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button{
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap:5px;
        }
	
	
</style>
</head>
<body>

<header>
    <div class="top-header">
        Welcome to Mshop Sri Lanka
        <div class="top-header-menu">
            <div><span class="material-symbols-outlined">location_on</span>Store Locator</div>
            <div><span class="material-symbols-outlined">local_shipping</span>Track Your Order</div>
            <a href="http://localhost:8090/mshop"><div><span class="material-symbols-outlined">shopping_bag</span>Shop</div></a>
            <a href="http://localhost:8090/mshop/account"><div><span class="material-symbols-outlined">person</span>My Account</div></a>
        </div>
    </div><br>
    <h3>Add delivery</h3>

    <form action="http://localhost:8090/mshop/insertdelivery" method="get">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required ="required" >
            </div>
            <div class="form-group">
                <label for="author">Rider:</label>
                <input type="text" id="author" name="author" required ="required" >
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" required ="required" >
            </div>
            <br>
            <button type="submit" id="saveButton"><span class="material-symbols-outlined">add</span>Add delivery</button>
        </form>
    	
</header>



	
</body>
</html>