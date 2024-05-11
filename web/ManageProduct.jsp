<%-- 
    Document   : ManageProduct
    Created on : 23 May 2023, 11:29:35 pm
    Author     : MySystem
--%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Base64"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ManageProduct.css"/>
        <title>Manage Product Page</title>
    </head>
    <body>
        <!-- Navigation -->

        <nav>
            <div class="logo">
                <a href="ManageProduct.jsp">
                    <img src="All_Images/ImagesIcon/LogoAnis.png" alt="Logo">
                </a>
                <h1>Staff</h1>
            </div>
            <ul class="nav-links">
                <li><a href="ProfileStaff.jsp">Profile</a></li>
                <li><a href="ManageProduct.jsp">Manage Product</a></li>
                <li><a href="ManageOrder.jsp">Manage Order</a></li>
                <li><a href="Login.jsp">Log Out</a></li>
            </ul>
        </nav>

        <!-- Navigation End -->

        <!--Page-->
        <div class="top-content">
            <h2>Manage Product</h2>
            <div class="search-container">
                <form class="search-bar">
                    <input type="search" placeholder="Search..." />
                    <button type="submit">
                        <img src="All_Images/ImagesIcon/search (1).png" alt="searchlogo" />
                    </button>
                </form>
            </div>
            <button class="register-product-button" onclick="showPopup()">Register Product</button>
        </div>

        <!--Popup Register-->
        <div class="popup" id="popup">
            <div class="popup-content">
                <span class="close" onclick="hidePopup()">&times;</span>
                <h3>Register Product</h3>
                <br><br>
                <form action="RegisterProduct.jsp" method="POST" enctype="multipart/form-data">
                    <label for="productimage">Product Image:</label>
                    <input type="file" name="Prod_Image" id="Prod_Image" required="">
                    <label for="productName">Product Name:</label>
                    <input type="text" id="Prod_Name" name="Prod_Name" required>
                    <br><br>
                    <label for="productDesc">Product Desc:</label>
                    <input type="text" id="Prod_Desc" name="Prod_Desc" required>
                    <br><br>
                    <label for="productQty">Product Quantity:</label>
                    <input type="text" id="Prod_Qty" name="Prod_Qty" required>
                    <br><br>
                    <label for="productPrice">Product Price:</label>
                    <input type="text" id="Prod_Price" name="Prod_Price" required>
                    <br><br>
                    <label for="categoryID">Category:</label>
                    <input type="text" id="Category_ID" name="Category_ID" required>

                    <br><br>
                    <input class="submit" type="submit" value="Save">
                </form>
            </div>
        </div>

        <!--Table Content-->
        <div class="table">
            <table id="table">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Image</th>
                        <th>Product Name</th>
                        <th>Product Desc</th>
                        <th>Product Quantity</th>
                        <th>Product Price</th>
                        <th>Category</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM product");

                            while (rs.next()) {
                                String productID = rs.getString("Prod_ID");
                                byte[] productImage = rs.getBytes("Prod_Image");
                                String productName = rs.getString("Prod_Name");
                                String productDesc = rs.getString("Prod_Desc");
                                String productQty = rs.getString("Prod_Qty");
                                String productPrice = rs.getString("Prod_Price");
                                String categoryID = rs.getString("Category_ID");

                                out.println("<tr>");
                                out.println("<td>" + productID + "</td>");
                                String base64Image = Base64.getEncoder().encodeToString(productImage);
                                out.println("<td><img src='data:image/jpeg;base64," + base64Image + "'/></td>");
                                out.println("<td>" + productName + "</td>");
                                out.println("<td>" + productDesc + "</td>");
                                out.println("<td>" + productQty + "</td>");
                                out.println("<td>" + productPrice + "</td>");
                                out.println("<td>" + categoryID + "</td>");
                                out.println("<td>");
                                out.println("<a href=\"EditProduct.jsp?id=" + productID + "\">"
                                        + "<img src=\"All_Images/ImagesIcon/editicon.png\" alt=\"edit\"></a>");
                                out.println("</td>");
                                out.println("<td>");
                                out.println("<a href=\"DeleteProduct.jsp?id=" + productID + "\">"
                                        + "<img src=\"All_Images/ImagesIcon/deleteicon.png\" alt=\"delete\"></a>");
                                out.println("</td>");
                                out.println("</tr>");
                            }

                            con.close();
                        } catch (Exception e) {
                            out.println("Error: " + e);
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- The Modal to delete -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close"></span>
                <p>Are you sure you want to delete this product?</p>
                <button href=\"DeleteProduct.jsp?Prod_ID="delete" class="delete-button">Delete</button>
                <button id="cancel" class="cancel-button">Cancel</button>
            </div>
        </div>

        <script>
            function showPopup() {
                document.getElementById("popup").style.display = "block";
            }

            function hidePopup() {
                document.getElementById("popup").style.display = "none";
            }

            function openModal() {
                var modal = document.getElementById("myModal");
                var span = document.getElementsByClassName("close")[0];
                modal.style.display = "block";
                span.onclick = function () {
                    modal.style.display = "none";
                };
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                ;

                // Get the reference to the delete button's parent table row
                var deleteButton = document.getElementById("deleteButton");
                var tableRow = deleteButton.closest("tr");

                // Add event listener to the delete button inside the modal
                var modalDeleteButton = document.getElementById("delete");
                modalDeleteButton.addEventListener("click", function () {
                    // Call the deleteRow() function passing the table row reference
                    deleteRow(tableRow);
                    modal.style.display = "none";
                });
            }
        </script>

        <!-- FOOTER Start Here -->
        <footer>
            <div class="footer-content">
                <h3>Vision:</h3>
                <p>Innovate Stationary</p>
                <p>Empowered Productivity.</p>
                <h3>Mission:</h3>
                <p>Sustainable, Affordable, Personalized.</p>
            </div>
            <div class="footer-content">
                <h3>Quick Navigation</h3>
                <p><a href="ProfileStaff.jsp">Profile</a></p>
                <p><a href="ManageProduct.jsp">Manage Product</a></p>
                <p><a href="ManageOrder.jsp">Manage Order</a></p>
            </div>
            <div class="footer-content">
                <h3>Contact Us</h3>
                <div class="social-icons">
                    <a href="https://www.facebook.com/profile.php?id=100033284300731"><img
                            src="All_Images\ImagesIcon\facebook.png" alt="Facebook" /></a>
                    <a href="https://instagram.com/kosiswa.executives?igshid=YmMyMTA2M2Y="><img
                            src="All_Images\ImagesIcon\instagram.png" alt="Instagram" /></a>
                    <a href="https://goo.gl/maps/QrfnnCdco2X1n5CDA"><img src="All_Images\ImagesIcon\map.png"
                                                                         alt="Google Maps" /></a>
                </div>
            </div>
        </footer>
        <!-- FOOTER END -->
    </body>
</html>
