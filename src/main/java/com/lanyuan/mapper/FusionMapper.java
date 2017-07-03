package com.lanyuan.mapper;

import com.lanyuan.entity.Fusion;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by zeng on 2017/4/26.
 */
public interface FusionMapper extends BaseMapper {

    List<Fusion> findFusionPage(Fusion fusion);

    void addFusionEntity(@Param("rawId") String rawId,@Param("useId") int useId,@Param("fusionNo") String fusionNo,@Param("person") String person,@Param("createDate") Date createDate,@Param("result") String result);

    void addFusionMeterialEntity(@Param("rawId") String rawId,@Param("id") int id,@Param("count") String count);

    List<Fusion> findMeterial(@Param("rawId") String rawId);

    List<Fusion> findFusion();
}
