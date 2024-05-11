<%-- 
    Document   : ManageOrder
    Created on : 11 Jun 2023, 1:31:52 pm
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Grandstander&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="ManageOrder.css" />
    <title>Manage Order Page</title>
</head>

<body>
    <!-- NAVIGATION Start Here-->
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
    <!-- NAVIGATION END-->

    <!-- CONTENT Start Here -->
    <header>
        <h2>Manage Order Payment</h2>
        <div class="search-container">
            <form class="search-bar">
                <input type="search" placeholder="Search..." />
                <button type="submit">
                    <img src="All_Images/ImagesIcon/search (1).png" alt="searchlogo" />
                </button>
            </form>
        </div>
    </header>

    <table>
        <thead>
            <tr>
                <th>Cart ID</th>
                <th>Payment Date</th>
                <th>Receipt Payment</th>
                <th>Total Payment</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onstar", "root", "admin");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM `order payment`");

                // Iterate through the result set and generate table rows
                while (rs.next()) {
                    String cartId = rs.getString("Cart_ID");
                    String paymentDate = rs.getString("Pay_Date");
                    String receiptPayment = "All_Images/Payment File/" + rs.getString("Pay_Receipt");
                    String totalPayment = rs.getString("Total_Payment");
                    String status = rs.getString("Pay_Status");
            %>
            <tr>
                <td><%= cartId %></td>
                <td><%= paymentDate %></td>
                <td><a href="DownloadServlet?fileName=<%= rs.getString("Pay_Receipt") %>">Download</a></td>
                <td><%= totalPayment %></td>
                <td>
                    <select name="payment" id="payment">
                        <option value="pending" <%= status.equals("pending") ? "selected" : "" %>>Pending</option>
                        <option value="approve" <%= status.equals("approve") ? "selected" : "" %>>Approve</option>
                        <option value="decline" <%= status.equals("decline") ? "selected" : "" %>>Decline</option>
                    </select>
                </td>
            </tr>
            <% 
                }
                // Close the database connection
                rs.close();
                stmt.close();
                con.close();
            %>
        </tbody>
    </table>
    <br /><br />

    <!-- CONTENT END -->

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
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="https://www.facebook.com/profile.php?id=100033284300731"><img
                        src="All_Images/ImagesIcon/facebook.png" alt="Facebook" /></a>
                <a href="https://instagram.com/kosiswa.executives?igshid=YmMyMTA2M2Y="><img
                        src="All_Images/ImagesIcon/instagram.png" alt="Instagram" /></a>
                <a href="https://goo.gl/maps/QrfnnCdco2X1n5CDA"><img src="All_Images/ImagesIcon/map.png"
                        alt="Maps" /></a>
            </div>
        </div>
    </footer>

    <!-- FOOTER END -->
</body>

</html>
