<%-- 
    Document   : register
    Created on : 19 Jun 2023, 8:18:57 pm
    Author     : MySystem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Login.css">

        <title>Register</title>
        <style>
            *{
                text-align: center;
            }
        </style>
    </head>
    <body>

        <form action="processRegister.jsp" class="form" method="post">
            <h2>SIGN UP</h2>
            <input type="text" name="fname" id="fname" class="box" placeholder="Enter Your First Name" required><br><br>
            <input type="text" name="lname" id="lname" class="box" placeholder="Enter Your Last Name" required><br><br>
            <input type="text" name="phone" id="phone" class="box" placeholder="Enter Phone Number" onkeypress="return validateNumber(event)" required><br><br>
            <select name="role" id="role" class="box" required>
                <option value="">Select Role</option>
                <option value="Staff">Staff</option>
                <option value="Store Manager">Store Manager</option>
                <option value="Store Owner">Store Owner</option>
            </select><br><br>
            <input type="text" name="username" id="username" class="box" placeholder="Enter Your UserName" required><br><br>
            <input type="text" name="password" id="password" class="box" placeholder="Enter Password" required><br><br>
            <br>
            <input type="submit" id="submit" value="Submit">
        </form>
        <script>
            function validateNumber(event) {
                // Get the key code of the pressed key
                var keyCode = event.which ? event.which : event.keyCode;

                // Allow only numbers (0-9) and special keys like backspace, delete, etc.
                if (keyCode >= 48 && keyCode <= 57 || keyCode === 8 || keyCode === 46 || keyCode === 37 || keyCode === 390) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </body>
</html>
