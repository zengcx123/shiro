package com.lanyuan.entity;

import com.lanyuan.util.FormMap;

import java.util.Date;

/**
 * Created by zeng on 2017/3/17.
 */
public class Detail extends FormMap{
    private int id;
    private int orderId;
    private int productId;
    private String total;
    private String orderNumber;
    private String productMaterial;
    private String productName;
    private String productPicNo;
    private String productPrice;
    private String productUnit;
    private String productWeight;

    private Date deliveryDate;
    private Date relDeliveryDate;
    private String isBack;

    private String isFinish;
    private int inspection;
    private int accBack;
    private int inStock;
    private int outStock;
    private int owe;
    private int back;

    private String remark;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getProductMaterial() {
        return productMaterial;
    }

    public void setProductMaterial(String productMaterial) {
        this.productMaterial = productMaterial;
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

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit;
    }

    public String getProductWeight() {
        return productWeight;
    }

    public void setProductWeight(String productWeight) {
        this.productWeight = productWeight;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Date getRelDeliveryDate() {
        return relDeliveryDate;
    }

    public void setRelDeliveryDate(Date relDeliveryDate) {
        this.relDeliveryDate = relDeliveryDate;
    }

    public String getIsBack() {
        return isBack;
    }

    public void setIsBack(String isBack) {
        this.isBack = isBack;
    }

    public String getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(String isFinish) {
        this.isFinish = isFinish;
    }

    public int getInspection() {
        return inspection;
    }

    public void setInspection(int inspection) {
        this.inspection = inspection;
    }

    public int getAccBack() {
        return accBack;
    }

    public void setAccBack(int accBack) {
        this.accBack = accBack;
    }

    public int getInStock() {
        return inStock;
    }

    public void setInStock(int inStock) {
        this.inStock = inStock;
    }

    public int getOutStock() {
        return outStock;
    }

    public void setOutStock(int outStock) {
        this.outStock = outStock;
    }

    public int getOwe() {
        return owe;
    }

    public void setOwe(int owe) {
        this.owe = owe;
    }

    public int getBack() {
        return back;
    }

    public void setBack(int back) {
        this.back = back;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
