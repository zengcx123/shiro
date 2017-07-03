package com.lanyuan.mapper;

import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.SupplierFormMap;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
public interface SupplierMapper extends BaseMapper {

    List<SupplierFormMap> findSupplierPage(SupplierFormMap supplierFormMap);

    List<SupplierFormMap> findSupplier(@Param("id") int id);
}
