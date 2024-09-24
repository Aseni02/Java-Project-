<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivery Manager</title>
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
	
	
	
	
        /* Global Styles */
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
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th{
        text-align: center;
        padding: 10px;}
        table, th, td {
            border: 1px solid black;
        }
         td {
            padding: 10px;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 50%;
  			left: 50%;
  			transform: translate(-50%, -50%);
  			padding:130px 30vw;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
            align-items: center;
            justify-content: center;
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
        }
        .close {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
            cursor: pointer;
        }
        .close:hover {
            color: red;
        }
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
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
        .actionRow{
        	display: flex;
        	justify-content: space-around;
        	border:none;
        	border-bottom: 1px solid;
        }
        .btn-delete{
        	background: red;
        	color: white;
        }
        .titlediv{
        display: flex;
        justify-content: space-between;
        margin: 15px 10vw;
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
    <div class="titlediv">
    	<h1>Delivery manage</h1>
    	<a href="http://localhost:8090/mshop/adddelivery"><button><span class="material-symbols-outlined">add</span>Add Delivery</button></a>
    </div>
</header>

<table>
    <thead>
    <tr>
    <th>ID</th>
        <th>Name</th>
        <th>Rider </th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${listDelivery}">
    <tr>
        <td style="text-align: center;">${item.id}</td>
        <td>${item.name}</td>
        <td>${item.author}</td>
        <td>${item.status}</td>
        <td class="actionRow">
            <button class="edit-button"><span class="material-symbols-outlined">edit</span>Edit</button>
            <a href="http://localhost:8090/mshop/deliverydelete?id=${item.id}"><button class="btn-delete"><span class="material-symbols-outlined">delete</span>Delete</button></a>
        </td>
    </tr>
	</c:forEach>
    
    </tbody>
</table>

<!-- Modal for editing -->
<div id="editModal" class="modal">
    <div class="modal-content">
        
        <h2><span class="material-symbols-outlined">update</span> Update Delivery</h2>
        <form action="http://localhost:8090/mshop/deliveryupdate" method="get">
        	<span class="close">&times;</span>
        	<div class="form-group">
                <label for="name">ID:</label>
                <input  type="text" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="author">Rider :</label>
                <input type="text" id="author" name="author">
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status">
            </div>
            <br>
            <button type="submit" id="saveButton"><span class="material-symbols-outlined">update</span>Update</button>
        </form>
    </div>
</div>

<script>
    // JavaScript for modal functionality
    var modal = document.getElementById("editModal");
    var editButtons = document.querySelectorAll(".edit-button");
    var closeButton = document.getElementsByClassName("close")[0];
    var saveButton = document.getElementById("saveButton");

    // Function to open the modal and populate data
    function openModal(row) {
        var cells = row.getElementsByTagName("td");
        document.getElementById("id").value = cells[0].textContent;
        document.getElementById("name").value = cells[1].textContent;
        document.getElementById("author").value = cells[2].textContent;
        document.getElementById("status").value = cells[3].textContent;
        modal.style.display = "block";
    }

    // Attach click event to Edit buttons
    editButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            var row = this.parentElement.parentElement;
            openModal(row);
        });
    });

    // Close the modal when the X button is clicked
    closeButton.onclick = function() {
        modal.style.display = "none";
    };

    // Close the modal when the Save button is clicked
    saveButton.onclick = function() {
        modal.style.display = "none";
    };

    // Close the modal if the user clicks outside of it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };
</script>
</body>
</html>
