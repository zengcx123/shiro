package com.lanyuan.mapper;

import com.lanyuan.entity.Fusion;
import com.lanyuan.entity.Use;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by zeng on 2017/4/26.
 */
public interface UseMapper extends BaseMapper {

    List<Use> findUsePage(Use use);

    void addUseEntity(@Param("rawId") String rawId, @Param("useNo") String useNo,@Param("person") String person,@Param("createDate") Date createDate);

    void addUseMeterialEntity(@Param("rawId") String rawId, @Param("id") int id, @Param("count") String count);

    List<Use> findMeterial(@Param("rawId") String rawId);

    List<Use> findUse();

    List<Use> findUseMeterial(@Param("useId") int useId);

    void updateOverplus(@Param("id") int id,@Param("count") String count);
}
