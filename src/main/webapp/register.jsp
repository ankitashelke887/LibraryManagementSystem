<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Account | Bibliotheca</title>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{

background:linear-gradient(135deg,#f8f2e9,#efe4d2);
height:100vh;
display:flex;
justify-content:center;
align-items:center;

}

.card{

width:470px;
padding:40px;
border-radius:20px;
background:rgba(255,255,255,.35);
backdrop-filter:blur(15px);
box-shadow:0 15px 35px rgba(0,0,0,.15);

}

.logo{

text-align:center;
font-family:'Playfair Display',serif;
font-size:34px;
color:#6b221d;
margin-bottom:10px;

}

.subtitle{

text-align:center;
color:#666;
margin-bottom:30px;

}

.group{

margin-bottom:18px;

}

label{

display:block;
margin-bottom:8px;
font-weight:600;

}

input,textarea{

width:100%;
padding:14px;
border-radius:10px;
border:1px solid #ccc;
outline:none;
font-size:15px;
transition:.3s;

}

input:focus,
textarea:focus{

border-color:#6b221d;
box-shadow:0 0 8px rgba(107,34,29,.3);

}

textarea{

resize:none;
height:80px;

}

button{

width:100%;
padding:15px;
border:none;
background:#6b221d;
color:white;
font-size:16px;
font-weight:600;
border-radius:10px;
cursor:pointer;
transition:.3s;

}

button:hover{

background:#4f1714;

}

.footer{

margin-top:20px;
text-align:center;

}

.footer a{

color:#6b221d;
text-decoration:none;
font-weight:600;

}

</style>

<script>

function validate(){

let pass=document.getElementById("password").value;
let cpass=document.getElementById("confirm").value;

if(pass.length<6){

alert("Password must contain at least 6 characters");
return false;

}

if(pass!=cpass){

alert("Passwords do not match");
return false;

}

return true;

}

</script>

</head>

<body>

<div class="card">

<div class="logo">📚 Bibliotheca</div>

<p class="subtitle">
Create your library account
</p>

<form action="RegisterServlet" method="post" onsubmit="return validate()">

<div class="group">

<label>Full Name</label>

<input
type="text"
name="name"
placeholder="Enter your name"
required>

</div>

<div class="group">

<label>Email</label>

<input
type="email"
name="email"
placeholder="Enter email"
required>

</div>

<div class="group">

<label>Phone</label>

<input
type="text"
name="phone"
placeholder="Enter phone number"
required>

</div>

<div class="group">

<label>Address</label>

<textarea
name="address"
placeholder="Enter address"
required></textarea>

</div>

<div class="group">

<label>Password</label>

<input
type="password"
name="password"
id="password"
placeholder="Create password"
required>

</div>

<div class="group">

<label>Confirm Password</label>

<input
type="password"
id="confirm"
placeholder="Confirm password"
required>

</div>

<button type="submit">
Create Account
</button>

</form>

<div class="footer">

Already have an account?

<a href="login.jsp">Sign In</a>

<br><br>

<a href="index.jsp">← Back to Home</a>

</div>

</div>

</body>
</html>