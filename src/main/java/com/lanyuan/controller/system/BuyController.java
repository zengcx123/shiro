package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.Buy;
import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.Detail;
import com.lanyuan.entity.RawFormMap;
import com.lanyuan.mapper.BuyMapper;
import com.lanyuan.mapper.RawMapper;
import com.lanyuan.mapper.SupplierMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
import com.lanyuan.util.TapUtil;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by zeng on 2017/4/14.
 */
@Controller
@RequestMapping("/buy/")
public class BuyController extends BaseController {
    @Inject
    private BuyMapper buyMapper;
    @Inject
    private SupplierMapper supplierMapper;
    @Inject
    private RawMapper rawMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        model.addAttribute("supplier", supplierMapper.findSupplier(0));
        return Common.BACKGROUND_PATH + "/system/buy/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        Buy buy = getFormMap(Buy.class);
        buy = toFormMap(buy, pageNow, pageSize, buy.getStr("orderby"));
        buy.put("column", column);
        buy.put("sort", sort);
        pageView.setRecords(buyMapper.findBuyPage(buy));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        model.addAttribute("supplier", supplierMapper.findSupplier(0));
        return Common.BACKGROUND_PATH + "/system/buy/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "采购管理", methods = "采购管理-新增采购")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity() throws Exception {
        Buy buy = getFormMap(Buy.class);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        buy.put("buyNo", TapUtil.getNumber("B"));
        buy.put("supplierId",Integer.valueOf(buy.get("supplierId").toString()));
        buy.put("createDate",simpleDateFormat.parse(simpleDateFormat.format(new Date())));
        buy.put("needDate",buy.get("needDate") == null ? null : simpleDateFormat.parse(buy.get("needDate").toString()));
        buy.put("deliveryDate",buy.get("deliveryDate") == null ? null : simpleDateFormat.parse(buy.get("deliveryDate").toString()));
        buy.put("inspectionDate",buy.get("inspectionDate") == null ? null : simpleDateFormat.parse(buy.get("inspectionDate").toString()));
        buy.put("inStockDate",buy.get("inStockDate") == null ? null : simpleDateFormat.parse(buy.get("inStockDate").toString()));
        buyMapper.addBuyEntity(buy);
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("supplier", supplierMapper.findSupplier(0));
            model.addAttribute("buy", buyMapper.findBuyById(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/buy/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="采购管理",methods="采购管理-修改采购")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity() throws Exception {
        Buy buy = getFormMap(Buy.class);

        //如果完成了，改变原材料库存
        String isFinish = buy.get("isFinish").toString();
        if(isFinish.equals("1")){
            String material = buy.get("material").toString();
            String identification = buy.get("identification").toString();
            String count = buy.get("count").toString();
            String unit = buy.get("unit").toString();

            RawFormMap rawFormMap = rawMapper.findRawByCondition(material,identification);
            if(null != rawFormMap){//已经存在就更新
                int oldCount = Integer.valueOf(rawFormMap.get("count").toString());
                String newCount = String.valueOf(oldCount + Integer.valueOf(count));
                rawMapper.updateRawEntityByCondition(material,identification,newCount);
            }else{//不存在就插入
                rawMapper.addRawEntity(material,count,unit,identification);
            }
        }

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        buy.put("id",Integer.valueOf(buy.get("id").toString()));
        buy.put("needDate",buy.get("needDate") == null ? null : simpleDateFormat.parse(buy.get("needDate").toString()));
        buy.put("deliveryDate",buy.get("deliveryDate") == null ? null : simpleDateFormat.parse(buy.get("deliveryDate").toString()));
        buy.put("inspectionDate",buy.get("inspectionDate") == null ? null : simpleDateFormat.parse(buy.get("inspectionDate").toString()));
        buy.put("inStockDate",buy.get("inStockDate") == null ? null : simpleDateFormat.parse(buy.get("inStockDate").toString()));
        buyMapper.editBuyEntity(buy);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="采购管理",methods="采购管理-删除采购")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++) {
                String idStr = idArr[i];
                int newId = Integer.valueOf(idStr);
                buyMapper.deleteById(newId);
            }
        }
        return "success";
    }
}
