package com.lanyuan.mapper;

import com.lanyuan.entity.UserLoginFormMap;
import com.lanyuan.mapper.base.BaseMapper;

import java.util.List;

public interface UserLoginMapper extends BaseMapper{

    public List<UserLoginFormMap> findUserLoginPage(UserLoginFormMap userLoginFormMap);
}
