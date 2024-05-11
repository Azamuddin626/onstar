/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author MySystem
 */
public class CartItem {
    private int cart_ID;
    private String prod_Name;
    private int order_Quantity;
    private double prod_Price;

    public CartItem(int cart_ID, String prod_Name, int order_Quantity, double prod_Price) {
        this.cart_ID = cart_ID;
        this.prod_Name = prod_Name;
        this.order_Quantity = order_Quantity;
        this.prod_Price = prod_Price;
    }

    public int getCart_ID() {
        return cart_ID;
    }

    public void setCart_ID(int cart_ID) {
        this.cart_ID = cart_ID;
    }

    public String getProd_Name() {
        return prod_Name;
    }

    public void setProd_Name(String prod_Name) {
        this.prod_Name = prod_Name;
    }

    public int getOrder_Quantity() {
        return order_Quantity;
    }

    public void setOrder_Quantity(int order_Quantity) {
        this.order_Quantity = order_Quantity;
    }

    public double getProd_Price() {
        return prod_Price;
    }

    public void setProd_Price(double prod_Price) {
        this.prod_Price = prod_Price;
    }
}
