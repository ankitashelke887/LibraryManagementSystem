<%@page import="java.util.List"%>
<%@page import="dao.BookDAO"%>
<%@page import="dto.BookDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
UserDTO user=(UserDTO)session.getAttribute("user");

if(user==null){
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

<title>Search Books</title>

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

<li>
<a href="dashboard.jsp">
<i class="fa fa-house"></i>
Dashboard
</a>
</li>

<li class="active">
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

<div class="topbar">

<h2>Library Books</h2>

</div>

<div class="table-section">

<input
type="text"
id="search"
placeholder="Search by Title, Author or ISBN..."
style="width:350px;padding:10px;margin-bottom:20px;">

<table id="bookTable">

<thead>

<tr>

<th>Book ID</th>

<th>Title</th>

<th>Author</th>

<th>Category</th>

<th>Publisher</th>

<th>ISBN</th>

<th>Available Copies</th>

</tr>

</thead>

<tbody>

<%

for(BookDTO b : books){

%>

<tr>

<td><%=b.getBookId()%></td>

<td><%=b.getTitle()%></td>

<td><%=b.getAuthorName()%></td>

<td><%=b.getCategoryName()%></td>

<td><%=b.getPublisherName()%></td>

<td><%=b.getIsbn()%></td>

<td>

<%

if(b.getAvailableCopies()>0){

%>

<span class="badge success">

<%=b.getAvailableCopies()%> Available

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

document.querySelectorAll("#bookTable tbody tr").forEach(function(row){

row.style.display=row.innerText.toLowerCase().includes(value)?"":"none";

});

});

</script>

</body>

</html>