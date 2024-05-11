<%-- 
    Document   : UpdateStaff
    Created on : 19 Jun 2023, 9:04:29 pm
    Author     : MySystem
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Customer</title>
    </head>
    <body>
        <h1>Update Customer</h1>

        <%
            String staffid = request.getParameter("id");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                Statement st = con.createStatement();
                int rowsUpdated = st.executeUpdate("UPDATE staff SET Staff_FName = '" + fname + "', Staff_LName = '" + lname + "',"
                        + " Staff_PhoneNo = '" + phone + "', Staff_Role = '" + role + "', Staff_Username = '" + username + "', Staff_Psw = '" + password + "'"
                        + " WHERE Staff_ID = '" + staffid + "'");

                if (rowsUpdated > 0) {
                    out.println("Staff updated successfully.");
                } else {
                    out.println("Staff not found or couldn't be updated.");
                }

                con.close();
            } catch (Exception e) {
                out.println("Error: " + e);
            }
        %>


        <%-- Forward to CustomerProfile.jsp  --%>
        <%
            String contextPath = request.getContextPath();
            response.sendRedirect(contextPath + "/ProfileStaff.jsp");
%>
    </body>
</html>


