package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.SupplierFormMap;
import com.lanyuan.mapper.CustomerMapper;
import com.lanyuan.mapper.SupplierMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

/**
 * Created by zeng on 2017/3/14.
 */
@Controller
@RequestMapping("/supplier/")
public class SupplierController extends BaseController {

    @Inject
    private SupplierMapper supplierMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/supplier/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        SupplierFormMap supplierFormMap = getFormMap(SupplierFormMap.class);
        supplierFormMap = toFormMap(supplierFormMap, pageNow, pageSize, supplierFormMap.getStr("orderby"));
        supplierFormMap.put("column", column);
        supplierFormMap.put("sort", sort);
        pageView.setRecords(supplierMapper.findSupplierPage(supplierFormMap));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/supplier/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "供应商管理", methods = "供应商管理-新增供应商")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity() throws Exception {
        SupplierFormMap supplierFormMap = getFormMap(SupplierFormMap.class);
        supplierMapper.addEntity(supplierFormMap);
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("customer", supplierMapper.findbyFrist("id", id, CustomerFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/supplier/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="供应商管理",methods="供应商管理-修改供应商")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity() throws Exception {
        SupplierFormMap supplierFormMap = getFormMap(SupplierFormMap.class);
        supplierMapper.editEntity(supplierFormMap);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="供应商管理",methods="供应商管理-删除供应商")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            supplierMapper.deleteByAttribute("id", id, SupplierFormMap.class);
        }
        return "success";
    }
}
