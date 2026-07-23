<%@page import="dao.CategoryDAO"%>
<%@page import="dto.CategoryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

int id=Integer.parseInt(request.getParameter("id"));

CategoryDAO dao=new CategoryDAO();
CategoryDTO category=dao.getCategoryById(id);

if(category==null){
    response.sendRedirect("categories.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Category</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

max-width:700px;
margin:auto;
background:#fff;
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
font-size:15px;
outline:none;

}

.form-group input:focus,
.form-group textarea:focus{

border-color:#6b221d;

}

textarea{

height:150px;
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

let name=document.forms["categoryForm"]["categoryName"].value.trim();

if(name==""){

alert("Category Name is required");

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

<li><a href="authors.jsp"><i class="fa fa-user-edit"></i> Authors</a></li>

<li class="active"><a href="categories.jsp"><i class="fa fa-layer-group"></i> Categories</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-pen-to-square"></i>

Edit Category

</div>

<form
name="categoryForm"
action="../UpdateCategoryServlet"
method="post"
onsubmit="return validate()">

<input
type="hidden"
name="categoryId"
value="<%=category.getCategoryId()%>">

<div class="form-group">

<label>Category Name</label>

<input
type="text"
name="categoryName"
value="<%=category.getCategoryName()%>"
required>

</div>

<div class="form-group">

<label>Description</label>

<textarea
name="description"><%=category.getDescription()%></textarea>

</div>

<div class="buttons">

<button
type="submit"
class="btn btn-primary">

<i class="fa fa-save"></i>

Update Category

</button>

<a
href="categories.jsp"
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