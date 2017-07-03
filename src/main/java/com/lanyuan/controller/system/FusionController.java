package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.Fusion;
import com.lanyuan.entity.Use;
import com.lanyuan.mapper.FusionMapper;
import com.lanyuan.mapper.RawMapper;
import com.lanyuan.mapper.UseMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
import com.lanyuan.util.TapUtil;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

/**
 * Created by zeng on 2017/4/26.
 */
@Controller
@RequestMapping("/fusion/")
public class FusionController extends BaseController {
    @Inject
    private FusionMapper fusionMapper;
    @Inject
    private UseMapper useMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/fusion/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        Fusion fusion = getFormMap(Fusion.class);
        fusion = toFormMap(fusion, pageNow, pageSize, fusion.getStr("orderby"));
        fusion.put("column", column);
        fusion.put("sort", sort);
        pageView.setRecords(fusionMapper.findFusionPage(fusion));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        model.addAttribute("use", JSONArray.fromObject(useMapper.findUse()));
        return Common.BACKGROUND_PATH + "/system/fusion/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "熔炼管理", methods = "熔炼管理-新增熔炼")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity(HttpServletRequest request) throws Exception {
        String rawId = UUID.randomUUID().toString();
        Date createDate = new Date();
        String useId = request.getParameter("useId").toString();
        String person = request.getParameter("person").toString();
        String fusionNo = request.getParameter("fusionNo").toString();
        String result = request.getParameter("result").toString();
        fusionMapper.addFusionEntity(rawId,Integer.valueOf(useId),fusionNo,person,createDate,result);
        return "success";
    }

    @RequestMapping("addMeterialUI")
    public String addMeterialUI(Model model, HttpServletRequest request) throws Exception {
        String rawId = request.getParameter("rawId").toString();
        String useId = request.getParameter("useId").toString();
        model.addAttribute("useMeterial", useMapper.findUseMeterial(Integer.valueOf(useId)));
        model.addAttribute("rawId", rawId);
        return Common.BACKGROUND_PATH + "/system/fusion/addMeterial";
    }

    @ResponseBody
    @RequestMapping("addMeterialEntity")
    @SystemLog(module = "熔炼管理", methods = "熔炼管理-新增熔炼详细")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addMeterialEntity(HttpServletRequest request) throws Exception {
        String rawId = request.getParameter("rawId").toString();
        String id = request.getParameter("id").toString();//rawStockId
        String id2 = request.getParameter("id2").toString();//materialId
        String count = request.getParameter("count").toString();//count
        String stockCount = request.getParameter("stockCount").toString();
        if(Integer.valueOf(count)>Integer.valueOf(stockCount)){
            return "1";
        }
        fusionMapper.addFusionMeterialEntity(rawId,Integer.valueOf(id),count);

        //根据id2减少材料领用剩余
        useMapper.updateOverplus(Integer.valueOf(id2),count);

        return "success";
    }

    @RequestMapping("meterialUI")
    public String meterialUI(Model model, HttpServletRequest request) throws Exception {
        String rawId = request.getParameter("rawId").toString();
        model.addAttribute("meterial", fusionMapper.findMeterial(rawId));
        return Common.BACKGROUND_PATH + "/system/fusion/meterial";
    }
}
