<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.DashboardDAO"%>
<%
    String admin = (String)session.getAttribute("admin");

    if(admin==null){
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">

<title>Admin Dashboard</title>
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

.container{
    display:flex;
    min-height:100vh;
}

/* Sidebar */

.sidebar{
    width:260px;
    background:#6b221d;
    color:#fff;
    position:fixed;
    left:0;
    top:0;
    bottom:0;
    overflow-y:auto;
    box-shadow:4px 0 15px rgba(0,0,0,.15);
}

.logo{
    font-size:28px;
    font-weight:700;
    text-align:center;
    padding:25px 15px;
    border-bottom:1px solid rgba(255,255,255,.2);
}

.sidebar ul{
    list-style:none;
    margin-top:20px;
}

.sidebar ul li{
    margin:8px 15px;
}

.sidebar ul li a{
    text-decoration:none;
    color:white;
    display:flex;
    align-items:center;
    gap:15px;
    padding:14px 18px;
    border-radius:10px;
    transition:.3s;
    font-size:15px;
}

.sidebar ul li a:hover,
.sidebar ul li.active a{
    background:#8d3d34;
}

.sidebar i{
    width:20px;
    text-align:center;
}

/* Main */

.main{
    flex:1;
    margin-left:260px;
    padding:30px;
}

/* Topbar */

.topbar{
    background:white;
    padding:18px 25px;
    border-radius:15px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
    margin-bottom:30px;
}

.topbar input{
    width:320px;
    padding:12px 16px;
    border:1px solid #ddd;
    border-radius:8px;
    outline:none;
    font-size:15px;
}

.topbar input:focus{
    border-color:#6b221d;
}

.profile{
    font-weight:600;
    color:#6b221d;
}

/* Dashboard Cards */

.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:25px;
    margin-bottom:35px;
}

.card{
    background:white;
    padding:25px;
    border-radius:16px;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
    transition:.3s;
}

.card:hover{
    transform:translateY(-6px);
}

.card h3{
    color:#666;
    margin-bottom:15px;
    font-size:16px;
}

.card h1{
    font-size:40px;
    color:#6b221d;
}

.card p{
    margin-top:10px;
    color:#777;
}

/* Table */

.table-section{
    background:white;
    border-radius:16px;
    padding:25px;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
}

.table-section h2{
    margin-bottom:20px;
    color:#6b221d;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#6b221d;
    color:white;
    padding:15px;
    text-align:left;
}

table td{
    padding:14px;
    border-bottom:1px solid #eee;
}

table tr:hover{
    background:#faf4ef;
}

/* Status Badges */

.badge{
    padding:6px 12px;
    border-radius:20px;
    font-size:13px;
    color:white;
    font-weight:600;
}

.success{
    background:#28a745;
}

.warning{
    background:#ffc107;
    color:#222;
}

.danger{
    background:#dc3545;
}

/* Buttons */

.btn{
    display:inline-block;
    padding:10px 18px;
    border:none;
    border-radius:8px;
    text-decoration:none;
    cursor:pointer;
    transition:.3s;
    font-weight:600;
}

.btn-primary{
    background:#6b221d;
    color:white;
}

.btn-primary:hover{
    background:#4f1714;
}

.btn-success{
    background:#28a745;
    color:white;
}

.btn-danger{
    background:#dc3545;
    color:white;
}

/* Responsive */

@media(max-width:900px){

.sidebar{
    width:75px;
}

.logo{
    font-size:18px;
}

.sidebar ul li a{
    justify-content:center;
}

.sidebar ul li a span{
    display:none;
}

.main{
    margin-left:75px;
}

.topbar{
    flex-direction:column;
    gap:15px;
}

.topbar input{
    width:100%;
}

}

@media(max-width:600px){

.cards{
    grid-template-columns:1fr;
}

table{
    display:block;
    overflow-x:auto;
}

}
</style>

<link
href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
rel="stylesheet">

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
                    <i class="fa-solid fa-house"></i>
                    Dashboard
                </a>
            </li>

            <li>
                <a href="users.jsp">
                    <i class="fa-solid fa-users"></i>
                    Users
                </a>
            </li>

            <li>
                <a href="books.jsp">
                    <i class="fa-solid fa-book"></i>
                    Books
                </a>
            </li>

            <li>
                <a href="authors.jsp">
                    <i class="fa-solid fa-pen"></i>
                    Authors
                </a>
            </li>

            <li>
                <a href="categories.jsp">
                    <i class="fa-solid fa-layer-group"></i>
                    Categories
                </a>
            </li>

            <li>
                <a href="publishers.jsp">
                    <i class="fa-solid fa-building"></i>
                    Publishers
                </a>
            </li>

            <li>
                <a href="copies.jsp">
                    <i class="fa-solid fa-copy"></i>
                    Book Copies
                </a>
            </li>

            <li>
                <a href="issueBook.jsp">
                    <i class="fa-solid fa-book-open"></i>
                    Issue Book
                </a>
            </li>

            <li>
                <a href="returnBook.jsp">
                    <i class="fa-solid fa-rotate-left"></i>
                    Return Book
                </a>
            </li>

            <li>
                <a href="../LogoutServlet">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Logout
                </a>
            </li>

        </ul>

    </aside>

    <!-- Main Content -->

    <main class="main">

        <!-- Navbar -->

        <div class="topbar">

            <input
            type="text"
            placeholder="Search books, users...">

            <div class="profile">

                Welcome,
                <strong><%=admin%></strong>

            </div>

        </div>

        <!-- Cards Start -->

        <div class="cards">

            <!-- Dynamic cards will come here -->

        </div>

        <!-- Recent Table -->

        <div class="table-section">

        </div>

    </main>

</div>

</body>

</html>