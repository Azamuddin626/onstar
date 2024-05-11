<%-- 
    Document   : Login
    Created on : 19 Jun 2023, 8:22:44 pm
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Login.css">

        <title>Login</title>
    </head>
    <body>
        <form action="" class="form" method="POST">
            <h2>LOG IN</h2>

            <input type="radio" name="userRole" value="customer" checked> Customer
            <input type="radio" name="userRole" value="staff"> Staff <br>
            <input type="radio" name="userRole" value="manager"> Store Manager
            <input type="radio" name="userRole" value="owner"> Store Owner

            <input type="text" name="username" class="box" placeholder="Enter Username" >
            <input type="password" name="password" class="box" placeholder="Enter Password" >

            <input type="submit" value="LOG IN" id="submit">
            <br>
            <br>

            <%
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String userRole = request.getParameter("userRole");

                if (username != null && password != null && userRole != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        String myURL = "jdbc:mysql://localhost/onstar";
                        Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                        String SelectQry = "SELECT * FROM staff WHERE Staff_Username = ? AND Staff_Psw = ?";
                        PreparedStatement myPS = myConnection.prepareStatement(SelectQry);
                        myPS.setString(1, username);
                        myPS.setString(2, password);
                        ResultSet resultSet = myPS.executeQuery();

                        // Example usage of the userRole:
                        if (resultSet.next()) {
                            HttpSession loginsession = request.getSession();
                            session.setAttribute("staffID", resultSet.getString("Staff_ID"));

                            if (userRole.equals("customer")) {
                                response.sendRedirect("catalog.jsp");
                            } else if (userRole.equals("staff")) {
                                response.sendRedirect("ManageProduct.jsp");
                            } else if (userRole.equals("manager")) {
                                // Redirect to store manager page
                            } else if (userRole.equals("owner")) {
                                // Redirect to store owner page
                            }
                        } else {
                            // User not found, display error message
                            out.println("<span style='color: black;'>Invalid email or password. Please try again.</span>");

                        }

                        myConnection.close();
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        out.println("An error occurred. Please try again later.");
                    }
                }

            %>

        </form>
    </body>
</html>
