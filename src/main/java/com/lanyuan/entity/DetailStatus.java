package com.lanyuan.entity;

import com.lanyuan.util.FormMap;

import java.util.Date;

/**
 * Created by zeng on 2017/3/17.
 */
public class DetailStatus extends FormMap{
    private int id;
    private int orderDetailId;
    private Date createDate;
    private Date createDate1;
    private Date createDate2;
    private String inspection;
    private String accBack;
    private String inStock;
    private String outStock;
    private String stock;
    private String owe;
    private String back;
    private String orderNumber;
    private String productName;
    private String productPicNo;
    private String total;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate1() {
        return createDate1;
    }

    public void setCreateDate1(Date createDate1) {
        this.createDate1 = createDate1;
    }

    public Date getCreateDate2() {
        return createDate2;
    }

    public void setCreateDate2(Date createDate2) {
        this.createDate2 = createDate2;
    }

    public String getInspection() {
        return inspection;
    }

    public void setInspection(String inspection) {
        this.inspection = inspection;
    }

    public String getAccBack() {
        return accBack;
    }

    public void setAccBack(String accBack) {
        this.accBack = accBack;
    }

    public String getInStock() {
        return inStock;
    }

    public void setInStock(String inStock) {
        this.inStock = inStock;
    }

    public String getOutStock() {
        return outStock;
    }

    public void setOutStock(String outStock) {
        this.outStock = outStock;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getOwe() {
        return owe;
    }

    public void setOwe(String owe) {
        this.owe = owe;
    }

    public String getBack() {
        return back;
    }

    public void setBack(String back) {
        this.back = back;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}
