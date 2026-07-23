<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
UserDTO user=(UserDTO)session.getAttribute("user");

if(user==null){
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

max-width:700px;
margin:auto;
background:white;
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

.profile-image{

text-align:center;
margin-bottom:25px;

}

.profile-image i{

font-size:90px;
color:#6b221d;

}

.form-group{

margin-bottom:20px;

}

.form-group label{

display:block;
margin-bottom:8px;
font-weight:600;

}

.form-group input{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
outline:none;

}

.form-group input:focus{

border-color:#6b221d;

}

.buttons{

display:flex;
gap:15px;
margin-top:25px;

}

</style>

<script>

function validate(){

let name=document.forms["profileForm"]["name"].value.trim();
let email=document.forms["profileForm"]["email"].value.trim();

if(name==""){

alert("Name cannot be empty.");
return false;

}

let pattern=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

if(!email.match(pattern)){

alert("Enter a valid Email Address.");
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

<li>
<a href="dashboard.jsp">
<i class="fa fa-house"></i>
Dashboard
</a>
</li>

<li>
<a href="searchBooks.jsp">
<i class="fa fa-book"></i>
Search Books
</a>
</li>

<li>
<a href="myBooks.jsp">
<i class="fa fa-book-open"></i>
My Books
</a>
</li>

<li class="active">
<a href="profile.jsp">
<i class="fa fa-user"></i>
Profile
</a>
</li>

<li>
<a href="../LogoutServlet">
<i class="fa fa-right-from-bracket"></i>
Logout
</a>
</li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="profile-image">

<i class="fa fa-circle-user"></i>

</div>

<div class="form-title">

My Profile

</div>

<form
name="profileForm"
action="../UpdateProfileServlet"
method="post"
onsubmit="return validate()">

<input
type="hidden"
name="userId"
value="<%=user.getUserId()%>">

<div class="form-group">

<label>Full Name</label>

<input
type="text"
name="name"
value="<%=user.getName()%>"
required>

</div>

<div class="form-group">

<label>Email</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

</div>

<div class="form-group">

<label>Mobile Number</label>

<input
type="text"
name="mobile"
value="<%=user.getMobile()%>"
required>

</div>

<div class="form-group">

<label>Change Password</label>

<input
type="password"
name="password"
placeholder="Leave blank to keep current password">

</div>

<div class="buttons">

<button
type="submit"
class="btn btn-primary">

<i class="fa fa-save"></i>

Update Profile

</button>

<a
href="dashboard.jsp"
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