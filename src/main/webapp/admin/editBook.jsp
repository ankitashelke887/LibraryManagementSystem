<%@page import="java.util.List"%>
<%@page import="dao.BookDAO"%>
<%@page import="dao.AuthorDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.PublisherDAO"%>
<%@page import="dto.BookDTO"%>
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

int id=Integer.parseInt(request.getParameter("id"));

BookDAO bookDAO=new BookDAO();
BookDTO book=bookDAO.getBookById(id);

if(book==null){
    response.sendRedirect("books.jsp");
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

<title>Edit Book</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

max-width:900px;
margin:auto;
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 10px 20px rgba(0,0,0,.08);

}

.form-title{

font-size:28px;
color:#6b221d;
margin-bottom:25px;

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
outline:none;

}

textarea{

height:120px;
resize:none;

}

.buttons{

margin-top:25px;
display:flex;
gap:15px;

}

@media(max-width:768px){

.form-grid{

grid-template-columns:1fr;

}

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

<li><a href="dashboard.jsp"><i class="fa fa-house"></i> Dashboard</a></li>

<li class="active"><a href="books.jsp"><i class="fa fa-book"></i> Books</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-pen"></i>

Edit Book

</div>

<form
action="../UpdateBookServlet"
method="post">

<input
type="hidden"
name="bookId"
value="<%=book.getBookId()%>">

<div class="form-grid">

<div class="form-group">

<label>Title</label>

<input
type="text"
name="title"
value="<%=book.getTitle()%>"
required>

</div>

<div class="form-group">

<label>ISBN</label>

<input
type="text"
name="isbn"
value="<%=book.getIsbn()%>"
required>

</div>

<div class="form-group">

<label>Author</label>

<select name="authorId">

<%
for(AuthorDTO a:authors){
%>

<option
value="<%=a.getAuthorId()%>"
<%=a.getAuthorId()==book.getAuthorId()?"selected":""%>>

<%=a.getAuthorName()%>

</option>

<%
}
%>

</select>

</div>

<div class="form-group">

<label>Category</label>

<select name="categoryId">

<%
for(CategoryDTO c:categories){
%>

<option
value="<%=c.getCategoryId()%>"
<%=c.getCategoryId()==book.getCategoryId()?"selected":""%>>

<%=c.getCategoryName()%>

</option>

<%
}
%>

</select>

</div>

<div class="form-group">

<label>Publisher</label>

<select name="publisherId">

<%
for(PublisherDTO p:publishers){
%>

<option
value="<%=p.getPublisherId()%>"
<%=p.getPublisherId()==book.getPublisherId()?"selected":""%>>

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
value="<%=book.getPublicationYear()%>">

</div>

<div class="form-group">

<label>Edition</label>

<input
type="text"
name="edition"
value="<%=book.getEdition()%>">

</div>

<div class="form-group">

<label>Language</label>

<input
type="text"
name="language"
value="<%=book.getLanguage()%>">

</div>

<div class="form-group">

<label>Total Copies</label>

<input
type="number"
name="totalCopies"
value="<%=book.getTotalCopies()%>">

</div>

<div class="form-group"
style="grid-column:1/3;">

<label>Description</label>

<textarea
name="description"><%=book.getDescription()%></textarea>

</div>

</div>

<div class="buttons">

<button
class="btn btn-primary"
type="submit">

<i class="fa fa-save"></i>

Update Book

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