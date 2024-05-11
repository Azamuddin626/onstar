<%-- 
    Document   : DeleteProduct
    Created on : 6 Jun 2023, 10:44:31 pm
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Staff</title>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');

            /* Add the provided CSS styles here */
            body {
                background-color:aliceblue;
            }

            h2,p{
                text-align: center;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-sizing: border-box;
                padding: auto;
                height: 65px;
                background-color: #24252a;
            }

            .popup-content {
                background-color: #fefefe;
                margin: 8% auto;
                padding: 20px;
                border: 3px solid #24252a;
                width: 40%;
            }

            .popup-content label {
                display: inline-block;
                width: 250px;
            }

            table {
                display: flex;
                justify-content: center;
            }

            form{
                display: flex;
                justify-content: center;
            }

            input{
                display: flex;
                justify-content: center;
                width: 80px;
                height: 25px;
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #24252a;
                background-color: #4CAF50;
                cursor: pointer;
                margin: 20px;

            }
        </style>

    </head>
    <body>
        <%-- Retrieve the staff ID from the request parameter --%>
        <% String productID = request.getParameter("id"); %>

        <%-- Check if the staff ID is present --%>
        <% if (productID != null && !productID.isEmpty()) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                    PreparedStatement pst = con.prepareStatement("SELECT * FROM product WHERE Prod_ID = ?");
                    pst.setString(1, productID);
                    ResultSet rs = pst.executeQuery();

                    if (rs.next()) {
                        String productName = rs.getString("Prod_Name");
                        String productDesc = rs.getString("Prod_Desc");
                        String productQty = rs.getString("Prod_Qty");
                        String productPrice = rs.getString("Prod_Price");
                        String categoryID = rs.getString("Category_ID");

        %>
        <div class="popup-content">
            <h2>Delete Staff</h2>
            <p><b>Are you sure you want to delete the following staff?</b></p>
            <table>
                <tr>
                    <td>ID :</td>
                    <td><%= productID%></td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td><%= productName%></td>
                </tr>
                <tr>
                    <td>Description :</td>
                    <td><%= productDesc%></td>
                </tr>
                <tr>
                    <td>Quantity :</td>
                    <td><%= productQty%></td>
                </tr>
                <tr>
                    <td>Price :</td>
                    <td><%= productPrice%></td>
                </tr>
                <tr>
                    <td>Category :</td>
                    <td><%= categoryID%></td>
                </tr>

            </table>

            <form action="DeleteProduct.jsp" method="post">
                <input type="hidden" name="id" value="<%= productID%>">
                <input type="submit" name="action" value="Delete">
                <input type="submit" name="action" value="Cancel">
            </form>

        </div>
        <%
                    } else {
                        out.println("Staff not found.");
                    }

                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e);
                }
            } else {
                out.println("Invalid Product ID.");
            } %>

        <%-- Process the form submission --%>
        <% String action = request.getParameter("action");
            if (action != null && action.equals("Delete")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                    PreparedStatement pst = con.prepareStatement("DELETE FROM product WHERE Prod_ID = ?");
                    pst.setString(1, productID);
                    int rowsDeleted = pst.executeUpdate();

                    if (rowsDeleted > 0) {
                        out.println("Staff deleted successfully.");
                        response.sendRedirect("ManageProduct.jsp");
                    } else {
                        out.println("Staff not found or couldn't be deleted.");
                    }

                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e);
                }
            } else if (action != null && action.equals("Cancel")) {
                // Redirect back to the previous page
                response.sendRedirect("ManageProduct.jsp");
            }%>

        <script>
            function goBack() {
                // Redirect back to the previous page
                history.go(-1);
            }
        </script>
    </body>
</html>
