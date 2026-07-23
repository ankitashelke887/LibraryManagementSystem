<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add User</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

background:white;
padding:35px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);
max-width:700px;
margin:auto;

}

.form-title{

font-size:28px;
margin-bottom:25px;
color:#6b221d;
font-weight:bold;

}

.form-group{

margin-bottom:20px;

}

.form-group label{

display:block;
margin-bottom:8px;
font-weight:600;

}

.form-group input,
.form-group textarea,
.form-group select{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
outline:none;
font-size:15px;

}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus{

border-color:#6b221d;

}

textarea{

resize:none;
height:100px;

}

.button-group{

display:flex;
gap:15px;
margin-top:20px;

}

</style>

<script>

function validate(){

let name=document.forms["userForm"]["name"].value.trim();
let email=document.forms["userForm"]["email"].value.trim();
let phone=document.forms["userForm"]["phone"].value.trim();
let password=document.forms["userForm"]["password"].value;
let confirm=document.forms["userForm"]["confirmPassword"].value;

if(name==""){

alert("Enter Name");
return false;

}

if(email==""){

alert("Enter Email");
return false;

}

let emailPattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

if(!email.match(emailPattern)){

alert("Invalid Email");
return false;

}

if(phone.length!=10){

alert("Phone Number should be 10 digits");
return false;

}

if(password.length<6){

alert("Password should be at least 6 characters");
return false;

}

if(password!=confirm){

alert("Passwords do not match");
return false;

}

return true;

}

</script>

</head>

<body>

<div class="container">

<!-- Sidebar -->

<aside class="sidebar">

<div class="logo">

📚 Bibliotheca

</div>

<ul>

<li><a href="dashboard.jsp"><i class="fa fa-house"></i> Dashboard</a></li>

<li class="active"><a href="users.jsp"><i class="fa fa-users"></i> Users</a></li>

<li><a href="books.jsp"><i class="fa fa-book"></i> Books</a></li>

<li><a href="authors.jsp"><i class="fa fa-pen"></i> Authors</a></li>

<li><a href="categories.jsp"><i class="fa fa-layer-group"></i> Categories</a></li>

<li><a href="publishers.jsp"><i class="fa fa-building"></i> Publishers</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-sign-out-alt"></i> Logout</a></li>

</ul>

</aside>

<!-- Main -->

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-user-plus"></i>

Add New User

</div>

<form
name="userForm"
action="../AddUserServlet"
method="post"
onsubmit="return validate()">

<div class="form-group">

<label>Full Name</label>

<input
type="text"
name="name"
placeholder="Enter Full Name"
required>

</div>

<div class="form-group">

<label>Email</label>

<input
type="email"
name="email"
placeholder="Enter Email"
required>

</div>

<div class="form-group">

<label>Phone Number</label>

<input
type="text"
name="phone"
maxlength="10"
placeholder="9876543210"
required>

</div>

<div class="form-group">

<label>Address</label>

<textarea
name="address"
placeholder="Enter Address"
required></textarea>

</div>

<div class="form-group">

<label>Password</label>

<input
type="password"
name="password"
placeholder="Create Password"
required>

</div>

<div class="form-group">

<label>Confirm Password</label>

<input
type="password"
name="confirmPassword"
placeholder="Confirm Password"
required>

</div>

<div class="form-group">

<label>Status</label>

<select name="status">

<option value="Active">Active</option>

<option value="Inactive">Inactive</option>

</select>

</div>

<div class="button-group">

<button class="btn btn-primary" type="submit">

<i class="fa fa-save"></i>

Save User

</button>

<a href="users.jsp" class="btn btn-danger">

<i class="fa fa-arrow-left"></i>

Cancel

</a>

</div>

</form>

</div>

</main>

</div>

</body>
</html>