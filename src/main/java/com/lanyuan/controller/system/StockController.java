package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.CustomerFormMap;
import com.lanyuan.entity.Stock;
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
@RequestMapping("/stock/")
public class StockController extends BaseController {

    @Inject
    private StockMapper stockMapper;
    @Inject
    private ProductMapper productMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        model.addAttribute("HT",stockMapper.getAllWeight("HT").get("allWeight").toString());//灰铁
        model.addAttribute("QT",stockMapper.getAllWeight("QT").get("allWeight").toString());//球铁
        model.addAttribute("WCB",stockMapper.getAllWeight("WCB").get("allWeight").toString());//铸钢
        return Common.BACKGROUND_PATH + "/system/stock/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        Stock stock = getFormMap(Stock.class);
        stock = toFormMap(stock, pageNow, pageSize, stock.getStr("orderby"));
        stock.put("column", column);
        stock.put("sort", sort);
        pageView.setRecords(stockMapper.findStockPage(stock));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        model.addAttribute("product", JSONArray.fromObject(productMapper.findProduct()));
        return Common.BACKGROUND_PATH + "/system/stock/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "库存管理", methods = "库存管理-新增库存")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity(HttpServletRequest request) throws Exception {
        String productId = request.getParameter("productId").toString();
        String stock = request.getParameter("stock").toString();

        Stock stock1 = stockMapper.findStockbyProductId(Integer.valueOf(productId));
        if(stock1 != null){
            return "false";
        }else{
            stockMapper.addStockEntity(Integer.valueOf(productId),stock);
            return "success";
        }
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("product",productMapper.findProduct());
            model.addAttribute("stock", stockMapper.findStockbyId(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/stock/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="库存管理",methods="库存管理-修改库存")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        String stock = request.getParameter("stock").toString();
        stockMapper.updateStockEntity(Integer.valueOf(id),stock);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="库存管理",methods="库存管理-删除库存")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++) {
                stockMapper.deleteStockEntity(Integer.valueOf(idArr[i]));
            }
        }
        return "success";
    }
}
