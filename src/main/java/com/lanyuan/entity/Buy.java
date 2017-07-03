package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.util.FormMap;

import java.util.Date;

/**
 * Created by zeng on 2017/4/25.
 */
@TableSeg(tableName = "ly_buy", id="id")
public class Buy extends FormMap<String,Object> {
    private int id;
    private int supplierId;
    private String material;
    private String count;
    private Date createDate;
    private Date needDate;
    private Date deliveryDate;
    private Date inspectionDate;
    private Date inStockDate;
    private String identification;
    private String remark;
    private String isFinish;
    private String company;
    private String person;
    private String buyNo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getNeedDate() {
        return needDate;
    }

    public void setNeedDate(Date needDate) {
        this.needDate = needDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Date getInspectionDate() {
        return inspectionDate;
    }

    public void setInspectionDate(Date inspectionDate) {
        this.inspectionDate = inspectionDate;
    }

    public Date getInStockDate() {
        return inStockDate;
    }

    public void setInStockDate(Date inStockDate) {
        this.inStockDate = inStockDate;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(String isFinish) {
        this.isFinish = isFinish;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getBuyNo() {
        return buyNo;
    }

    public void setBuyNo(String buyNo) {
        this.buyNo = buyNo;
    }
}
