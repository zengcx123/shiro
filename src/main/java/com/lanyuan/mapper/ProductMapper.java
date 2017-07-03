package com.lanyuan.mapper;

import com.lanyuan.entity.ProductFormMap;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
public interface ProductMapper extends BaseMapper {

    List<ProductFormMap> findProductPage(ProductFormMap productFormMap);

    List<ProductFormMap> findProduct();
}
