<%@page import="java.util.List"%>
<%@page import="dao.CopyDAO"%>
<%@page import="dto.CopyDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

CopyDAO dao=new CopyDAO();
List<CopyDTO> copies=dao.getAllCopies();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Book Copies</title>

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

<li class="active"><a href="copies.jsp"><i class="fa fa-copy"></i> Book Copies</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-sign-out-alt"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="topbar">

<h2>Book Copies</h2>

<a href="addCopy.jsp" class="btn btn-primary">

<i class="fa fa-plus"></i>

Add Copy

</a>

</div>

<div class="table-section">

<input
type="text"
id="search"
placeholder="Search..."
style="width:300px;padding:10px;margin-bottom:20px;">

<table id="copyTable">

<thead>

<tr>

<th>ID</th>

<th>Book</th>

<th>Barcode</th>

<th>Shelf</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

for(CopyDTO c:copies){

%>

<tr>

<td><%=c.getCopyId()%></td>

<td><%=c.getBookTitle()%></td>

<td><%=c.getBarcode()%></td>

<td><%=c.getShelfLocation()%></td>

<td>

<%

if(c.getStatus().equals("Available")){

%>

<span class="badge success">Available</span>

<%

}else{

%>

<span class="badge danger"><%=c.getStatus()%></span>

<%

}

%>

</td>

<td>

<a
href="editCopy.jsp?id=<%=c.getCopyId()%>"
class="btn btn-success">

<i class="fa fa-edit"></i>

</a>

<a
href="../DeleteCopyServlet?id=<%=c.getCopyId()%>"
class="btn btn-danger"
onclick="return confirm('Delete this copy?')">

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

document.querySelectorAll("#copyTable tbody tr").forEach(function(row){

row.style.display=row.innerText.toLowerCase().includes(value)?"":"none";

});

});

</script>

</body>

</html>