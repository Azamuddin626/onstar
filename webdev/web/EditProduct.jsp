<%-- 
    Document   : EditStaff
    Created on : 6 Jun 2023, 10:30:28 pm
    Author     : MySystem
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" type="text/css" href="ManageProduct.css">
    </head>
    <body>
        <%
//            String productID="1";
            String productID = request.getParameter("id");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM product WHERE Prod_ID ='" + productID + "'");

                if (rs.next()) {
                    String productName = rs.getString("Prod_Name");
                    String productDesc = rs.getString("Prod_Desc");
                    String productQty = rs.getString("Prod_Qty");
                    String productPrice = rs.getString("Prod_Price");
                    String categoryID = rs.getString("Category_ID");

        %>
        <div class="popup-content">
            <form action="UpdateProduct.jsp?Prod_ID=<%= productID%>" method="POST">
                <h3>Update Product</h3>
                <input type="hidden" name="Prod_ID" value="<%= productID%>">
                <br>
                <label for="productName">Product Name:</label>
                <input type="text" name="Prod_Name" value="<%= productName%>"><br>
                <br>
                <label for="productDesc">Product Desc:</label>
                <input type="text" name="Prod_Desc" value="<%= productDesc%>"><br>
                <br>
                <label for="productQty">Product Quantity:</label>
                <input type="number" name="Prod_Qty" value="<%= productQty%>"><br>
                <br>
                <label for="productPrice">Product Price:</label>
                <input type="number" name="Prod_Price" value="<%= productPrice%>"><br>
                <br>
                <label for="categoryID">Category:</label>
                <input type="text" name="Category_ID" value="<%= categoryID%>"><br>
                <br>
                <br>
                <input class="submit" type="submit" value="Update">
            </form>
        </div>
        <%
                } else {
                    out.println("Product not found. Product ID: " + productID);

                }

                con.close();
            } catch (Exception e) {
                out.println("Error: " + e);
            }
        %>
    </body>
</html>

