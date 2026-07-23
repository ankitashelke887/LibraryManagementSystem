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

<title>User Dashboard</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.cards{

display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:25px;

}

.card{

background:white;
padding:30px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);
text-align:center;

}

.card i{

font-size:45px;
color:#6b221d;
margin-bottom:15px;

}

.card h3{

margin:10px 0;

}

.welcome{

margin-bottom:30px;

}

</style>

</head>

<body>

<div class="container">

<aside class="sidebar">

<div class="logo">

📚 Bibliotheca

</div>

<ul>

<li class="active">
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

<li>
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

<div class="welcome">

<h2>Welcome, <%=user.getName()%> 👋</h2>

<p>Manage your library activities from your dashboard.</p>

</div>

<div class="cards">

<div class="card">

<i class="fa fa-book"></i>

<h3>Search Books</h3>

<p>Browse all available books.</p>

<a href="searchBooks.jsp" class="btn btn-primary">

Open

</a>

</div>

<div class="card">

<i class="fa fa-book-open-reader"></i>

<h3>My Issued Books</h3>

<p>View your borrowed books.</p>

<a href="myBooks.jsp" class="btn btn-primary">

View

</a>

</div>

<div class="card">

<i class="fa fa-user"></i>

<h3>My Profile</h3>

<p>Update your account details.</p>

<a href="profile.jsp" class="btn btn-primary">

Profile

</a>

</div>

</div>

</main>

</div>

</body>

</html>