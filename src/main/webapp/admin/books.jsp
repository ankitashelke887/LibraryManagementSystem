<%@page import="java.util.List"%>
<%@page import="dao.BookDAO"%>
<%@page import="dto.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

BookDAO dao=new BookDAO();
List<BookDTO> books=dao.getAllBooks();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Books</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

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

<li><a href="users.jsp"><i class="fa fa-users"></i> Users</a></li>

<li class="active"><a href="books.jsp"><i class="fa fa-book"></i> Books</a></li>

<li><a href="authors.jsp"><i class="fa fa-pen"></i> Authors</a></li>

<li><a href="categories.jsp"><i class="fa fa-layer-group"></i> Categories</a></li>

<li><a href="publishers.jsp"><i class="fa fa-building"></i> Publishers</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<!-- Main -->

<main class="main">

<div class="topbar">

<h2>Book Management</h2>

<a href="addBook.jsp" class="btn btn-primary">

<i class="fa fa-plus"></i>

Add Book

</a>

</div>

<div class="table-section">

<input
type="text"
id="search"
placeholder="Search Book..."
style="width:320px;padding:10px;margin-bottom:20px;">

<table id="bookTable">

<thead>

<tr>

<th>ID</th>

<th>ISBN</th>

<th>Title</th>

<th>Author</th>

<th>Category</th>

<th>Publisher</th>

<th>Total</th>

<th>Available</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

for(BookDTO b : books){

%>

<tr>

<td><%=b.getBookId()%></td>

<td><%=b.getIsbn()%></td>

<td><%=b.getTitle()%></td>

<td><%=b.getAuthorName()%></td>

<td><%=b.getCategoryName()%></td>

<td><%=b.getPublisherName()%></td>

<td><%=b.getTotalCopies()%></td>

<td><%=b.getAvailableCopies()%></td>

<td>

<%

if(b.getAvailableCopies()>0){

%>

<span class="badge success">

Available

</span>

<%

}else{

%>

<span class="badge danger">

Out of Stock

</span>

<%

}

%>

</td>

<td>

<a
href="viewBook.jsp?id=<%=b.getBookId()%>"
class="btn btn-primary">

<i class="fa fa-eye"></i>

</a>

<a
href="editBook.jsp?id=<%=b.getBookId()%>"
class="btn btn-success">

<i class="fa fa-edit"></i>

</a>

<a
href="../DeleteBookServlet?id=<%=b.getBookId()%>"
class="btn btn-danger"
onclick="return confirm('Delete this book?')">

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

let rows=document.querySelectorAll("#bookTable tbody tr");

rows.forEach(function(row){

row.style.display=row.innerText.toLowerCase().includes(value)?"":"none";

});

});

</script>

</body>

</html>