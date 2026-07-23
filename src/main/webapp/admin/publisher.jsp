<%@page import="java.util.List"%>
<%@page import="dao.PublisherDAO"%>
<%@page import="dto.PublisherDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

PublisherDAO dao=new PublisherDAO();
List<PublisherDTO> publishers=dao.getAllPublishers();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Publisher Management</title>

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

<li><a href="categories.jsp"><i class="fa fa-layer-group"></i> Categories</a></li>

<li class="active"><a href="publishers.jsp"><i class="fa fa-building"></i> Publishers</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="topbar">

<h2>Publisher Management</h2>

<a href="addPublisher.jsp" class="btn btn-primary">

<i class="fa fa-plus"></i>

Add Publisher

</a>

</div>

<div class="table-section">

<input
type="text"
id="search"
placeholder="Search Publisher..."
style="width:320px;padding:10px;margin-bottom:20px;">

<table id="publisherTable">

<thead>

<tr>

<th>ID</th>

<th>Name</th>

<th>Address</th>

<th>Phone</th>

<th>Email</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%
for(PublisherDTO p : publishers){
%>

<tr>

<td><%=p.getPublisherId()%></td>

<td><%=p.getPublisherName()%></td>

<td><%=p.getAddress()%></td>

<td><%=p.getPhone()%></td>

<td><%=p.getEmail()%></td>

<td>

<a href="editPublisher.jsp?id=<%=p.getPublisherId()%>"
class="btn btn-success">

<i class="fa fa-edit"></i>

</a>

<a href="../DeletePublisherServlet?id=<%=p.getPublisherId()%>"
class="btn btn-danger"
onclick="return confirm('Delete this publisher?')">

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

document.querySelectorAll("#publisherTable tbody tr").forEach(function(row){

row.style.display=row.innerText.toLowerCase().includes(value)?"":"none";

});

});

</script>

</body>

</html>