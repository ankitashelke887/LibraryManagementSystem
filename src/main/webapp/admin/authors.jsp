<%@page import="java.util.List"%>
<%@page import="dao.AuthorDAO"%>
<%@page import="dto.AuthorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

AuthorDAO dao=new AuthorDAO();
List<AuthorDTO> authors=dao.getAllAuthors();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Author Management</title>

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

<li class="active"><a href="authors.jsp"><i class="fa fa-pen"></i> Authors</a></li>

<li><a href="categories.jsp"><i class="fa fa-layer-group"></i> Categories</a></li>

<li><a href="publishers.jsp"><i class="fa fa-building"></i> Publishers</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="topbar">

<h2>Author Management</h2>

<a href="addAuthor.jsp" class="btn btn-primary">

<i class="fa fa-plus"></i>

Add Author

</a>

</div>

<div class="table-section">

<input
type="text"
id="search"
placeholder="Search Author..."
style="width:300px;padding:10px;margin-bottom:20px;">

<table id="authorTable">

<thead>

<tr>

<th>ID</th>

<th>Author Name</th>

<th>Biography</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%
for(AuthorDTO a:authors){
%>

<tr>

<td><%=a.getAuthorId()%></td>

<td><%=a.getAuthorName()%></td>

<td><%=a.getBiography()%></td>

<td>

<a
href="editAuthor.jsp?id=<%=a.getAuthorId()%>"
class="btn btn-success">

<i class="fa fa-edit"></i>

</a>

<a
href="../DeleteAuthorServlet?id=<%=a.getAuthorId()%>"
class="btn btn-danger"
onclick="return confirm('Delete this author?')">

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

document.querySelectorAll("#authorTable tbody tr").forEach(function(row){

row.style.display=row.innerText.toLowerCase().includes(value)?"":"none";

});

});

</script>

</body>

</html>