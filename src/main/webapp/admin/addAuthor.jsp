<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Author</title>

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
color:#6b221d;
margin-bottom:25px;
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
.form-group textarea{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
outline:none;

}

.form-group input:focus,
.form-group textarea:focus{

border-color:#6b221d;

}

textarea{

height:180px;
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

let name=document.forms["authorForm"]["authorName"].value.trim();

if(name==""){

alert("Author name is required.");

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

<li><a href="books.jsp"><i class="fa fa-book"></i> Books</a></li>

<li class="active"><a href="authors.jsp"><i class="fa fa-pen"></i> Authors</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<!-- Main -->

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-user-pen"></i>

Add New Author

</div>

<form
name="authorForm"
action="../AddAuthorServlet"
method="post"
onsubmit="return validate()">

<div class="form-group">

<label>Author Name</label>

<input
type="text"
name="authorName"
placeholder="Enter Author Name"
required>

</div>

<div class="form-group">

<label>Biography</label>

<textarea
name="biography"
placeholder="Enter Author Biography"></textarea>

</div>

<div class="buttons">

<button
type="submit"
class="btn btn-primary">

<i class="fa fa-save"></i>

Save Author

</button>

<a
href="authors.jsp"
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