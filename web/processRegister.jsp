
<%-- 
    Document   : processRegister
    Created on : 19 Jun 2023, 8:25:40 pm
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page  language="java" %>
<%@page  import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head> 
    <body>
        <jsp:useBean id="staff" class="Onstar.com.RegisterStaff" scope="request"/>

        <%
            staff.setFname(request.getParameter("fname"));
            staff.setLname(request.getParameter("lname"));
            staff.setPhone(request.getParameter("phone"));
            staff.setRole(request.getParameter("role"));
            staff.setUsername(request.getParameter("username"));
            staff.setPassword(request.getParameter("password"));
            

            int result;

            Class.forName("com.mysql.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost/onstar";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

            String sInsertQry = "INSERT INTO staff(Staff_FName, Staff_LName, Staff_PhoneNo, Staff_Role, Staff_Username, Staff_Psw) VALUES (?,?,?,?,?,?) ";

            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

            myPS.setString(1, staff.getFname());
            myPS.setString(2, staff.getLname());
            myPS.setString(3, staff.getPhone());
            myPS.setString(4, staff.getRole());
            myPS.setString(5, staff.getUsername());
            myPS.setString(6, staff.getPassword());
            

            result = myPS.executeUpdate();

            myConnection.close();

            if (result > 0) {
                response.sendRedirect("Login.jsp"); // Redirect to login page
//                request.getRequestDispatcher("CustomerProfile.jsp");
            } else {
                out.println("Registration failed. Please try again."); // Display error message
            }
        %>
    </body>
</html>

