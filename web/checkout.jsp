<%-- 
    Document   : checkout
    Created on : 25 Jun 2023, 11:24:10 pm
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
        <link rel="stylesheet" href="checkout.css" />
        <title>Checkout</title>
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
        <h1>Checkout</h1>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <form action="">
                        <h2>Order Summary</h2>
                        <br><br>

                        <div class="checkout-form">
                            <label for="name">Item Subtotal:</label>
                            <input type="text" id="name" required>

                            <label for="email">Order Charge:</label>
                            <input type="email" id="email" required>

                            <label for="address">Order Id:</label>
                            <textarea id="address" required></textarea>

                            <label for="total">Total:</label>
                            <textarea id="total" required></textarea>
                        </div>

                    </form>
                </div>
            </div>
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <form action="">
                            <div class="row">
                                <div class="col">
                                    <h3 class="title">PAYMENT</h3>
                                    <div class="payment-methods">
                                        <label>
                                            <input type="radio" name="payment" value="card" id="card-option" checked>
                                            Online Transfer
                                        </label>
                                        <label>
                                            <input type="radio" name="payment" value="qr" id="qr-option">
                                            QR Code
                                        </label>
                                        
                                    </div>
<br>
                                    <div class="card-details">
                                        <div class="inputBox">
                                            <span>Number Account :</span>
                                            <h4>Kedai Buku UMT</h4>
                                            <h2>7637326718</h2>
                                            <h4>CIMB</h4>
                                        </div>
                                    </div>

                                    <div id="qr-details" style="display: none;">
                                        <div class="inputBox">
                                            <span>QR Code:</span><br>
                                        </div>
                                        <img src="All_Images\ImagesIcon\qrcode.jpg" alt="">

                                    </div>

                                    <div class="file-input">
                                        <label for="receipt-file" class="file-btn">Choose file: </label><br>
                                        <input type="file" id="receipt-file" accept="image/*">
                                    </div>
                                </div>
                                <button class="submit-btn" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="checkout.js"></script>

        <script>
            const paymentMethods = document.querySelector('.payment-methods');
            const qrDetails = document.getElementById('qr-details');
            const cardDetails = document.querySelector('.card-details');
            const receiptFileInput = document.getElementById('receipt-file');
            const receiptFileNameInput = document.getElementById('receipt-file-name');

            paymentMethods.addEventListener('change', function () {
                if (document.getElementById('qr-option').checked) {
                    qrDetails.style.display = 'block';
                    cardDetails.style.display = 'none';
                } else if (document.getElementById('card-option').checked) {
                    qrDetails.style.display = 'none';
                    cardDetails.style.display = 'block';
                }
            });

            receiptFileInput.addEventListener('change', function () {
                if (receiptFileInput.files.length > 0) {
                    receiptFileNameInput.value = receiptFileInput.files[0].name;
                } else {
                    receiptFileNameInput.value = 'No file chosen';
                }
            });

            const submitBtn = document.querySelector('.submit-btn');

            submitBtn.addEventListener('click', function () {
                alert('Thank you for using our system!');
            });

        </script>
        <!--CONTENT END-->

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
