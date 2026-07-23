<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String role = (String) session.getAttribute("role");

if(role == null){
    response.sendRedirect("login.jsp");
    return;
}

if(role.equalsIgnoreCase("admin")){
    response.sendRedirect("admin/dashboard.jsp");
}
else if(role.equalsIgnoreCase("user")){
    response.sendRedirect("user/dashboard.jsp");
}
else{
    response.sendRedirect("login.jsp");
}
%>