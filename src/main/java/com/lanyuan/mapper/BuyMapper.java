package com.lanyuan.mapper;

import com.lanyuan.entity.Buy;
import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
public interface BuyMapper extends BaseMapper {

    List<Buy> findBuyPage(Buy buy);

    void addBuyEntity(Buy buy);

    Buy findBuyById(@Param("id") int id);

    void editBuyEntity(Buy buy);

    void deleteById(@Param("id") int id);
}
