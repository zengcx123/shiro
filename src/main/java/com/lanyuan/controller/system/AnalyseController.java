package com.lanyuan.controller.system;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.Analyse;
import com.lanyuan.mapper.AnalyseMapper;
import com.lanyuan.mapper.CustomerMapper;
import com.lanyuan.mapper.StockMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;
import com.lanyuan.util.JsonUtils;
import com.lanyuan.util.TapUtil;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by zeng on 2017/3/21.
 */
@Controller
@RequestMapping("/analyse/")
public class AnalyseController extends BaseController {

    @Inject
    private AnalyseMapper analyseMapper;

    @Inject
    private CustomerMapper customerMapper;

    @Inject
    private StockMapper stockMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        model.addAttribute("customer", customerMapper.findCustomer(0));
        return Common.BACKGROUND_PATH + "/system/analyse/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findAnalyseByPage(String pageNow, String pageSize, String column, String sort) throws Exception {
        //最终返回的list数据
        List<Map<String, Object>> finalAnalyseList = new ArrayList<Map<String, Object>>();

        Analyse analyse = getFormMap(Analyse.class);
        analyse = toFormMap(analyse, pageNow, pageSize, analyse.getStr("orderby"));

        String cus = analyse.get("customerId") == null ? "" : customerMapper.findCustomer(Integer.valueOf(analyse.get("customerId").toString())).get(0).get("number").toString().substring(0,3);

