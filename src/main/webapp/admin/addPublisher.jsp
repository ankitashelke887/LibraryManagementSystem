<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Publisher</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

max-width:750px;
margin:auto;
background:#fff;
padding:35px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);

}

.form-title{

font-size:28px;
font-weight:bold;
color:#6b221d;
margin-bottom:25px;

}

.form-group{

margin-bottom:18px;

}

.form-group label{

display:block;
margin-bottom:8px;
font-weight:600;

}

.form-group input,
.form-group textarea{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
outline:none;
font-size:15px;

}

.form-group input:focus,
.form-group textarea:focus{

border-color:#6b221d;

}

textarea{

height:120px;
resize:none;

}

.buttons{

display:flex;
gap:15px;
margin-top:25px;

}

</style>

<script>

function validate(){

let name=document.forms["publisherForm"]["publisherName"].value.trim();
let phone=document.forms["publisherForm"]["phone"].value.trim();
let email=document.forms["publisherForm"]["email"].value.trim();

if(name==""){

alert("Publisher Name is required");
return false;

}

if(phone.length!=10){

alert("Phone Number must contain 10 digits");
return false;

}

let pattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

if(!email.match(pattern)){

alert("Enter a valid Email Address");
return false;

}

return true;

}

</script>

</head>

<body>

<div class="container">

<aside class="sidebar">

<div class="logo">
📚 Bibliotheca
</div>

<ul>

<li><a href="dashboard.jsp"><i class="fa fa-house"></i> Dashboard</a></li>

<li><a href="books.jsp"><i class="fa fa-book"></i> Books</a></li>

<li class="active"><a href="publishers.jsp"><i class="fa fa-building"></i> Publishers</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-building"></i>

Add Publisher

</div>

<form
name="publisherForm"
action="../AddPublisherServlet"
method="post"
onsubmit="return validate()">

<div class="form-group">

<label>Publisher Name</label>

<input
type="text"
name="publisherName"
placeholder="Enter Publisher Name"
required>

</div>

<div class="form-group">

<label>Address</label>

<textarea
name="address"
placeholder="Enter Address"></textarea>

</div>

<div class="form-group">

<label>Phone</label>

<input
type="text"
name="phone"
maxlength="10"
placeholder="9876543210"
required>

</div>

<div class="form-group">

<label>Email</label>

<input
type="email"
name="email"
placeholder="publisher@email.com"
required>

</div>

<div class="buttons">

<button
type="submit"
class="btn btn-primary">

<i class="fa fa-save"></i>

Save Publisher

</button>

<a
href="publishers.jsp"
class="btn btn-danger">

Cancel

</a>

</div>

</form>

</div>

</main>

</div>

</body>
</html>