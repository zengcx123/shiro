package com.lanyuan.mapper;

import com.lanyuan.entity.ModelFormMap;
import com.lanyuan.entity.RawFormMap;
import com.lanyuan.entity.Stock;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
public interface ModelMapper extends BaseMapper {

    List<ModelFormMap> findModelPage(ModelFormMap modelFormMap);

    ModelFormMap findModelbyProductId(@Param("productId") int productId);

    ModelFormMap findModelbyId(@Param("id") int id);

    void addModelEntity(@Param("productId") int productId,@Param("stock") String stock);

    void updateModelEntity(@Param("id") int id,@Param("stock") String stock);

    void deleteModelEntity(@Param("id") int id);
}
