package com.lanyuan.mapper;

import com.lanyuan.entity.Analyse;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by zeng on 2017/3/14.
 */
public interface AnalyseMapper extends BaseMapper {

    List<Map<String,Object>> findAnalyseGroupBy(@Param("cus") String cus,@Param("orderNumber") String orderNumber,@Param("productPicNo") String productPicNo,@Param("createDate1") String createDate1,@Param("createDate2") String createDate2,@Param("type") int type,@Param("column") String column,@Param("sort") String sort);

    List<Map<String,Object>> findAnalyse(@Param("orderNumber") String orderNumber,@Param("productPicNo") String productPicNo,@Param("createDate1") String createDate1,@Param("createDate2") String createDate2);


}
