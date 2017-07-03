package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
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
@RequestMapping("/use/")
public class UseController extends BaseController {
    @Inject
    private UseMapper useMapper;
    @Inject
    private RawMapper rawMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/use/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        Use use = getFormMap(Use.class);
        use = toFormMap(use, pageNow, pageSize, use.getStr("orderby"));
        use.put("column", column);
        use.put("sort", sort);
        pageView.setRecords(useMapper.findUsePage(use));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI() throws Exception {
        return Common.BACKGROUND_PATH + "/system/use/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "领用管理", methods = "领用管理-新增领用")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity(HttpServletRequest request) throws Exception {
        String rawId = UUID.randomUUID().toString();
        Date createDate = new Date();
        String person = request.getParameter("person").toString();
        String useNo = TapUtil.getNumber("U");
        useMapper.addUseEntity(rawId,useNo,person,createDate);
        return "success";
    }

    @RequestMapping("addMeterialUI")
    public String addMeterialUI(Model model, HttpServletRequest request) throws Exception {
        String rawId = request.getParameter("rawId").toString();
        model.addAttribute("raw", JSONArray.fromObject(rawMapper.findRaw()));
        model.addAttribute("rawId", rawId);
        return Common.BACKGROUND_PATH + "/system/use/addMeterial";
    }

    @ResponseBody
    @RequestMapping("addMeterialEntity")
    @SystemLog(module = "领用管理", methods = "领用管理-新增领用详细")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addMeterialEntity(HttpServletRequest request) throws Exception {
        String rawId = request.getParameter("rawId").toString();
        String id = request.getParameter("id").toString();
        String count = request.getParameter("count").toString();
        String stockCount = request.getParameter("stockCount").toString();
        if(Integer.valueOf(count)>Integer.valueOf(stockCount)){
            return "1";
        }
        useMapper.addUseMeterialEntity(rawId,Integer.valueOf(id),count);

        //减少库存
        rawMapper.updateRawCount(Integer.valueOf(id),count);

        return "success";
    }

    @RequestMapping("meterialUI")
    public String meterialUI(Model model, HttpServletRequest request) throws Exception {
        String rawId = request.getParameter("rawId").toString();
        model.addAttribute("raw", rawMapper.findRaw());
        model.addAttribute("meterial", useMapper.findMeterial(rawId));
        return Common.BACKGROUND_PATH + "/system/use/meterial";
    }

}
