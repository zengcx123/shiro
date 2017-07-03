package com.lanyuan.entity;

import com.lanyuan.util.FormMap;

import java.util.Date;

/**
 * Created by zeng on 2017/3/21.
 */
public class Analyse extends FormMap{
    /**
     *订单表
     */
    private String orderNumber;//订单编号
    private Date deliveryDate;//交货期
    private Date relDeliveryDate;//真实交货期
    /**
     * 订单详情表
     */
    private String total;
    /**
     * 订单详情状态表
     */
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
    /**
     * 产品表
     */
    private String productName;
    private String productPicNo;
    private String productMaterial;
    private String productWeight;
    private String productUnit;

    /**
     * 统计用到的字段
     */
    private int inspectionCount;
    private int accBackCount;
    private int inStockCount;
    private int outStockCount;
    private int stockCount;
    private int oweCount;
    private int backCount;

    /**
     * 客户表
     */
    private String customerId;

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

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

    public int getInspectionCount() {
        return inspectionCount;
    }

    public void setInspectionCount(int inspectionCount) {
        this.inspectionCount = inspectionCount;
    }

    public int getAccBackCount() {
        return accBackCount;
    }

    public void setAccBackCount(int accBackCount) {
        this.accBackCount = accBackCount;
    }

    public int getInStockCount() {
        return inStockCount;
    }

    public void setInStockCount(int inStockCount) {
        this.inStockCount = inStockCount;
    }

    public int getOutStockCount() {
        return outStockCount;
    }

    public void setOutStockCount(int outStockCount) {
        this.outStockCount = outStockCount;
    }

    public int getStockCount() {
        return stockCount;
    }

    public void setStockCount(int stockCount) {
        this.stockCount = stockCount;
    }

    public int getOweCount() {
        return oweCount;
    }

    public void setOweCount(int oweCount) {
        this.oweCount = oweCount;
    }

    public int getBackCount() {
        return backCount;
    }

    public void setBackCount(int backCount) {
        this.backCount = backCount;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }
}
