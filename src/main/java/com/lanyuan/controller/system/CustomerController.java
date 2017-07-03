package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.RoleFormMap;
import com.lanyuan.entity.UserFormMap;
import com.lanyuan.mapper.CustomerMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.UUID;

/**
 * Created by zeng on 2017/3/14.
 */
@Controller
@RequestMapping("/customer/")
public class CustomerController extends BaseController {

    @Inject
    private CustomerMapper customerMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/customer/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        CustomerFormMap customerFormMap = getFormMap(CustomerFormMap.class);
        customerFormMap = toFormMap(customerFormMap, pageNow, pageSize, customerFormMap.getStr("orderby"));
        customerFormMap.put("column", column);
        customerFormMap.put("sort", sort);
        pageView.setRecords(customerMapper.findCustomerPage(customerFormMap));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/customer/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "客户管理", methods = "客户管理-新增客户")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity() throws Exception {
        CustomerFormMap customerFormMap = getFormMap(CustomerFormMap.class);
        customerMapper.addEntity(customerFormMap);
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("customer", customerMapper.findbyFrist("id", id, CustomerFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/customer/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="客户管理",methods="客户管理-修改客户")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity() throws Exception {
        CustomerFormMap customerFormMap = getFormMap(CustomerFormMap.class);
        customerMapper.editEntity(customerFormMap);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="客户管理",methods="客户管理-删除客户")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            customerMapper.deleteByAttribute("id", id, CustomerFormMap.class);
        }
        return "success";
    }
}
