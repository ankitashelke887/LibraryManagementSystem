<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login | Bibliotheca</title>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{

height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#f8f2e9,#efe4d2);

}

.container{

width:100%;
display:flex;
justify-content:center;
padding:20px;

}

.login-card{

width:420px;
padding:40px;
border-radius:20px;
background:rgba(255,255,255,.35);
backdrop-filter:blur(18px);
box-shadow:0 15px 35px rgba(0,0,0,.15);

}

.logo{

text-align:center;
font-size:34px;
font-family:'Playfair Display',serif;
color:#6b221d;
margin-bottom:8px;

}

.subtitle{

text-align:center;
color:#666;
margin-bottom:30px;

}

.input-group{

margin-bottom:18px;

}

label{

display:block;
margin-bottom:8px;
font-weight:600;

}

input,select{

width:100%;
padding:14px;
border-radius:10px;
border:1px solid #ccc;
outline:none;
font-size:15px;
transition:.3s;

}

input:focus,
select:focus{

border-color:#6b221d;
box-shadow:0 0 8px rgba(107,34,29,.3);

}

button{

width:100%;
padding:15px;
margin-top:10px;
border:none;
border-radius:10px;
background:#6b221d;
color:white;
font-size:16px;
font-weight:600;
cursor:pointer;
transition:.3s;

}

button:hover{

background:#4e1714;

}

.links{

margin-top:20px;
display:flex;
justify-content:space-between;

}

.links a{

text-decoration:none;
color:#6b221d;
font-size:14px;
font-weight:600;

}

.error{

color:red;
font-size:13px;
margin-top:5px;
display:none;

}

.home{

text-align:center;
margin-top:25px;

}

.home a{

text-decoration:none;
color:#6b221d;
font-weight:600;

}

</style>

<script>

function validateForm(){

let email=document.getElementById("email").value.trim();
let password=document.getElementById("password").value.trim();

if(email==""){

alert("Email is required");
return false;

}

if(password==""){

alert("Password is required");
return false;

}

if(password.length<6){

alert("Password must contain at least 6 characters");
return false;

}

return true;

}

</script>

</head>

<body>

<div class="container">

<div class="login-card">

<div class="logo">📚 Bibliotheca</div>

<p class="subtitle">
Sign in to continue
</p>

<form action="LoginServlet" method="post" onsubmit="return validateForm()">

<div class="input-group">

<label>Login As</label>

<select name="role">

<option value="user">User</option>

<option value="admin">Admin</option>

</select>

</div>

<div class="input-group">

<label>Email</label>

<input
type="email"
name="email"
id="email"
placeholder="Enter your email"
required>

</div>

<div class="input-group">

<label>Password</label>

<input
type="password"
name="password"
id="password"
placeholder="Enter password"
required>

</div>

<button type="submit">
Login
</button>

</form>

<div class="links">

<a href="register.jsp">Create Account</a>

<a href="#">Forgot Password?</a>

</div>

<div class="home">

<a href="index.jsp">← Back to Home</a>

</div>

</div>

</div>

</body>
</html>