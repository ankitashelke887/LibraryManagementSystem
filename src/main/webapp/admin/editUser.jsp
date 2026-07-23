<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("../login.jsp");
    return;
}

int id=Integer.parseInt(request.getParameter("id"));

UserDAO dao=new UserDAO();

UserDTO user=dao.getUserById(id);

if(user==null){
    response.sendRedirect("users.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit User</title>

<link rel="stylesheet" href="../css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.form-container{

background:white;
max-width:700px;
margin:auto;
padding:35px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);

}

.form-title{

font-size:28px;
color:#6b221d;
margin-bottom:25px;
font-weight:bold;

}

.form-group{

margin-bottom:18px;

}

.form-group label{

display:block;
margin-bottom:8px;
font-weight:600;

}

.form-group input,
.form-group textarea,
.form-group select{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
outline:none;

}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus{

border-color:#6b221d;

}

textarea{

height:100px;
resize:none;

}

.buttons{

display:flex;
gap:15px;
margin-top:20px;

}

</style>

<script>

function validate(){

let phone=document.forms["editForm"]["phone"].value;

if(phone.length!=10){

alert("Phone Number should contain 10 digits");

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

<li class="active"><a href="users.jsp"><i class="fa fa-users"></i> Users</a></li>

<li><a href="books.jsp"><i class="fa fa-book"></i> Books</a></li>

<li><a href="../LogoutServlet"><i class="fa fa-right-from-bracket"></i> Logout</a></li>

</ul>

</aside>

<main class="main">

<div class="form-container">

<div class="form-title">

<i class="fa fa-user-pen"></i>

Edit User

</div>

<form
name="editForm"
action="../UpdateUserServlet"
method="post"
onsubmit="return validate()">

<input
type="hidden"
name="userId"
value="<%=user.getUserId()%>">

<div class="form-group">

<label>Name</label>

<input
type="text"
name="name"
value="<%=user.getName()%>"
required>

</div>

<div class="form-group">

<label>Email</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

</div>

<div class="form-group">

<label>Phone</label>

<input
type="text"
name="phone"
maxlength="10"
value="<%=user.getPhone()%>"
required>

</div>

<div class="form-group">

<label>Address</label>

<textarea
name="address"
required><%=user.getAddress()%></textarea>

</div>

<div class="form-group">

<label>Status</label>

<select name="status">

<option value="Active"
<%= "Active".equals(user.getStatus()) ? "selected" : "" %>>
Active
</option>

<option value="Inactive"
<%= "Inactive".equals(user.getStatus()) ? "selected" : "" %>>
Inactive
</option>

</select>

</div>

<div class="buttons">

<button
type="submit"
class="btn btn-primary">

<i class="fa fa-save"></i>

Update User

</button>

<a
href="users.jsp"
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