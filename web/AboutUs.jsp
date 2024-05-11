<%-- 
    Document   : AboutUs
    Created on : 28 Jun 2023, 8:51:00 pm
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Grandstander&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="AboutUs.css" />
        <title>About Us</title>
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

        <!-- CONTENT Start Here -->
        <section class="contactUs">
            <h2>Contact Us</h2>
            <div class="contactUs-content">
                <div class="contact-item">
                    <a href="https://goo.gl/maps/VBJqDVNpiNzASimw9">
                        <img src="All_Images\ImagesIcon\location.png" alt="address icon">
                    </a>
                    <h5>Address</h5>
                    <p>PaduTECH Enterprise Jalan Gong Badak, Kampung Wakaf Tembesu, 21300 Kuala Terengganu, Terengganu</p>
                </div>
                <div class="contact-item">
                    <a href="tel:123-456-7890">
                        <img src="All_Images\ImagesIcon\call.png" alt="Call Button">
                    </a>
                    <h5>Phone</h5>
                    <p class="phoneNo">+60 11-6090 2935</p>
                </div>
                <div class="contact-item">
                    <a href="mailto:info@example.com">
                        <img src="All_Images\ImagesIcon\mail.png" alt="Email us">
                    </a>
                    <h5>Email</h5>
                    <p class="email">info@jomlimbong.com</p>
                </div>
            </div>
        </section>

        <section class="store-info">
            <div class="store-info-content">
                <div class="row">
                    <div class="info-column">
                        <h5>Cafeteria Details</h5>
                        <p>Cafe Abdul Rahman Limbong Universiti Malaysia Terengganu (UMT) 21030 Kuala Terengganu,
                            Terengganu, MALAYSIA</p>
                        <h5>Contact Number: 123-456-7890</h5>
                    </div>
                    <div class="info-column">
                        <a href="https://goo.gl/maps/ggJijQw5SQVndhV29">
                            <img src="All_Images\ImagesIcon\KEDAI BUKU UMT.png" alt="address icon">
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <br>
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
