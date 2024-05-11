/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author MySystem
 */
public class RegisterProduct {

    private byte[] Prod_Image;
    private String Prod_ID;
    private String Prod_Name;
    private String Prod_Desc;
    private String Prod_Qty;
    private String Prod_Price;
    private String Category_ID;

    public byte[] getProd_Image() {
        return Prod_Image;
    }

    public void setProd_Image(byte[] Prod_Image) {
        this.Prod_Image = Prod_Image;
    }

    public String getProd_ID() {
        return Prod_ID;
    }

    public void setProd_ID(String Prod_ID) {
        this.Prod_ID = Prod_ID;
    }

    public String getProd_Name() {
        return Prod_Name;
    }

    public void setProd_Name(String Prod_Name) {
        this.Prod_Name = Prod_Name;
    }

    public String getProd_Desc() {
        return Prod_Desc;
    }

    public void setProd_Desc(String Prod_Desc) {
        this.Prod_Desc = Prod_Desc;
    }

    public String getProd_Qty() {
        return Prod_Qty;
    }

    public void setProd_Qty(String Prod_Qty) {
        this.Prod_Qty = Prod_Qty;
    }

    public String getProd_Price() {
        return Prod_Price;
    }

    public void setProd_Price(String Prod_Price) {
        this.Prod_Price = Prod_Price;
    }

    public String getCategory_ID() {
        return Category_ID;
    }

    public void setCategory_ID(String Category_ID) {
        this.Category_ID = Category_ID;
    }

}
