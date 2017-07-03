package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.*;
import com.lanyuan.mapper.*;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
import com.lanyuan.util.TapUtil;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by zeng on 2017/4/14.
 */
@Controller
@RequestMapping("/produce/")
public class ProduceController extends BaseController {

    @Inject
    private ProduceMapper produceMapper;
    @Inject
    private ProductMapper productMapper;
    @Inject
    private CustomerMapper customerMapper;
    @Inject
    private FusionMapper fusionMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/produce/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        Produce produce = getFormMap(Produce.class);
        produce = toFormMap(produce, pageNow, pageSize, produce.getStr("orderby"));
        produce.put("column", column);
        produce.put("sort", sort);
        pageView.setRecords(produceMapper.findProducePage(produce));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        model.addAttribute("product",JSONArray.fromObject(productMapper.findProduct()));
        model.addAttribute("customer",customerMapper.findCustomer(0));
        return Common.BACKGROUND_PATH + "/system/produce/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "生产计划管理", methods = "生产计划管理-新增生产计划")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity(HttpServletRequest request) throws Exception {
        String customerId = request.getParameter("customerId").toString();
        String productId = request.getParameter("productId").toString();
        String count = request.getParameter("count").toString();
        String needDate = request.getParameter("needDate").toString();
        String planNo = TapUtil.getNumber("P");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        produceMapper.addProduceEntity(planNo,Integer.valueOf(customerId),Integer.valueOf(productId),count,simpleDateFormat.parse(needDate),Integer.valueOf(count));
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("product",productMapper.findProduct());
            model.addAttribute("customer",customerMapper.findCustomer(0));
            model.addAttribute("produce", produceMapper.findProduceById(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/produce/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="生产计划管理",methods="生产计划管理-修改生产计划管理")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        String needDate = request.getParameter("needDate").toString();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        produceMapper.updateNeedDate(Integer.valueOf(id),simpleDateFormat.parse(needDate));
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="生产计划管理",methods="生产计划管理-删除生产计划")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++) {
                String idStr = idArr[i];
                int newId = Integer.valueOf(idStr);
                List<ProduceDetail> produceDetailList = produceMapper.findDetail(newId);
                List<PlanFormMap> planFormMaps = produceMapper.findStatus(newId);
                if ((produceDetailList != null && produceDetailList.size() > 0)
                        || (planFormMaps != null && planFormMaps.size() > 0)) {
                    return "1";
                }
                produceMapper.deleteProduceById(newId);
            }
        }
        return "success";
    }

    @RequestMapping("addDetailUI")
    public String addDetailUI(Model model, HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        model.addAttribute("id", id);
        return Common.BACKGROUND_PATH + "/system/produce/addDetail";
    }

    @ResponseBody
    @RequestMapping("addDetail")
    @SystemLog(module = "生产计划管理", methods = "生产计划管理-新增生产计划详细")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addDetailEntity(HttpServletRequest request) throws Exception {
        String planId = request.getParameter("planId").toString();
        String startDate = request.getParameter("startDate").toString();
        String endDate = request.getParameter("endDate").toString();
        String count = request.getParameter("count").toString();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        produceMapper.addDetailEntity(Integer.valueOf(planId),simpleDateFormat.parse(startDate),simpleDateFormat.parse(endDate),count);
        return "success";
    }

    @RequestMapping("detailUI")
    public String detailUI(Model model, HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        model.addAttribute("detail", produceMapper.findDetail(Integer.valueOf(id)));
        return Common.BACKGROUND_PATH + "/system/produce/detail";
    }

    @ResponseBody
    @RequestMapping("deleteDetailEntity")
    @SystemLog(module = "生产计划管理", methods = "生产计划管理-删除生产计划详情")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String deleteDetailEntity(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        produceMapper.deleteProduceDetailEntity(Integer.valueOf(id));
        return "success";
    }

    @RequestMapping("addStatusUI")
    public String addStatusUI(Model model,HttpServletRequest request) throws Exception {
        String planId = request.getParameter("planId").toString();
        model.addAttribute("fusion",JSONArray.fromObject(fusionMapper.findFusion()));
        model.addAttribute("planId",planId);
        return Common.BACKGROUND_PATH + "/system/produce/status";
    }

    @ResponseBody
    @RequestMapping("addStatusEntity")
    @SystemLog(module = "生产详情状态管理", methods = "生产详情状态管理-新增生产详情状态")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addStatusEntity(HttpServletRequest request) throws Exception {
        //插入tap_plan_detail_status表
        PlanFormMap planFormMap = getFormMap(PlanFormMap.class);

        //判断tap_plan是否完成
        int planId = Integer.valueOf(planFormMap.get("planId").toString());
        int model = Integer.valueOf(planFormMap.get("model").toString());
        int modelReject = Integer.valueOf(planFormMap.get("modelReject").toString());
        int box = Integer.valueOf(planFormMap.get("box").toString());
        int boxReject = Integer.valueOf(planFormMap.get("boxReject").toString());
        int bell = Integer.valueOf(planFormMap.get("bell").toString());
        int bellReject = Integer.valueOf(planFormMap.get("bellReject").toString());
        int openBox = Integer.valueOf(planFormMap.get("openBox").toString());
        int openBoxReject = Integer.valueOf(planFormMap.get("openBoxReject").toString());
        int polish = Integer.valueOf(planFormMap.get("polish").toString());
        int polishReject = Integer.valueOf(planFormMap.get("polishReject").toString());
        int hot = Integer.valueOf(planFormMap.get("hot").toString());
        int hotReject = Integer.valueOf(planFormMap.get("hotReject").toString());
        int sand = Integer.valueOf(planFormMap.get("sand").toString());
        int sandReject = Integer.valueOf(planFormMap.get("sandReject").toString());
        int inspection = Integer.valueOf(planFormMap.get("inspection").toString());
        int back = Integer.valueOf(planFormMap.get("back").toString());
        int inStock = Integer.valueOf(planFormMap.get("inStock").toString());

        int reject = modelReject + boxReject + bellReject + openBoxReject + polishReject + hotReject + sandReject;//总报废数量

        Produce produce = produceMapper.findProduceById(planId);
        String planNo = produce.get("planNo").toString();
        int oldOwe = Integer.valueOf(produce.get("owe").toString());

        int owe = oldOwe - inStock;//欠货 = 原欠货 - 入库

        String isFinish = "0";
        if(owe <= 0){//欠货小于等于0就是完成状态了
            isFinish = "1";
        }

        planFormMap.put("planNo",planNo);
        produceMapper.addEntity(planFormMap);
        produceMapper.updateProduce(planId,model,box,bell,openBox,polish,hot,sand,inspection,back,inStock,reject,owe,isFinish);
        return "success";
    }

    //生产详情状态 管理、编辑、删除
    @RequestMapping("status/list")
    public String lisStatusUI(Model model,HttpServletRequest request) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/produce/status/list";
    }

    @ResponseBody
    @RequestMapping("status/findByPage")
    public PageView findOrderDetailStatusByPage(String pageNow,
                                                String pageSize,String column, String sort) throws Exception {
        PlanFormMap planFormMap = getFormMap(PlanFormMap.class);
        planFormMap = toFormMap(planFormMap, pageNow, pageSize, planFormMap.getStr("orderby"));
        planFormMap.put("column", column);
        planFormMap.put("sort", sort);
        pageView.setRecords(produceMapper.findAllStatus(planFormMap));
        return pageView;
    }

    @RequestMapping("status/editUI")
    public String editProduceDetailStatusUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("planFormMap", produceMapper.findStatus(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/status/edit";
    }

    @ResponseBody
    @RequestMapping("status/editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="生产计划详情状态管理",methods="生产计划详情状态管理-修改生产计划详情状态")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editProduceDetailStatusEntity(HttpServletRequest request) throws Exception {
        PlanFormMap planFormMap = getFormMap(PlanFormMap.class);
        int id = Integer.valueOf(planFormMap.get("id").toString());
        int model = Integer.valueOf(planFormMap.get("model").toString());
        int modelReject = Integer.valueOf(planFormMap.get("modelReject").toString());
        int box = Integer.valueOf(planFormMap.get("box").toString());
        int boxReject = Integer.valueOf(planFormMap.get("boxReject").toString());
        int bell = Integer.valueOf(planFormMap.get("bell").toString());
        int bellReject = Integer.valueOf(planFormMap.get("bellReject").toString());
        int openBox = Integer.valueOf(planFormMap.get("openBox").toString());
        int openBoxReject = Integer.valueOf(planFormMap.get("openBoxReject").toString());
        int polish = Integer.valueOf(planFormMap.get("polish").toString());
        int polishReject = Integer.valueOf(planFormMap.get("polishReject").toString());
        int hot = Integer.valueOf(planFormMap.get("hot").toString());
        int hotReject = Integer.valueOf(planFormMap.get("hotReject").toString());
        int sand = Integer.valueOf(planFormMap.get("sand").toString());
        int sandReject = Integer.valueOf(planFormMap.get("sandReject").toString());
        int inspection = Integer.valueOf(planFormMap.get("inspection").toString());
        int back = Integer.valueOf(planFormMap.get("back").toString());
        int inStock = Integer.valueOf(planFormMap.get("inStock").toString());

        PlanFormMap oldPlanFormMap = produceMapper.findPlanFormMap(id);//根据id找出tap_plan找出tap_plan_detail_status
        int oldPlanFormMapPlanId = Integer.valueOf(oldPlanFormMap.get("planId").toString());
        int oldPlanFormMapModel = Integer.valueOf(oldPlanFormMap.get("model").toString());
        int oldPlanFormMapModelReject = Integer.valueOf(oldPlanFormMap.get("modelReject").toString());
        int oldPlanFormMapBox = Integer.valueOf(oldPlanFormMap.get("box").toString());
        int oldPlanFormMapBoxReject = Integer.valueOf(oldPlanFormMap.get("boxReject").toString());
        int oldPlanFormMapBell = Integer.valueOf(oldPlanFormMap.get("bell").toString());
        int oldPlanFormMapBellReject = Integer.valueOf(oldPlanFormMap.get("bellReject").toString());
        int oldPlanFormMapOpenBox = Integer.valueOf(oldPlanFormMap.get("openBox").toString());
        int oldPlanFormMapOpenBoxReject = Integer.valueOf(oldPlanFormMap.get("openBoxReject").toString());
        int oldPlanFormMapPolish = Integer.valueOf(oldPlanFormMap.get("polish").toString());
        int oldPlanFormMapPolishReject = Integer.valueOf(oldPlanFormMap.get("polishReject").toString());
        int oldPlanFormMapHot = Integer.valueOf(oldPlanFormMap.get("hot").toString());
        int oldPlanFormMapHotReject = Integer.valueOf(oldPlanFormMap.get("hotReject").toString());
        int oldPlanFormMapSand = Integer.valueOf(oldPlanFormMap.get("sand").toString());
        int oldPlanFormMapSandReject = Integer.valueOf(oldPlanFormMap.get("sandReject").toString());
        int oldPlanFormMapInspection = Integer.valueOf(oldPlanFormMap.get("inspection").toString());
        int oldPlanFormMapBack = Integer.valueOf(oldPlanFormMap.get("back").toString());
        int oldPlanFormMapInStock = Integer.valueOf(oldPlanFormMap.get("inStock").toString());

        //1.改变生产计划详情状态
        produceMapper.editEntity(planFormMap);

        //2.改变生产计划
        Produce produce = produceMapper.findProduceById(oldPlanFormMapPlanId);//根据planId找出tap_plan
        int produceModel = Integer.valueOf(produce.get("model").toString());
        int produceBox = Integer.valueOf(produce.get("box").toString());
        int produceBell = Integer.valueOf(produce.get("bell").toString());
        int produceOpenBox = Integer.valueOf(produce.get("openBox").toString());
        int producePolish = Integer.valueOf(produce.get("polish").toString());
        int produceHot = Integer.valueOf(produce.get("hot").toString());
        int produceSand = Integer.valueOf(produce.get("sand").toString());
        int produceInspection = Integer.valueOf(produce.get("inspection").toString());
        int produceBack = Integer.valueOf(produce.get("back").toString());
        int produceInStock = Integer.valueOf(produce.get("inStock").toString());
        int produceReject = Integer.valueOf(produce.get("reject").toString());
        int produceOwe = Integer.valueOf(produce.get("owe").toString());

        int newReject = produceReject - (oldPlanFormMapModelReject+oldPlanFormMapBoxReject+oldPlanFormMapBellReject+
                oldPlanFormMapOpenBoxReject+oldPlanFormMapPolishReject+oldPlanFormMapHotReject+oldPlanFormMapSandReject)
                + (modelReject+boxReject+bellReject+openBoxReject+polishReject+hotReject+sandReject);

        int newOwe = produceOwe + oldPlanFormMapInStock - inStock;

        String isFinish = "0";
        if(newOwe <= 0){//欠货小于等于0就是完成状态了
            isFinish = "1";
        }

        produceMapper.updateProduce(oldPlanFormMapPlanId,produceModel-oldPlanFormMapModel+model,produceBox-oldPlanFormMapBox+box,
                produceBell-oldPlanFormMapBell+bell,produceOpenBox-oldPlanFormMapOpenBox+openBox,
                producePolish-oldPlanFormMapPolish+polish,produceHot-oldPlanFormMapHot+hot,produceSand-oldPlanFormMapSand+sand,
                produceInspection-oldPlanFormMapInspection+inspection,produceBack-oldPlanFormMapBack+back,
                produceInStock-oldPlanFormMapInStock+inStock,newReject,newOwe,isFinish);

        return "success";
    }
}
