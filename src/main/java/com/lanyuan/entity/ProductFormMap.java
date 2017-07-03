package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.util.FormMap;

/**
 * Created by zeng on 2017/3/14.
 */
@TableSeg(tableName = "tap_product", id="id")
public class ProductFormMap extends FormMap<String,Object> {

    private static final long serialVersionUID = 1L;
}
