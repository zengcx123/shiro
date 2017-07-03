package com.lanyuan.mapper;

import java.util.List;
import java.util.Map;

import com.lanyuan.entity.UserFormMap;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;


public interface UserMapper extends BaseMapper{

	public List<UserFormMap> findUserPage(UserFormMap userFormMap);

	public void resetPassword(@Param("id") int id,@Param("password") String password);

	public UserFormMap findUserById(@Param("id") int id);

	void updateHead(@Param("id") int id,@Param("path") String path);
	
}
