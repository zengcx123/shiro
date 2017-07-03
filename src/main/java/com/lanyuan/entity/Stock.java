package com.lanyuan.entity;

import com.lanyuan.util.FormMap;

/**
 * Created by zeng on 2017/4/6.
 */
public class Stock extends FormMap {

    private int id;
    private int productId;
    private String stock;
    private String productName;
    private String productPicNo;
    private String productMaterial;
    private String productWeight;
    private String productUnit;
    private String productPrice;

    private String allWeight;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductPicNo() {
        return productPicNo;
    }

    public void setProductPicNo(String productPicNo) {
        this.productPicNo = productPicNo;
    }

    public String getProductMaterial() {
        return productMaterial;
    }

    public void setProductMaterial(String productMaterial) {
        this.productMaterial = productMaterial;
    }

    public String getProductWeight() {
        return productWeight;
    }

    public void setProductWeight(String productWeight) {
        this.productWeight = productWeight;
    }

    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getAllWeight() {
        return allWeight;
    }

    public void setAllWeight(String allWeight) {
        this.allWeight = allWeight;
    }
}
