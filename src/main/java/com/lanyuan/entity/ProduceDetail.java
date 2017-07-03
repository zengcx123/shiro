package com.lanyuan.entity;

import com.lanyuan.util.FormMap;

import java.util.Date;

/**
 * Created by zeng on 2017/5/2.
 */
public class ProduceDetail extends FormMap<String,Object> {
    private int id;
    private int planId;
    private Date startDate;
    private Date endDate;
    private String count;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
}
