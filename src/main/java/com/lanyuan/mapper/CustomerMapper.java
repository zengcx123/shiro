package com.lanyuan.mapper;

import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
public interface CustomerMapper extends BaseMapper {

    List<CustomerFormMap> findCustomerPage(CustomerFormMap customerFormMap);

    List<CustomerFormMap> findCustomer(@Param("id") int id);
}
