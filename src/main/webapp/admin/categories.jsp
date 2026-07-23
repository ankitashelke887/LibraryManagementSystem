<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dto.CategoryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

CategoryDAO dao=new CategoryDAO();
List<CategoryDTO> categories=dao.getAllCategories();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Category Management</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

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

<li><a href="publishers.jsp"><i class="fa fa-building"></i> Publishers</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="topbar">

<h2>Category Management</h2>

<a href="addCategory.jsp" class="btn btn-primary">

<i class="fa fa-plus"></i>

Add Category

</a>

</div>

<div class="table-section">

<input
type="text"
id="search"
placeholder="Search Category..."
style="width:300px;padding:10px;margin-bottom:20px;">

<table id="categoryTable">

<thead>

<tr>

<th>ID</th>

<th>Category Name</th>

<th>Description</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

for(CategoryDTO c : categories){

%>

<tr>

<td><%=c.getCategoryId()%></td>

<td><%=c.getCategoryName()%></td>

<td><%=c.getDescription()%></td>

<td>

<a
href="editCategory.jsp?id=<%=c.getCategoryId()%>"
class="btn btn-success">

<i class="fa fa-edit"></i>

</a>

<a
href="../DeleteCategoryServlet?id=<%=c.getCategoryId()%>"
class="btn btn-danger"
onclick="return confirm('Delete this category?')">

<i class="fa fa-trash"></i>

</a>

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</main>

</div>

<script>

document.getElementById("search").addEventListener("keyup",function(){

let value=this.value.toLowerCase();

let rows=document.querySelectorAll("#categoryTable tbody tr");

rows.forEach(function(row){

row.style.display=row.innerText.toLowerCase().includes(value)?"":"none";

});

});

</script>

</body>

</html>