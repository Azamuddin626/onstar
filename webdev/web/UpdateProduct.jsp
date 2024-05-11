<%-- 
    Document   : UpdateProduct
    Created on : 6 Jun 2023, 11:22:42 pm
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
    <body>
        <h1>Update Staff</h1>
        <%
            String productID = request.getParameter("Prod_ID");
            String productImage = request.getParameter("Prod_Image");
            String productName = request.getParameter("Prod_Name");
            String productDesc = request.getParameter("Prod_Desc");
            String productQty = request.getParameter("Prod_Qty");
            String productPrice = request.getParameter("Prod_Price");
            String categoryID = request.getParameter("Category_ID");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                Statement st = con.createStatement();
                int rowsUpdated = st.executeUpdate("UPDATE product SET Prod_Image = '" + productImage + "', Prod_Name = '" + productName + "', Prod_Desc = '" + productDesc + "', Prod_Qty = '" 
                + productQty + "', Prod_Price = '" + productPrice +"', Category_ID = '" + categoryID + "' WHERE Prod_ID ='" + productID + "'");

                if (rowsUpdated > 0) {
                    out.println("Product updated successfully.");
                } else {
                    out.println("Product not found or couldn't be updated.");
                }

                con.close();
            } catch (Exception e) {
                out.println("Error: " + e);
            }
        %>

        <%-- Forward to ManageStaff.jsp --%>
        <%
            String contextPath = request.getContextPath();
            response.sendRedirect(contextPath + "/ManageProduct.jsp");
        %>
    </body>
</html>
