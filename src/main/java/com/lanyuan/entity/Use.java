package com.lanyuan.entity;

import com.lanyuan.util.FormMap;

import java.util.Date;

/**
 * Created by zeng on 2017/4/26.
 */
public class Use extends FormMap {
    //材料领用主表
    private int id1;
    private String rawId1;
    private String userNo1;
    private String person1;
    private Date createDate1;
    //材料领用细表
    private int id2;
    private String rawId2;
    private int rawStockId2;
    private String count2;
    private String overplus2;
    //材料库存表
    private int id3;
    private String name3;
    private String count3;
    private String unit3;
    private String identification3;

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public String getRawId1() {
        return rawId1;
    }

    public void setRawId1(String rawId1) {
        this.rawId1 = rawId1;
    }

    public String getUserNo1() {
        return userNo1;
    }

    public void setUserNo1(String userNo1) {
        this.userNo1 = userNo1;
    }

    public String getPerson1() {
        return person1;
    }

    public void setPerson1(String person1) {
        this.person1 = person1;
    }

    public Date getCreateDate1() {
        return createDate1;
    }

    public void setCreateDate1(Date createDate1) {
        this.createDate1 = createDate1;
    }

    public int getId2() {
        return id2;
    }

    public void setId2(int id2) {
        this.id2 = id2;
    }

    public String getRawId2() {
        return rawId2;
    }

    public void setRawId2(String rawId2) {
        this.rawId2 = rawId2;
    }

    public int getRawStockId2() {
        return rawStockId2;
    }

    public void setRawStockId2(int rawStockId2) {
        this.rawStockId2 = rawStockId2;
    }

    public String getCount2() {
        return count2;
    }

    public void setCount2(String count2) {
        this.count2 = count2;
    }

    public String getOverplus2() {
        return overplus2;
    }

    public void setOverplus2(String overplus2) {
        this.overplus2 = overplus2;
    }

    public int getId3() {
        return id3;
    }

    public void setId3(int id3) {
        this.id3 = id3;
    }

    public String getName3() {
        return name3;
    }

    public void setName3(String name3) {
        this.name3 = name3;
    }

    public String getCount3() {
        return count3;
    }

    public void setCount3(String count3) {
        this.count3 = count3;
    }

    public String getUnit3() {
        return unit3;
    }

    public void setUnit3(String unit3) {
        this.unit3 = unit3;
    }

    public String getIdentification3() {
        return identification3;
    }

    public void setIdentification3(String identification3) {
        this.identification3 = identification3;
    }
}
