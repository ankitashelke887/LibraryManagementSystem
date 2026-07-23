<%@page import="java.util.List"%>
<%@page import="dao.IssueDAO"%>
<%@page import="dto.IssueDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

IssueDAO dao=new IssueDAO();
List<IssueDTO> issues=dao.getIssuedBooks();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Return Book</title>

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

<li><a href="issueBook.jsp"><i class="fa fa-book-open"></i> Issue Book</a></li>

<li class="active"><a href="returnBook.jsp"><i class="fa fa-rotate-left"></i> Return Book</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="topbar">

<h2>Return Book</h2>

</div>

<div class="table-section">

<input
type="text"
id="search"
placeholder="Search User or Book..."
style="width:320px;padding:10px;margin-bottom:20px;">

<table id="returnTable">

<thead>

<tr>

<th>Issue ID</th>

<th>User</th>

<th>Book</th>

<th>Barcode</th>

<th>Issue Date</th>

<th>Due Date</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

for(IssueDTO i:issues){

%>

<tr>

<td><%=i.getIssueId()%></td>

<td><%=i.getUserName()%></td>

<td><%=i.getBookTitle()%></td>

<td><%=i.getBarcode()%></td>

<td><%=i.getIssueDate()%></td>

<td><%=i.getDueDate()%></td>

<td>

<span class="badge danger">

Issued

</span>

</td>

<td>

<a
href="../ReturnBookServlet?issueId=<%=i.getIssueId()%>"
class="btn btn-success"
onclick="return confirm('Return this book?')">

<i class="fa fa-rotate-left"></i>

Return

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

document.querySelectorAll("#returnTable tbody tr").forEach(function(row){

row.style.display=row.innerText.toLowerCase().includes(value)?"":"none";

});

});

</script>

</body>

</html>