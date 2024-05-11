
<%-- 
    Document   : editStaff
    Created on : 7 Jun 2023, 11:22:29 am
    Author     : MySystem
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Grandstander&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="editStaff.css" />
        <title>Edit Staff Information</title>
    </head>
    <body>
        <!-- NAVIGATION Start Here-->
        <nav>
            <div class="logo">
                <a href="ManageProduct.jsp">
                    <img src="All_Images\ImagesIcon\LogoAnis.png" alt="Logo">
                </a>
                <h1>Staff</h1>
            </div>
            <ul class="nav-links">
                <li><a href="ProfileStaff.jsp">Profile</a></li>
                <li><a href="ManageProduct.jsp">Manage Product</a></li>
                <li><a href="ManageOrder.jsp">Manage Order</a></li>
                <li><a href="ManageSupplier.jsp">Manage Supplier</a></li>
                <li><a href="Login.jsp">Log Out</a></li>
            </ul>
        </nav>
        <!-- NAVIGATION END-->

        <!-- CONTENT START -->
        <BR></BR>
        <div class="container">
            <div class="card">
                <div class="profile-info">
                    <h3>Edit Staff Information</h3>

                    <%
                        String staffID = (String) session.getAttribute("staffID");

                        if (staffID != null) {
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                                PreparedStatement ps = con.prepareStatement("SELECT * FROM staff WHERE Staff_ID = ? ");
                                ps.setString(1, staffID);
                                ResultSet rs = ps.executeQuery();

                                if (rs.next()) {
                                
                                    String staffFName = rs.getString("Staff_FName");
                                    String staffLName = rs.getString("Staff_LName");
                                    String staffPhoneNo = rs.getString("Staff_PhoneNo");
                                    String staffRole = rs.getString("Staff_Role");
                                    String staffUsername = rs.getString("Staff_Username");
                                    String staffPsw = rs.getString("Staff_Psw");
                    %>
                    <form action="UpdateStaff.jsp" method="post">
                        <table class="form-table">
                            <tr>
                                
                                <td><input type="hidden" id="id" name="id" value="<%= staffID%>" /></td>
                            </tr>
                            <tr>
                                <td><label for="fname">First Name:</label></td>
                                <td><input type="text" id="fname" name="fname" value="<%= staffFName%>" /></td>
                            </tr>
                            <tr>
                                <td><label for="lname">Last Name:</label></td>
                                <td><input type="text" id="lname" name="lname" value="<%= staffLName%>" /></td>
                            </tr>
                            <tr>
                                <td><label for="phone">Phone No:</label></td>
                                <td><input type="text" id="phone" name="phone" value="<%= staffPhoneNo%>" /></td>
                            </tr>
                            <tr>
                                <td><label for="role">Role:</label></td>
                                <td><input type="text" id="role" name="role" value="<%= staffRole%>" /></td>
                            </tr>
                            <tr>
                                <td><label for="username">Username:</label></td>
                                <td><input type="text" id="username" name="username" value="<%= staffUsername%>" /></td>
                            </tr>
                            <tr>
                                <td><label for="password">Password:</label></td>
                                <td><input type="password" id="password" name="password" value="<%= staffPsw%>" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="form-group">
                                    <button type="submit">Update</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%
                                } else {
                                    out.println("Staff not found.");
                                }

                                rs.close();
                                ps.close();
                                con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } catch (Exception e) {
                                out.println("Error: " + e);
                            }
                        }
                    %>

                </div>
            </div>
        </div>
        <!-- CONTENT END -->
    </body>
</html>
