package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.util.FormMap;

import java.util.Date;

/**
 * Created by zeng on 2017/4/25.
 */
public class Produce extends FormMap<String,Object> {
    private int id;
    private int productId;
    private String productName;
    private String productPicNo;
    private String count;
    private Date needDate;
    private int model;
    private int box;
    private int bell;
    private int openBox;
    private int polish;
    private int hot;
    private int sand;
    private int inspection;
    private int back;
    private int inStock;
    private int reject;
    private int owe;
    private String isFinish;
    private int customerId;
    private String company;

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

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public Date getNeedDate() {
        return needDate;
    }

    public void setNeedDate(Date needDate) {
        this.needDate = needDate;
    }

    public int getModel() {
        return model;
    }

    public void setModel(int model) {
        this.model = model;
    }

    public int getBox() {
        return box;
    }

    public void setBox(int box) {
        this.box = box;
    }

    public int getBell() {
        return bell;
    }

    public void setBell(int bell) {
        this.bell = bell;
    }

    public int getOpenBox() {
        return openBox;
    }

    public void setOpenBox(int openBox) {
        this.openBox = openBox;
    }

    public int getPolish() {
        return polish;
    }

    public void setPolish(int polish) {
        this.polish = polish;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public int getSand() {
        return sand;
    }

    public void setSand(int sand) {
        this.sand = sand;
    }

    public int getInspection() {
        return inspection;
    }

    public void setInspection(int inspection) {
        this.inspection = inspection;
    }

    public int getBack() {
        return back;
    }

    public void setBack(int back) {
        this.back = back;
    }

    public int getInStock() {
        return inStock;
    }

    public void setInStock(int inStock) {
        this.inStock = inStock;
    }

    public int getReject() {
        return reject;
    }

    public void setReject(int reject) {
        this.reject = reject;
    }

    public int getOwe() {
        return owe;
    }

    public void setOwe(int owe) {
        this.owe = owe;
    }

    public String getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(String isFinish) {
        this.isFinish = isFinish;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
}
