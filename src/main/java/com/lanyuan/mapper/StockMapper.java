package com.lanyuan.mapper;

import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.Stock;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by zeng on 2017/3/14.
 */
public interface StockMapper extends BaseMapper {

    List<Stock> findStockPage(Stock stock);

    Stock findStockbyId(@Param("id") int id);

    void addStockEntity(@Param("productId") int productId,@Param("stock") String stock);

    void updateStockEntity(@Param("id") int id,@Param("stock") String stock);

    void deleteStockEntity(@Param("id") int id);

    Stock findStockbyProductId(@Param("productId") int productId);

    void updateStockByProductId(@Param("productId") int productId,@Param("stock") String stock);

    Stock getAllWeight(@Param("productMaterial") String productMaterial);
}
