<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<title>Account</title>
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
	.container{
		display: flex;
		flex-direction:column;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 70vh;
		gap:10px;
	}
	input{
		width: 400px;
		padding: 14px;
		background: #E2E8F0;
		border: none;
		outline: none;
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
		</div>
		<h1>account</h1>
	</header>
	
	 
    
  	
	<form action="http://localhost:8090/mshop/update" method="get" class="container">
		<img alt="" style="width: 200px" src="https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-No-Background.png">
		<input type="text" name="name" placeholder="tharusha" value="<c:out value='${name}' />">
		<input type="text" name="number" placeholder="0765577610" value="<c:out value='${number}' />">
		<input style="background: #E2E8F0" type="submit" value="Update">
		<a href="http://localhost:8090/mshop/delete"> <input style="background: red; color: white;" type="button" value="Delete Account"></a>
	</form>
	
	
</body>
</html>