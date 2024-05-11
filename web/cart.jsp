<%-- 
    Document   : cart
    Created on : 29 Jun 2023, 1:50:12 am
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Grandstander&display=swap" rel="stylesheet" />
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link rel="stylesheet" href="cart.css" />
        <title>Cart</title>    
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
        <h1>Your Cart</h1>

        <table>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
            <c:forEach var="cartItem" items="${cartItems}">
                <tr>
                    <td>${cartItem.prod_ID}</td>
                    <td>${cartItem.order_Quantity}</td>
                    <td>
                        <button onclick="removeCartItem(${CartItem.cart_ID})">Remove</button>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <a href="checkout.jsp">Proceed to Checkout</a>

        <script>
            function removeCartItem(cartID) {
                // Implement logic to remove the cart item via AJAX or form submission
            }
        </script>
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
</html>