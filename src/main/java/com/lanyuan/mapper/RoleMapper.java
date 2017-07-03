package com.lanyuan.mapper;

import java.util.List;

import com.lanyuan.entity.RoleFormMap;
import com.lanyuan.entity.UserFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface RoleMapper extends BaseMapper{
	public List<RoleFormMap> seletUserRole(RoleFormMap map);

	public List<RoleFormMap> findRolePage(RoleFormMap roleFormMap);
	
	public void deleteById(RoleFormMap map);
}
