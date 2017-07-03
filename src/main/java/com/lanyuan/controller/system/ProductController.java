package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.ProductFormMap;
import com.lanyuan.mapper.CustomerMapper;
import com.lanyuan.mapper.ProductMapper;
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
@RequestMapping("/product/")
public class ProductController extends BaseController {

    @Inject
    private ProductMapper productMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/product/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        ProductFormMap productFormMap = getFormMap(ProductFormMap.class);
        productFormMap = toFormMap(productFormMap, pageNow, pageSize, productFormMap.getStr("orderby"));
        productFormMap.put("column", column);
        productFormMap.put("sort", sort);
        pageView.setRecords(productMapper.findProductPage(productFormMap));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/product/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "产品管理", methods = "产品管理-新增产品")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity() throws Exception {
        ProductFormMap productFormMap = getFormMap(ProductFormMap.class);
        productMapper.addEntity(productFormMap);
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("product", productMapper.findbyFrist("id", id, ProductFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/product/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="产品管理",methods="产品管理-修改产品")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity() throws Exception {
        ProductFormMap productFormMap = getFormMap(ProductFormMap.class);
        productMapper.editEntity(productFormMap);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="产品管理",methods="产品管理-删除产品")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            productMapper.deleteByAttribute("id", id, ProductFormMap.class);
        }
        return "success";
    }
}
