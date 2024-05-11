/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private final Connection connection;

    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    public Product getProductByID(String Prod_ID) throws SQLException {
        String query = "SELECT * FROM product WHERE Prod_ID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, Prod_ID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Product product = new Product();
                    product.setProd_ID(resultSet.getInt("Prod_ID"));
                    product.setProd_Image(resultSet.getBytes("Prod_Image"));
                    product.setProd_Name(resultSet.getString("Prod_Name"));
                    product.setProd_Desc(resultSet.getString("Prod_Desc"));
                    product.setProd_Qty(resultSet.getInt("Prod_Qty"));
                    product.setProd_Price(resultSet.getDouble("Prod_Price"));
                    product.setCategory_ID(resultSet.getString("Category_ID"));
                    return product;
                }
            }
        }
        return null; // Return null if product is not found
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();

        String query = "SELECT * FROM product";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Product product = new Product();
                product.setProd_ID(resultSet.getInt("Prod_ID"));
                product.setProd_Name(resultSet.getString("Prod_Name"));
                product.setProd_Desc(resultSet.getString("Prod_Desc"));
                product.setProd_Qty(resultSet.getInt("Prod_Qty"));
                product.setProd_Price(resultSet.getDouble("Prod_Price"));
                // Set other fields if needed
                products.add(product);
            }
        }

        return products;
    }

    // Add more methods for database operations such as adding, updating, and deleting products
    // based on your application's requirements
}
