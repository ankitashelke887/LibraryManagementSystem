<%@page import="java.util.*"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.CopyDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.CopyDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

UserDAO userDAO=new UserDAO();
CopyDAO copyDAO=new CopyDAO();

List<UserDTO> users=userDAO.getAllUsers();
List<CopyDTO> copies=copyDAO.getAvailableCopies();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Issue Book</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

max-width:800px;
margin:auto;
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);

}

.form-title{

font-size:30px;
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

.form-group select,
.form-group input{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;

}

.form-group input:focus,
.form-group select:focus{

border-color:#6b221d;

}

.buttons{

display:flex;
gap:15px;
margin-top:25px;

}

</style>

<script>

function validate(){

let issue=document.forms["issueForm"]["issueDate"].value;
let due=document.forms["issueForm"]["dueDate"].value;

if(due<=issue){

alert("Due Date should be after Issue Date");

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

<li><a href="dashboard.jsp">Dashboard</a></li>

<li class="active"><a href="issueBook.jsp">Issue Book</a></li>

<li><a href="returnBook.jsp">Return Book</a></li>

<li><a href="../LogoutServlet">Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-book-open"></i>

Issue Book

</div>

<form

name="issueForm"

action="../IssueBookServlet"

method="post"

onsubmit="return validate()">

<div class="form-group">

<label>Select User</label>

<select name="userId" required>

<option value="">Select User</option>

<%

for(UserDTO u:users){

%>

<option value="<%=u.getUserId()%>">

<%=u.getName()%>

</option>

<%

}

%>

</select>

</div>

<div class="form-group">

<label>Select Book Copy</label>

<select name="copyId" required>

<option value="">Select Copy</option>

<%

for(CopyDTO c:copies){

%>

<option value="<%=c.getCopyId()%>">

<%=c.getBookTitle()%> | Barcode :
<%=c.getBarcode()%>

</option>

<%

}

%>

</select>

</div>

<div class="form-group">

<label>Issue Date</label>

<input

type="date"

name="issueDate"

required>

</div>

<div class="form-group">

<label>Due Date</label>

<input

type="date"

name="dueDate"

required>

</div>

<div class="buttons">

<button

type="submit"

class="btn btn-primary">

<i class="fa fa-save"></i>

Issue Book

</button>

<a

href="dashboard.jsp"

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