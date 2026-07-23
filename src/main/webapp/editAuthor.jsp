<%@page import="dao.AuthorDAO"%>
<%@page import="dto.AuthorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin = (String)session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("../login.jsp");
    return;
}

int authorId = Integer.parseInt(request.getParameter("id"));

AuthorDAO dao = new AuthorDAO();
AuthorDTO author = dao.getAuthorById(authorId);

if(author == null){
    response.sendRedirect("authors.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Author</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

max-width:750px;
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
outline:none;
font-size:15px;

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

alert("Author Name is required.");

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

<li class="active"><a href="authors.jsp"><i class="fa fa-pen"></i> Authors</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-user-edit"></i>

Edit Author

</div>

<form
name="authorForm"
action="../UpdateAuthorServlet"
method="post"
onsubmit="return validate()">

<input
type="hidden"
name="authorId"
value="<%=author.getAuthorId()%>">

<div class="form-group">

<label>Author Name</label>

<input
type="text"
name="authorName"
value="<%=author.getAuthorName()%>"
required>

</div>

<div class="form-group">

<label>Biography</label>

<textarea
name="biography"><%=author.getBiography()%></textarea>

</div>

<div class="buttons">

<button
type="submit"
class="btn btn-primary">

<i class="fa fa-save"></i>

Update Author

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