<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Bibliotheca | Library Management System</title>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{

background:#f8f2e9;
color:#2d1d17;

}

nav{

height:70px;
display:flex;
justify-content:space-between;
align-items:center;
padding:0 70px;
background:white;
border-bottom:1px solid #ddd;

}

.logo{

font-size:30px;
font-family:'Playfair Display',serif;
font-weight:bold;
color:#6b221d;

}

nav ul{

display:flex;
list-style:none;
gap:30px;
align-items:center;

}

nav a{

text-decoration:none;
color:#333;
font-weight:500;

}

.btn{

padding:12px 28px;
background:#6b221d;
color:white;
border-radius:8px;
text-decoration:none;
transition:.3s;

}

.btn:hover{

background:#4f1714;

}

.hero{

width:100%;
padding:90px 10%;
text-align:center;

}

.hero h1{

font-family:'Playfair Display',serif;
font-size:70px;
line-height:85px;

}

.hero p{

margin-top:30px;
font-size:22px;
color:#555;

}

.buttons{

margin-top:40px;

}

.buttons a{

margin:10px;

}

.secondary{

background:white;
color:#6b221d;
border:1px solid #6b221d;

}

.cards{

display:grid;
grid-template-columns:repeat(3,1fr);
gap:35px;
padding:40px 10% 80px;

}

.card{

background:white;
padding:35px;
border-radius:15px;
box-shadow:0 8px 25px rgba(0,0,0,.08);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card h2{

margin-bottom:20px;
font-family:'Playfair Display',serif;

}

.card p{

line-height:28px;
color:#666;

}

footer{

text-align:center;
padding:35px;
background:white;
border-top:1px solid #ddd;

}

@media(max-width:900px){

.cards{

grid-template-columns:1fr;

}

.hero h1{

font-size:45px;
line-height:60px;

}

nav{

padding:20px;

}

}

</style>

</head>

<body>

<nav>

<div class="logo">📚 Bibliotheca</div>

<ul>

<li><a href="login.jsp">Sign In</a></li>

<li><a class="btn" href="register.jsp">Get Started</a></li>

</ul>

</nav>

<section class="hero">

<h1>A modern home for your library</h1>

<p>

Catalog books, manage members and track issued books
in one clean workspace.

</p>

<div class="buttons">

<a class="btn" href="register.jsp">Create Account</a>

<a class="btn secondary" href="login.jsp">Browse Catalog</a>

</div>

</section>

<section class="cards">

<div class="card">

<h2>📚 Curated Catalog</h2>

<p>

Browse books by category, author,
publisher and availability.

</p>

</div>

<div class="card">

<h2>👥 Member Accounts</h2>

<p>

Members can issue books,
track due dates and view history.

</p>

</div>

<div class="card">

<h2>🛡 Admin Control</h2>

<p>

Manage books, users,
authors, categories,
publishers and reports.

</p>

</div>

</section>

<footer>

© 2026 Bibliotheca | Library Management System

</footer>

</body>
</html>ok