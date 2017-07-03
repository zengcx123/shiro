package com.lanyuan.mapper;

import com.lanyuan.entity.LogFormMap;
import com.lanyuan.mapper.base.BaseMapper;

import java.util.List;

public interface LogMapper extends BaseMapper{

    public List<LogFormMap> findLogPage(LogFormMap logFormMap);
}
