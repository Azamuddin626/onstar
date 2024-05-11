<%--
    Document   : catalog
    Created on : 25 Jun 2023, 11:24:10 pm
    Author     : MySystem
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.model.Product"%>
<%@page import="com.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Grandstander&display=swap" rel="stylesheet" />
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" href="catalog.css" />
    <title>Catalog</title>
</head>

<body>
    <!-- Navigation -->
    <nav>
        <div class="logo">
            <a href="catalog.jsp">
                <img src="All_Images/ImagesIcon/LogoAnis.png" alt="Logo">
            </a>
            <h1>Customer</h1>
        </div>
        <ul class="nav-links">
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="catalog.jsp">Catalog</a></li>
            <li><a href="checkout.jsp">Check Out</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="Login.jsp">Log Out</a></li>
        </ul>
        <div class="cart">
            <button>
                <a href="cart.jsp">Cart</a><img src="All_Images\ImagesIcon\carts.png" alt="cart" />
            </button>
        </div>
    </nav>
    <!-- NAVIGATION END-->

    <!--CONTENT START-->
    <%-- Establish database connection --%>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.Connection" %>

    <%-- Set up database connection details --%>
    <%-- Modify the connection URL, username, and password as per your MySQL configuration --%>
    <%-- Make sure you have the necessary JDBC driver (e.g., MySQL Connector/J) in your project --%>
    <%-- Establish the database connection --%>
    <%
        String jdbcUrl = "jdbc:mysql://localhost:3306/onstar";
        String username = "root";
        String password = "admin";
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>

    <%-- Create the ProductDAO object --%>
    <%@page import="com.dao.ProductDAO" %>
    <%@page import="com.model.Product" %>
    <%-- Import necessary classes --%>

    <%-- Get all products from the database using the ProductDAO --%>
    <%-- Assuming you have implemented the getAllProducts() method in the ProductDAO class --%>
    <%@page import="java.util.List" %>
    <%
        ProductDAO productDAO = new ProductDAO(connection);
        List<Product> products = productDAO.getAllProducts();
    %>

    <%-- Close the database connection --%>
    <%-- It's recommended to close the database connection in a finally block --%>
    <%-- to ensure it's closed even if an exception occurs --%>
    <%-- Alternatively, you can use try-with-resources statement --%>
    <%-- to automatically close the connection --%>
    <%-- Modify this as per your specific requirement --%>
    <%-- Close the database connection --%>
    <%-- This should be done after you have fetched the required data --%>
    <%-- and stored it in the appropriate variables --%>
    <%-- Import the necessary class --%>
    <%@page import="java.sql.SQLException" %>
    <%
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

    <%-- Set the products as a request attribute --%>
    <%-- You can access this attribute in JSP using ${products} --%>
    <%-- Modify this as per your specific requirement --%>
    <%-- Import the necessary class --%>
    <%@page import="javax.servlet.http.HttpServletRequest" %>
    <%
        request.setAttribute("products", products);
    %>

    <%-- Display the products using JSTL --%>
    <div>
        <c:forEach var="product" items="${products}">
            <div>
                <h2>${product.getProd_Name()}</h2>
                <p>${product.getProd_Desc()}</p>
                <p>Price: ${product.getProd_Price()}</p>
                <%-- Display the product image if available --%>
                <c:if test="${not empty product.getProd_Image()}">
                    <img src="data:image/jpeg;base64,${product.getProd_Image()}" alt="Product Image">
                </c:if>
            </div>
        </c:forEach>
    </div>
    <!--CONTENT END-->
    <br>

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
            <p><a href="Profile.jsp">Profile</a></p>
            <p><a href="catalog.jsp">Catalog</a></p>
            <p><a href="cart.jsp">Cart</a></p>
            <p><a href="AboutUs.jsp">About Us</a></p>
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