        //如果不选择时间，不查询数据
        if (analyse.get("createDate1") != null && analyse.get("createDate2") != null) {
            String analyseOrderNumber = analyse.get("orderNumber") == null ? "" : analyse.get("orderNumber").toString();
            String analyseProductPicNo = analyse.get("productPicNo") == null ? "" : analyse.get("productPicNo").toString();
            String analyseCreateDate1 = analyse.get("createDate1").toString();
            String analyseCreateDate2 = analyse.get("createDate2").toString();

            //得到所有的订单号和图号
            List<Map<String, Object>> orderAndProdectMapList = analyseMapper.findAnalyseGroupBy(cus,analyseOrderNumber, analyseProductPicNo, analyseCreateDate1, analyseCreateDate2,0,column,sort);

            //根据订单号和产品循环遍历
            for (int i = 0; i < orderAndProdectMapList.size(); i++) {
                Map<String, Object> orderAndProdectMap = orderAndProdectMapList.get(i);
                String orderAndProdectOrderNumber = orderAndProdectMap.get("orderNumber").toString();
                String orderAndProdectProductPicNo = orderAndProdectMap.get("productPicNo").toString();

                //根据条件得到数据
                List<Map<String, Object>> newAnalyseMapList = analyseMapper.findAnalyse(orderAndProdectOrderNumber, orderAndProdectProductPicNo, analyseCreateDate1, analyseCreateDate2);

                int newAnalyseId = (Integer) (newAnalyseMapList.get(0).get("id"));//主键
                String newAnalyseOrderNumber = newAnalyseMapList.get(0).get("orderNumber").toString();//订单号
                String newAnalyseProductName = newAnalyseMapList.get(0).get("productName").toString();//产品名称
                String newAnalyseProductPicNo = newAnalyseMapList.get(0).get("productPicNo").toString();//产品图号
                String newAnalyseProductMaterial = newAnalyseMapList.get(0).get("productMaterial").toString();//材质
                String newAnalyseProductWeight = newAnalyseMapList.get(0).get("productWeight").toString();//单重
                String newAnalyseProductUnit = newAnalyseMapList.get(0).get("productUnit").toString();//单位
                String newAnalyseTotal = newAnalyseMapList.get(0).get("total").toString();//需求总数
                String newAnalyseDeliveryDate = newAnalyseMapList.get(0).get("deliveryDate").toString();//交货期
                String newAnalyseRelDeliveryDate = newAnalyseMapList.get(0).get("relDeliveryDate").toString();//实际交货期
                String newAnalyseIsBack = newAnalyseMapList.get(0).get("isBack").toString();//是否补退
                int newAnalyseProductId = (Integer) (newAnalyseMapList.get(0).get("productId"));//产品主键
                String newAnalyseIsFinish = newAnalyseMapList.get(0).get("isFinish").toString();//是否完成

                int inspectionCount = 0;//送检总数
                int accBackCount = 0;//验退总数
                int inStockCount = 0;//入库总数
                int outStockCount = 0;//出库总数
                int backCount = 0;//退货总数

                //计算
                for (int j = 0; j < newAnalyseMapList.size(); j++) {
                    int newAnalyseInspection = Integer.valueOf(newAnalyseMapList.get(j).get("inspection").toString());//送检数量
                    inspectionCount += newAnalyseInspection;
                    int newAnalyseAccBack = Integer.valueOf(newAnalyseMapList.get(j).get("accBack").toString());//验退数量
                    accBackCount += newAnalyseAccBack;
                    int newAnalyseInStock = Integer.valueOf(newAnalyseMapList.get(j).get("inStock").toString());//入库数量
                    inStockCount += newAnalyseInStock;
                    int newAnalyseOutStock = Integer.valueOf(newAnalyseMapList.get(j).get("outStock").toString());//出库数量
                    outStockCount += newAnalyseOutStock;
                    int newAnalyseBack = Integer.valueOf(newAnalyseMapList.get(j).get("back").toString());//退货数量
                    backCount += newAnalyseBack;
                }

                //库存总数
//                Integer stockCount = inStockCount - outStockCount;//库存总数 = 入库总数 - 出库总数
               Integer stockCount = stockMapper.findStockbyProductId(newAnalyseProductId).get("stock") == null ? 0 : Integer.valueOf(stockMapper.findStockbyProductId(newAnalyseProductId).get("stock").toString());

                //判断是否补退，0补退【公式：欠货总数 = 订单总数 - 送货总数 - 退货总数】1不补退【公式：欠货总数 = 订单总数 - 送货总数】
                Integer oweCount = 0;
                //是否完成状态
                String isFinish = "";//0已完成 1未完成
                if(newAnalyseIsBack.equals("0")){
                    oweCount = Integer.valueOf(newAnalyseTotal) - outStockCount - backCount;//欠货总数 = 订单总数 - 送货总数 - 退货总数
                }else if(newAnalyseIsBack.equals("1")){
                    oweCount = Integer.valueOf(newAnalyseTotal) - outStockCount;//欠货总数 = 订单总数 - 送货总数
                }

                Map<String, Object> finalAnalyseMap = new HashedMap();
                finalAnalyseMap.put("id", newAnalyseId);
                finalAnalyseMap.put("orderNumber", newAnalyseOrderNumber);
                finalAnalyseMap.put("productName", newAnalyseProductName);
                finalAnalyseMap.put("productPicNo", newAnalyseProductPicNo);
                finalAnalyseMap.put("productMaterial", newAnalyseProductMaterial);
                finalAnalyseMap.put("productWeight", newAnalyseProductWeight + newAnalyseProductUnit);
                finalAnalyseMap.put("total", newAnalyseTotal);
                finalAnalyseMap.put("inspectionCount", inspectionCount);
                finalAnalyseMap.put("accBackCount", accBackCount);
                finalAnalyseMap.put("inStockCount", inStockCount);
                finalAnalyseMap.put("outStockCount", outStockCount);
                finalAnalyseMap.put("stockCount", stockCount);
                finalAnalyseMap.put("oweCount", oweCount);
                finalAnalyseMap.put("backCount", backCount);
                finalAnalyseMap.put("deliveryDate", newAnalyseDeliveryDate);
                finalAnalyseMap.put("relDeliveryDate", newAnalyseRelDeliveryDate);
                finalAnalyseMap.put("isBack", newAnalyseIsBack);
                finalAnalyseMap.put("isFinish", newAnalyseIsFinish);
                finalAnalyseList.add(finalAnalyseMap);
            }
        }

