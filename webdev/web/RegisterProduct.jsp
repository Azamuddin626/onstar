<%-- 
    Document   : RegisterProduct
    Created on : 6 Jun 2023, 10:13:02 pm
    Author     : MySystem
--%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.StandardCopyOption" %>
<%@ page language="java" import="javax.servlet.*,javax.servlet.http.*"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Product</title>
    </head>

    <body>
        <jsp:useBean id="product" class="com.Model.RegisterProduct" scope="request"/>

        <%
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));

                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File uploadedFile = new File(filePath);
                        item.write(uploadedFile);

                        // Read the uploaded file content as a byte array
                        byte[] fileContent = Files.readAllBytes(uploadedFile.toPath());

                        // Set the file content in the RegisterProduct object
                        product.setProd_Image(fileContent);
                    } else {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        // Set other form field values in the RegisterProduct object
                        if (fieldName.equals("Prod_ID")) {
                            product.setProd_ID(fieldValue);
                        } else if (fieldName.equals("Prod_Name")) {
                            product.setProd_Name(fieldValue);
                        } else if (fieldName.equals("Prod_Desc")) {
                            product.setProd_Desc(fieldValue);
                        } else if (fieldName.equals("Prod_Qty")) {
                            product.setProd_Qty(fieldValue);
                        } else if (fieldName.equals("Prod_Price")) {
                            product.setProd_Price(fieldValue);
                        } else if (fieldName.equals("Category_ID")) {
                            product.setCategory_ID(fieldValue);
                        }
                    }
                }

                int result;

                Class.forName("com.mysql.jdbc.Driver");

                String myURL = "jdbc:mysql://localhost/onstar";
                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                String sInsertQry = "INSERT INTO product(Prod_ID, Prod_Image, Prod_Name, Prod_Desc, Prod_Qty, Prod_Price, Category_ID) VALUES (?,?,?,?,?,?,?) ";

                PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

                myPS.setString(1, product.getProd_ID());
                myPS.setBytes(2, product.getProd_Image());
                myPS.setString(3, product.getProd_Name());
                myPS.setString(4, product.getProd_Desc());
                myPS.setString(5, product.getProd_Qty());
                myPS.setString(6, product.getProd_Price());
                myPS.setString(7, product.getCategory_ID());

                result = myPS.executeUpdate();

                myPS.close();
                myConnection.close();

                if (result > 0) {
                    response.sendRedirect("ManageProduct.jsp");
                } else {
                    out.println("Error occurred while registering the product.");
                }
            }
        %>

        <form method="post" action="RegisterProduct.jsp" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Product ID:</td>
                    <td><input type="text" name="Prod_ID" required></td>
                </tr>
                <tr>
                    <td>Product Image:</td>
                    <td><input type="file" name="Prod_Image" required></td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="Prod_Name" required></td>
                </tr>
                <tr>
                    <td>Product Description:</td>
                    <td><input type="text" name="Prod_Desc" required></td>
                </tr>
                <tr>
                    <td>Product Quantity:</td>
                    <td><input type="text" name="Prod_Qty" required></td>
                </tr>
                <tr>
                    <td>Product Price:</td>
                    <td><input type="text" name="Prod_Price" required></td>
                </tr>
                <tr>
                    <td>Category ID:</td>
                    <td><input type="text" name="Category_ID" required></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Register Product"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
