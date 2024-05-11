<%-- 
    Document   : ProfileStaff
    Created on : 7 Jun 2023, 11:22:29 am
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
        <link rel="stylesheet" href="Profile.css" />
        <title>Profile Information</title>
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
                <li><a href="Login.jsp">Log Out</a></li>
            </ul>
        </nav>
        <!-- NAVIGATION END-->

        <!-- CONTENT START -->
        <BR></BR>
        <div class="container">
            <div class="card">
                <div class="profile-info">
                    <h3>Profile Information</h3>

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
                  
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" value="<%= staffFName%> <%= staffLName%>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone No:</label>
                        <input type="text" id="phone" value="<%= staffPhoneNo%>" readonly />
                    </div>
                    <div class="form-group"> 
                        <label for="roles">Roles:</label>
                        <input type="text" id="roles" value="<%= staffRole%>" readonly/>
                    </div>
                    <div class="form-group"> 
                        <label for="username">Username:</label>
                        <input type="text" id="username" value="<%= staffUsername%>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <div class="password-input">
                            <input type="password" id="password" value="<%= staffPsw%>" readonly />
                            <br>
                            <button onclick="togglePasswordVisibility()">Show/Hide</button>
                        </div>
                    </div> 
                    <div class="edit-button">
                        <button><a href="editStaff.jsp">Edit Profile</a></button>
                    </div>
                    
                </div>
            </div>
        </div>

              <%
                    } else {
                        out.println("Staff not found.");
                    }

                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e);
                }
            } else {
                // If the session doesn't exist or customerID is not set, redirect to the login page
                response.sendRedirect("Login.jsp");
}
%>
        <!-- JavaScript code to handle the password visibility -->
        <script>
            function togglePasswordVisibility() {
                const passwordInput = document.getElementById('password');
                const passwordToggle = document.querySelector('.password-toggle');

                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    passwordToggle.innerHTML = '<i class="fas fa-eye-slash"></i>';
                } else {
                    passwordInput.type = 'password';
                    passwordToggle.innerHTML = '<i class="fas fa-eye"></i>';
                }
            }
        </script>

        <BR></BR>
        <!-- CONTENT END -->
        <!-- FOOTER Start Here -->
        <footer>
            <div class="footer-content">
                <h3>Vision:</h3>
                <p>Innovate Stationary</p>
                <p>Empowered Productivity.</p>
                <h3>Mission:</h3>
                <p>Sustainable,Affordable,Personalized.</p>
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
                            src="All_Images\ImagesIcon\facebook.png" alt="Facebook" /></a>
                    <a href="https://instagram.com/kosiswa.executives?igshid=YmMyMTA2M2Y="><img
                            src="All_Images\ImagesIcon\instagram.png" alt="Instagram" /></a>
                    <a href="https://goo.gl/maps/QrfnnCdco2X1n5CDA"><img 
                            src="All_Images\ImagesIcon\map.png" alt="Maps" /></a>
                </div>
            </div>
        </footer>

        <!-- FOOTER END -->


    </body>

</html>

