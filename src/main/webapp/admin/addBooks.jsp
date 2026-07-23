<%@page import="java.util.List"%>
<%@page import="dao.AuthorDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.PublisherDAO"%>
<%@page import="dto.AuthorDTO"%>
<%@page import="dto.CategoryDTO"%>
<%@page import="dto.PublisherDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

AuthorDAO authorDAO=new AuthorDAO();
CategoryDAO categoryDAO=new CategoryDAO();
PublisherDAO publisherDAO=new PublisherDAO();

List<AuthorDTO> authors=authorDAO.getAllAuthors();
List<CategoryDTO> categories=categoryDAO.getAllCategories();
List<PublisherDTO> publishers=publisherDAO.getAllPublishers();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Book</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);
max-width:900px;
margin:auto;
}

.form-title{
font-size:28px;
color:#6b221d;
margin-bottom:30px;
font-weight:bold;
}

.form-grid{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:20px;
}

.form-group{
display:flex;
flex-direction:column;
}

.form-group label{
margin-bottom:8px;
font-weight:600;
}

.form-group input,
.form-group select,
.form-group textarea{

padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
outline:none;

}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus{

border-color:#6b221d;

}

textarea{

height:120px;
resize:none;

}

.buttons{

margin-top:30px;
display:flex;
gap:15px;

}

@media(max-width:768px){

.form-grid{

grid-template-columns:1fr;

}

}

</style>

<script>

function validate(){

let isbn=document.forms["bookForm"]["isbn"].value;

if(isbn.length<10){

alert("ISBN should contain at least 10 digits.");

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

<li class="active"><a href="books.jsp"><i class="fa fa-book"></i> Books</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-book-medical"></i>

Add New Book

</div>

<form
name="bookForm"
action="../AddBookServlet"
method="post"
onsubmit="return validate()">

<div class="form-grid">

<div class="form-group">

<label>Book Title</label>

<input
type="text"
name="title"
required>

</div>

<div class="form-group">

<label>ISBN</label>

<input
type="text"
name="isbn"
required>

</div>

<div class="form-group">

<label>Author</label>

<select name="authorId" required>

<option value="">Select Author</option>

<%
for(AuthorDTO a:authors){
%>

<option value="<%=a.getAuthorId()%>">

<%=a.getAuthorName()%>

</option>

<%
}
%>

</select>

</div>

<div class="form-group">

<label>Category</label>

<select name="categoryId" required>

<option value="">Select Category</option>

<%
for(CategoryDTO c:categories){
%>

<option value="<%=c.getCategoryId()%>">

<%=c.getCategoryName()%>

</option>

<%
}
%>

</select>

</div>

<div class="form-group">

<label>Publisher</label>

<select name="publisherId" required>

<option value="">Select Publisher</option>

<%
for(PublisherDTO p:publishers){
%>

<option value="<%=p.getPublisherId()%>">

<%=p.getPublisherName()%>

</option>

<%
}
%>

</select>

</div>

<div class="form-group">

<label>Publication Year</label>

<input
type="number"
name="publicationYear"
min="1900"
max="2100"
required>

</div>

<div class="form-group">

<label>Edition</label>

<input
type="text"
name="edition">

</div>

<div class="form-group">

<label>Language</label>

<input
type="text"
name="language">

</div>

<div class="form-group">

<label>Total Copies</label>

<input
type="number"
name="totalCopies"
min="1"
required>

</div>

<div class="form-group" style="grid-column:1/3;">

<label>Description</label>

<textarea
name="description"></textarea>

</div>

</div>

<div class="buttons">

<button
type="submit"
class="btn btn-primary">

<i class="fa fa-save"></i>

Save Book

</button>

<a
href="books.jsp"
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