        if(pageNow != null && pageSize != null){
            pageView.setRecords(TapUtil.getListPage(Integer.valueOf(pageNow),Integer.valueOf(pageSize),finalAnalyseList));
        }else{
            pageView.setRecords(finalAnalyseList);
        }
        pageView.setRowCount(finalAnalyseList.size());
        return pageView;
    }

    @RequestMapping("/export")
    public void download(String pageNow, String pageSize, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fileName = "";
        List<Map<String, Object>> finalAnalyseList1 = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> finalAnalyseList2 = new ArrayList<Map<String, Object>>();

        String orderNumber = request.getParameter("orderNumber") == null ? "" : request.getParameter("orderNumber").toString();
        String productPicNo = request.getParameter("productPicNo") == null ? "" : request.getParameter("productPicNo").toString();
        String createDate1 = request.getParameter("createDate1").toString();
        String createDate2 = request.getParameter("createDate2").toString();
        String cus = request.getParameter("customerId") == null ? "" : customerMapper.findCustomer(Integer.valueOf(request.getParameter("customerId").toString())).get(0).get("number").toString().substring(0,3);
        String company = request.getParameter("customerId") == null ? "" : customerMapper.findCustomer(Integer.valueOf(request.getParameter("customerId").toString())).get(0).get("company").toString();

        fileName = createDate1 + "至" + createDate2 + "_" + company + "汇总";

        List<Map<String, Object>> orderAndProdectMapList1 = analyseMapper.findAnalyseGroupBy(cus,orderNumber, productPicNo, createDate1, createDate2,1,"","");
        List<Map<String, Object>> orderAndProdectMapList2 = analyseMapper.findAnalyseGroupBy(cus,orderNumber, productPicNo, createDate1, createDate2,2,"","");

        if(orderAndProdectMapList1 != null && orderAndProdectMapList1.size() > 0){
            for (int i = 0; i < orderAndProdectMapList1.size(); i++) {
                Map<String, Object> orderAndProdectMap = orderAndProdectMapList1.get(i);
                String orderAndProdectOrderNumber = orderAndProdectMap.get("orderNumber").toString();
                String orderAndProdectProductPicNo = orderAndProdectMap.get("productPicNo").toString();

                List<Map<String, Object>> newAnalyseMapList = analyseMapper.findAnalyse(orderAndProdectOrderNumber, orderAndProdectProductPicNo, createDate1, createDate2);

                int newAnalyseId = (Integer) (newAnalyseMapList.get(0).get("id"));//主键
                String newAnalyseOrderNumber = newAnalyseMapList.get(0).get("orderNumber").toString();//订单号
                String newAnalyseProductName = newAnalyseMapList.get(0).get("productName").toString();//产品名称
                String newAnalyseProductPicNo = newAnalyseMapList.get(0).get("productPicNo").toString();//产品图号
                String newAnalyseProductMaterial = newAnalyseMapList.get(0).get("productMaterial").toString();//材质
                String newAnalyseProductWeight = newAnalyseMapList.get(0).get("productWeight").toString();//单重
                String newAnalyseProductUnit = newAnalyseMapList.get(0).get("productUnit").toString();//单位
                String newAnalyseTotal = newAnalyseMapList.get(0).get("total").toString();//总数
                String newAnalyseDeliveryDate = newAnalyseMapList.get(0).get("deliveryDate").toString();//交货期（导出数据时，值展示交货期，不展示实际交货期）
                String newAnalyseIsBack = newAnalyseMapList.get(0).get("isBack").toString();//是否补退
                int newAnalyseProductId = (Integer) (newAnalyseMapList.get(0).get("productId"));//产品主键
                String newAnalyseIsFinish = newAnalyseMapList.get(0).get("isFinish").toString();//是否完成

                int inspectionCount = 0;//送检总数
                int accBackCount = 0;//验退总数
                int inStockCount = 0;//入库总数
                int outStockCount = 0;//出库总数
                int backCount = 0;//退货总数

                for (int j = 0; j < newAnalyseMapList.size(); j++) {
                    int newAnalyseInspection = Integer.valueOf(newAnalyseMapList.get(j).get("inspection").toString());//送检数量
                    inspectionCount += newAnalyseInspection;
                    int newAnalyseAccBack = Integer.valueOf(newAnalyseMapList.get(j).get("accBack").toString());//验退数量
                    accBackCount += newAnalyseAccBack;
                    int newAnalyseInStock = Integer.valueOf(newAnalyseMapList.get(j).get("inStock").toString());//入库数量
                    inStockCount += newAnalyseInStock;
                    int newAnalyseOutStock = Integer.valueOf(newAnalyseMapList.get(j).get("outStock").toString());//出库数量
                    outStockCount += newAnalyseOutStock;
                    int newAnalyseBack = Integer.valueOf(newAnalyseMapList.get(j).get("back").toString());//退货数量
                    backCount += newAnalyseBack;
                }

                //库存总数
//                Integer stockCount = inStockCount - outStockCount;//库存总数 = 入库总数 - 出库总数
                Integer stockCount = stockMapper.findStockbyProductId(newAnalyseProductId).get("stock") == null ? 0 : Integer.valueOf(stockMapper.findStockbyProductId(newAnalyseProductId).get("stock").toString());

                //判断是否补退，0补退【公式：欠货总数 = 订单总数 - 送货总数 - 退货总数】1不补退【公式：欠货总数 = 订单总数 - 送货总数】
                Integer oweCount = 0;
                //是否完成状态
                String isFinish = "";//0已完成 1未完成
                if(newAnalyseIsBack.equals("0")){
                    oweCount = Integer.valueOf(newAnalyseTotal) - outStockCount - backCount;//欠货总数 = 订单总数 - 送货总数 - 退货总数
                }else if(newAnalyseIsBack.equals("1")){
                    oweCount = Integer.valueOf(newAnalyseTotal) - outStockCount;//欠货总数 = 订单总数 - 送货总数
                }

                Map<String, Object> finalAnalyseMap = new HashedMap();
                finalAnalyseMap.put("sequence", i+1);
                finalAnalyseMap.put("id", newAnalyseId);
                finalAnalyseMap.put("productName", newAnalyseProductName);
                finalAnalyseMap.put("orderNumber", newAnalyseOrderNumber);
                finalAnalyseMap.put("productPicNo", newAnalyseProductPicNo);
                finalAnalyseMap.put("productMaterial", newAnalyseProductMaterial);
                finalAnalyseMap.put("productWeight", newAnalyseProductWeight + newAnalyseProductUnit);
                finalAnalyseMap.put("total", newAnalyseTotal);
                finalAnalyseMap.put("inspectionCount", inspectionCount);
                finalAnalyseMap.put("accBackCount", accBackCount);
                finalAnalyseMap.put("inStockCount", inStockCount);
                finalAnalyseMap.put("outStockCount", outStockCount);
                finalAnalyseMap.put("stockCount", stockCount);
                finalAnalyseMap.put("oweCount", oweCount);
                finalAnalyseMap.put("backCount", backCount);
                finalAnalyseMap.put("oweWeight", ((oweCount) * (Integer.valueOf(newAnalyseProductWeight))) + newAnalyseProductUnit);
                finalAnalyseMap.put("isBack", newAnalyseIsBack.equals("0") ? "补退" : "不补退");
                finalAnalyseMap.put("isFinish", newAnalyseIsFinish.equals("1") ? "完成" : "未完成");
                finalAnalyseMap.put("deliveryDate", newAnalyseDeliveryDate.substring(0,10));

                finalAnalyseList1.add(finalAnalyseMap);
            }
        }else{
            Map<String, Object> finalAnalyseMap = new HashedMap();
            finalAnalyseList1.add(finalAnalyseMap);
        }

        if(orderAndProdectMapList2 != null && orderAndProdectMapList2.size() > 0) {
            for (int i = 0; i < orderAndProdectMapList2.size(); i++) {
                Map<String, Object> orderAndProdectMap = orderAndProdectMapList2.get(i);
                String orderAndProdectOrderNumber = orderAndProdectMap.get("orderNumber").toString();
                String orderAndProdectProductPicNo = orderAndProdectMap.get("productPicNo").toString();

                List<Map<String, Object>> newAnalyseMapList = analyseMapper.findAnalyse(orderAndProdectOrderNumber, orderAndProdectProductPicNo, createDate1, createDate2);

                int newAnalyseId = (Integer) (newAnalyseMapList.get(0).get("id"));//主键
                String newAnalyseOrderNumber = newAnalyseMapList.get(0).get("orderNumber").toString();//订单号
                String newAnalyseProductName = newAnalyseMapList.get(0).get("productName").toString();//产品名称
                String newAnalyseProductPicNo = newAnalyseMapList.get(0).get("productPicNo").toString();//产品图号
                String newAnalyseProductMaterial = newAnalyseMapList.get(0).get("productMaterial").toString();//材质
                String newAnalyseProductWeight = newAnalyseMapList.get(0).get("productWeight").toString();//单重
                String newAnalyseProductUnit = newAnalyseMapList.get(0).get("productUnit").toString();//单位
                String newAnalyseTotal = newAnalyseMapList.get(0).get("total").toString();//总数
                String newAnalyseDeliveryDate = newAnalyseMapList.get(0).get("deliveryDate").toString();//交货期
                String newAnalyseIsBack = newAnalyseMapList.get(0).get("isBack").toString();//是否补退
                int newAnalyseProductId = (Integer) (newAnalyseMapList.get(0).get("productId"));//产品主键
                String newAnalyseIsFinish = newAnalyseMapList.get(0).get("isFinish").toString();//是否完成

                int inspectionCount = 0;//送检总数
                int accBackCount = 0;//验退总数
                int inStockCount = 0;//入库总数
                int outStockCount = 0;//出库总数
                int backCount = 0;//退货总数

                for (int j = 0; j < newAnalyseMapList.size(); j++) {
                    int newAnalyseInspection = Integer.valueOf(newAnalyseMapList.get(j).get("inspection").toString());//送检数量
                    inspectionCount += newAnalyseInspection;
                    int newAnalyseAccBack = Integer.valueOf(newAnalyseMapList.get(j).get("accBack").toString());//验退数量
                    accBackCount += newAnalyseAccBack;
                    int newAnalyseInStock = Integer.valueOf(newAnalyseMapList.get(j).get("inStock").toString());//入库数量
                    inStockCount += newAnalyseInStock;
                    int newAnalyseOutStock = Integer.valueOf(newAnalyseMapList.get(j).get("outStock").toString());//出库数量
                    outStockCount += newAnalyseOutStock;
                    int newAnalyseBack = Integer.valueOf(newAnalyseMapList.get(j).get("back").toString());//退货数量
                    backCount += newAnalyseBack;
                }

                //库存总数
//                Integer stockCount = inStockCount - outStockCount;//库存总数 = 入库总数 - 出库总数
                Integer stockCount = stockMapper.findStockbyProductId(newAnalyseProductId).get("stock") == null ? 0 : Integer.valueOf(stockMapper.findStockbyProductId(newAnalyseProductId).get("stock").toString());

                //判断是否补退，0补退【公式：欠货总数 = 订单总数 - 送货总数 - 退货总数】1不补退【公式：欠货总数 = 订单总数 - 送货总数】
                Integer oweCount = 0;
                //是否完成状态
                String isFinish = "";//0已完成 1未完成
                if (newAnalyseIsBack.equals("0")) {
                    oweCount = Integer.valueOf(newAnalyseTotal) - outStockCount - backCount;//欠货总数 = 订单总数 - 送货总数 - 退货总数
                } else if (newAnalyseIsBack.equals("1")) {
                    oweCount = Integer.valueOf(newAnalyseTotal) - outStockCount;//欠货总数 = 订单总数 - 送货总数
                }

                Map<String, Object> finalAnalyseMap = new HashedMap();
                finalAnalyseMap.put("sequence", i + 1);
                finalAnalyseMap.put("id", newAnalyseId);
                finalAnalyseMap.put("productName", newAnalyseProductName);
                finalAnalyseMap.put("orderNumber", newAnalyseOrderNumber);
                finalAnalyseMap.put("productPicNo", newAnalyseProductPicNo);
                finalAnalyseMap.put("productMaterial", newAnalyseProductMaterial);
                finalAnalyseMap.put("productWeight", newAnalyseProductWeight + newAnalyseProductUnit);
                finalAnalyseMap.put("total", newAnalyseTotal);
                finalAnalyseMap.put("inspectionCount", inspectionCount);
                finalAnalyseMap.put("accBackCount", accBackCount);
                finalAnalyseMap.put("inStockCount", inStockCount);
                finalAnalyseMap.put("outStockCount", outStockCount);
                finalAnalyseMap.put("stockCount", stockCount);
                finalAnalyseMap.put("oweCount", oweCount);
                finalAnalyseMap.put("backCount", backCount);
                finalAnalyseMap.put("oweWeight", ((oweCount) * (Integer.valueOf(newAnalyseProductWeight))) + newAnalyseProductUnit);
                finalAnalyseMap.put("isBack", newAnalyseIsBack.equals("0") ? "补退" : "不补退");
                finalAnalyseMap.put("isFinish", newAnalyseIsFinish.equals("1") ? "完成" : "未完成");
                finalAnalyseMap.put("deliveryDate", newAnalyseDeliveryDate.substring(0, 10));

                finalAnalyseList2.add(finalAnalyseMap);
            }
        }else{
            Map<String, Object> finalAnalyseMap = new HashedMap();
            finalAnalyseList2.add(finalAnalyseMap);
        }

        String exportData1 =
                "[{\"colkey\":\"sequence\",\"name\":\"序号\",\"hide\":false}, " +
                "{\"colkey\":\"orderNumber\",\"name\":\"订单号\",\"hide\":false}," +
                "{\"colkey\":\"productName\",\"name\":\"产品名称\",\"hide\":false}," +
                "{\"colkey\":\"productPicNo\",\"name\":\"图号\",\"hide\":false}," +
                "{\"colkey\":\"productMaterial\",\"name\":\"材质\",\"hide\":false}," +
                "{\"colkey\":\"productWeight\",\"name\":\"单重\",\"hide\":false}," +
                "{\"colkey\":\"total\",\"name\":\"总数\",\"hide\":false}," +
                "{\"colkey\":\"inspectionCount\",\"name\":\"送检总数\",\"hide\":false}," +
                "{\"colkey\":\"accBackCount\",\"name\":\"验退总数\",\"hide\":false}," +
                "{\"colkey\":\"inStockCount\",\"name\":\"入库总数\",\"hide\":false}," +
                "{\"colkey\":\"outStockCount\",\"name\":\"出库总数\",\"hide\":false}," +
                "{\"colkey\":\"stockCount\",\"name\":\"库存总数\",\"hide\":false}," +
                "{\"colkey\":\"oweCount\",\"name\":\"欠货总数\",\"hide\":false}," +
                "{\"colkey\":\"backCount\",\"name\":\"退货总数\",\"hide\":false}," +
                "{\"colkey\":\"oweWeight\",\"name\":\"欠货总重\",\"hide\":false}," +
                "{\"colkey\":\"isBack\",\"name\":\"是否补退\",\"hide\":false}," +
                "{\"colkey\":\"isFinish\",\"name\":\"是否完成\",\"hide\":false}," +
                "{\"colkey\":\"deliveryDate\",\"name\":\"交货期\",\"hide\":false}]";

        String exportData2 =
                "[{\"colkey\":\"sequence\",\"name\":\"序号\",\"hide\":false}, " +
                        "{\"colkey\":\"productName\",\"name\":\"产品名称\",\"hide\":false}," +
                        "{\"colkey\":\"orderNumber\",\"name\":\"订单号\",\"hide\":false}," +
                        "{\"colkey\":\"productPicNo\",\"name\":\"图号\",\"hide\":false}," +
                        "{\"colkey\":\"productMaterial\",\"name\":\"材质\",\"hide\":false}," +
                        "{\"colkey\":\"productWeight\",\"name\":\"单重\",\"hide\":false}," +
                        "{\"colkey\":\"total\",\"name\":\"总数\",\"hide\":false}," +
                        "{\"colkey\":\"inspectionCount\",\"name\":\"送检总数\",\"hide\":false}," +
                        "{\"colkey\":\"accBackCount\",\"name\":\"验退总数\",\"hide\":false}," +
                        "{\"colkey\":\"inStockCount\",\"name\":\"入库总数\",\"hide\":false}," +
                        "{\"colkey\":\"outStockCount\",\"name\":\"出库总数\",\"hide\":false}," +
                        "{\"colkey\":\"stockCount\",\"name\":\"库存总数\",\"hide\":false}," +
                        "{\"colkey\":\"oweCount\",\"name\":\"欠货总数\",\"hide\":false}," +
                        "{\"colkey\":\"backCount\",\"name\":\"退货总数\",\"hide\":false}," +
                        "{\"colkey\":\"oweWeight\",\"name\":\"欠货总重\",\"hide\":false}," +
                        "{\"colkey\":\"isBack\",\"name\":\"是否补退\",\"hide\":false}," +
                        "{\"colkey\":\"isFinish\",\"name\":\"是否完成\",\"hide\":false}," +
                        "{\"colkey\":\"deliveryDate\",\"name\":\"交货期\",\"hide\":false}]";

        List<Map<String, Object>> listMap1 = JsonUtils.parseJSONList(exportData1);
        List<Map<String, Object>> listMap2 = JsonUtils.parseJSONList(exportData2);

        TapUtil.exportToExcel(response, listMap1, listMap2, finalAnalyseList1, finalAnalyseList2, fileName, company, createDate1, createDate2);
    }
}
