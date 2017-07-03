package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.ModelFormMap;
import com.lanyuan.entity.RawFormMap;
import com.lanyuan.entity.Stock;
import com.lanyuan.mapper.ProductMapper;
import com.lanyuan.mapper.RawMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
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
@RequestMapping("/raw/")
public class RawStockController extends BaseController {

    @Inject
    private RawMapper rawMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/raw/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        RawFormMap rawFormMap = getFormMap(RawFormMap.class);
        rawFormMap = toFormMap(rawFormMap, pageNow, pageSize, rawFormMap.getStr("orderby"));
        rawFormMap.put("column", column);
        rawFormMap.put("sort", sort);
        pageView.setRecords(rawMapper.findRawPage(rawFormMap));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/raw/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "原材料库存管理", methods = "原材料库存管理-新增原材料库存")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity(HttpServletRequest request) throws Exception {
        String name = request.getParameter("name").toString();
        String count = request.getParameter("count").toString();
        String unit = request.getParameter("unit").toString();
        String identification = request.getParameter("identification").toString();

        RawFormMap rawFormMap = rawMapper.findRawByCondition(name,identification);
        if(rawFormMap != null){
            return "false";
        }else{
            rawMapper.addRawEntity(name,count,unit,identification);
            return "success";
        }
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("raw", rawMapper.findRawbyId(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/raw/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="原材料库存管理",methods="原材料库存管理-修改原材料库存")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        String name = request.getParameter("name").toString();
        String count = request.getParameter("count").toString();
        String unit = request.getParameter("unit").toString();
        String identification = request.getParameter("identification").toString();
        rawMapper.updateRawEntity(Integer.valueOf(id),name,count,unit,identification);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="原材料库存管理",methods="原材料库存管理-删除原材料库存")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++) {
                rawMapper.deleteRawEntity(Integer.valueOf(idArr[i]));
            }
        }
        return "success";
    }
}
