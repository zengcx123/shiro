package com.lanyuan.mapper;

import com.lanyuan.entity.RawFormMap;
import com.lanyuan.entity.Stock;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
public interface RawMapper extends BaseMapper {

    List<RawFormMap> findRawPage(RawFormMap rawFormMap);

    RawFormMap findRawbyId(@Param("id") int id);

    void addRawEntity(@Param("name") String name, @Param("count") String count,@Param("unit") String unit, @Param("identification") String identification);

    void updateRawEntity(@Param("id") int id, @Param("name") String name, @Param("count") String count,@Param("unit") String unit, @Param("identification") String identification);

    void deleteRawEntity(@Param("id") int id);

    RawFormMap findRawByCondition(@Param("name") String name,@Param("identification") String identification);

    void updateRawEntityByCondition(@Param("name") String name,@Param("identification") String identification,@Param("count") String count);

    List<RawFormMap> findRaw();

    void updateRawCount(@Param("id") int id,@Param("count") String count);
}
