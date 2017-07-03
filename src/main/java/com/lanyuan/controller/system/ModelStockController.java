package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.ModelFormMap;
import com.lanyuan.entity.Stock;
import com.lanyuan.mapper.ModelMapper;
import com.lanyuan.mapper.ProductMapper;
import com.lanyuan.mapper.StockMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by zeng on 2017/3/14.
 */
@Controller
@RequestMapping("/model/")
public class ModelStockController extends BaseController {

    @Inject
    private ModelMapper modelMapper;
    @Inject
    private ProductMapper productMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/model/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        ModelFormMap modelFormMap = getFormMap(ModelFormMap.class);
        modelFormMap = toFormMap(modelFormMap, pageNow, pageSize, modelFormMap.getStr("orderby"));
        modelFormMap.put("column", column);
        modelFormMap.put("sort", sort);
        pageView.setRecords(modelMapper.findModelPage(modelFormMap));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        model.addAttribute("product", JSONArray.fromObject(productMapper.findProduct()));
        return Common.BACKGROUND_PATH + "/system/model/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "模具库存管理", methods = "模具库存管理-新增模具库存")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity(HttpServletRequest request) throws Exception {
        String productId = request.getParameter("productId").toString();
        String stock = request.getParameter("stock").toString();

        ModelFormMap modelFormMap = modelMapper.findModelbyProductId(Integer.valueOf(productId));
        if(modelFormMap != null){
            return "false";
        }else{
            modelMapper.addModelEntity(Integer.valueOf(productId),stock);
            return "success";
        }
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("product",productMapper.findProduct());
            model.addAttribute("model", modelMapper.findModelbyId(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/model/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="模具库存管理",methods="模具库存管理-修改模具库存")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        String stock = request.getParameter("stock").toString();
        modelMapper.updateModelEntity(Integer.valueOf(id),stock);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="模具库存管理",methods="模具库存管理-删除模具库存")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++) {
                modelMapper.deleteModelEntity(Integer.valueOf(idArr[i]));
            }
        }
        return "success";
    }
}
