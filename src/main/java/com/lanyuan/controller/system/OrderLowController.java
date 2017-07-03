package com.lanyuan.controller.system;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.*;
import com.lanyuan.mapper.CustomerMapper;
import com.lanyuan.mapper.OrderMapper;
import com.lanyuan.mapper.ProductMapper;
import com.lanyuan.mapper.StockMapper;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
@Controller
@RequestMapping("/orderlow/")
public class OrderLowController extends BaseController {

    @Inject
    private OrderMapper orderMapper;

    @Inject
    private CustomerMapper customerMapper;

    @Inject
    private ProductMapper productMapper;

    @Inject
    private StockMapper stockMapper;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        model.addAttribute("customer", customerMapper.findCustomer(0));
        return Common.BACKGROUND_PATH + "/system/orderlow/list";
    }

    @ResponseBody
    @RequestMapping("findByPage")
    public PageView findByPage(String pageNow,
                               String pageSize, String column, String sort) throws Exception {
        OrderFormMap orderFormMap = getFormMap(OrderFormMap.class);
        orderFormMap = toFormMap(orderFormMap, pageNow, pageSize, orderFormMap.getStr("orderby"));
        orderFormMap.put("column", column);
        orderFormMap.put("sort", sort);
        pageView.setRecords(orderMapper.findOrderPage(orderFormMap));
        return pageView;
    }

    @RequestMapping("addUI")
    public String addUI(Model model) throws Exception {
        model.addAttribute("customer", customerMapper.findCustomer(0));
        model.addAttribute("nature", orderMapper.findOrderNature());
        return Common.BACKGROUND_PATH + "/system/orderlow/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @SystemLog(module = "订单管理", methods = "订单管理-新增订单")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addEntity() throws Exception {
        OrderFormMap orderFormMap = getFormMap(OrderFormMap.class);
        //手动输入订单号，添加内部订单编号用于归类
        String orderNumberIN = customerMapper.findCustomer(Integer.valueOf(orderFormMap.get("customerId").toString())).get(0).get("number").toString().substring(0,3) + TapUtil.getOrderNumber();
        orderFormMap.put("orderNumberIN",orderNumberIN);
        //创建订单日期
        orderFormMap.put("createTime",new Date());
        //下单人员
        orderFormMap.put("single",TapUtil.getUserName());
        //判断是否回签
        if(orderFormMap.get("signStatus").toString().equals("1")){
            //不回签，回签日期直接置为空
            orderFormMap.put("signDate",null);
        }
        orderMapper.addOrderEntity(orderFormMap);
        return "success";
    }

    @RequestMapping("editUI")
    public String editUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("customer", customerMapper.findCustomer(0));
            model.addAttribute("nature", orderMapper.findOrderNature());
            model.addAttribute("order", orderMapper.findbyFrist("id", id, OrderFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/orderlow/edit";
    }

    @ResponseBody
    @RequestMapping("editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单管理",methods="订单管理-修改客户")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editEntity() throws Exception {
        OrderFormMap orderFormMap = getFormMap(OrderFormMap.class);
        //判断是否回签
        if(orderFormMap.get("signStatus").toString().equals("1")){
            //不回签，回签日期直接置为空
            orderFormMap.put("signDate",null);
        }
        orderMapper.editOrderEntity(orderFormMap);
        return "success";
    }

    @ResponseBody
    @RequestMapping("deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单管理",methods="订单管理-删除订单")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
//            //删除订单
//            orderMapper.deleteByAttribute("id", id, OrderFormMap.class);
//            //删除订单详情
//            List<Detail> detailList = orderMapper.findOrderDetailByOrderId(Integer.valueOf(id));
//            orderMapper.deleteOrderDetailByOrderId(Integer.valueOf(id));
//            //删除订单详情状态
//            if(detailList != null && detailList.size() > 0){
//                for(int i=0;i<detailList.size();i++){
//                    int orderDetailId = Integer.valueOf(detailList.get(i).get("id").toString());
//                    orderMapper.deleteOrderDetailStatusByOrderDetailId(orderDetailId);
//                }
//            }
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++) {
                String idStr = idArr[i];
                int newId = Integer.valueOf(idStr);
                List<Detail> detailList = orderMapper.findOrderDetailByOrderId(newId);
                if (detailList != null && detailList.size() > 0) {
                    return "1";
                }
                orderMapper.deleteOrderById(newId);
            }
        }
        return "success";
    }

    @RequestMapping("nature/list")
    public String lisOrderNatureUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/orderlow/nature/list";
    }

    @ResponseBody
    @RequestMapping("nature/findByPage")
    public PageView findOrderNatureByPage(String pageNow,
                                          String pageSize, String column, String sort) throws Exception {
        OrderNatureFormMap orderNatureFormMap = getFormMap(OrderNatureFormMap.class);
        orderNatureFormMap = toFormMap(orderNatureFormMap, pageNow, pageSize, orderNatureFormMap.getStr("orderby"));
        orderNatureFormMap.put("column", column);
        orderNatureFormMap.put("sort", sort);
        pageView.setRecords(orderMapper.findOrderNaturePage(orderNatureFormMap));
        return pageView;
    }

    @RequestMapping("nature/addUI")
    public String addOrderNatureUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/orderlow/nature/add";
    }

    @ResponseBody
    @RequestMapping("nature/addEntity")
    @SystemLog(module = "订单性质管理", methods = "订单性质管理-新增订单性质")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addOrderNatureEntity() throws Exception {
        OrderNatureFormMap orderNatureFormMap = getFormMap(OrderNatureFormMap.class);
        orderMapper.addOrderNatureEntity(orderNatureFormMap.get("nature").toString());
        return "success";
    }

    @RequestMapping("nature/editUI")
    public String editOrderNatureUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("nature", orderMapper.findbyFrist("id", id, OrderNatureFormMap.class));
        }
        return Common.BACKGROUND_PATH + "/system/orderlow/nature/edit";
    }

    @ResponseBody
    @RequestMapping("nature/editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单性质管理",methods="订单性质管理-修改订单性质")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editOrderNatureEntity() throws Exception {
        OrderNatureFormMap orderNatureFormMap = getFormMap(OrderNatureFormMap.class);
        orderMapper.editEntity(orderNatureFormMap);
        return "success";
    }

    @ResponseBody
    @RequestMapping("nature/deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单性质",methods="订单性质管理-删除订单性质")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteOrderNatureEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            orderMapper.deleteByAttribute("id", id, OrderNatureFormMap.class);
        }
        return "success";
    }

    @RequestMapping("detail/list")
    public String lisOrderDetailUI(Model model,HttpServletRequest request) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/orderlow/detail/list";
    }

    @ResponseBody
    @RequestMapping("detail/findByPage")
    public PageView findOrderDetailByPage(String pageNow,
                                          String pageSize,String column, String sort) throws Exception {
        Detail detail = getFormMap(Detail.class);
        detail = toFormMap(detail, pageNow, pageSize, detail.getStr("orderby"));
        detail.put("column", column);
        detail.put("sort", sort);
        pageView.setRecords(orderMapper.findDetailPage(detail));
        return pageView;
    }

    @RequestMapping("detail/addUI")
    public String addOrderDetailUI(Model model,HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        model.addAttribute("id",id);
        model.addAttribute("product", JSONArray.fromObject(productMapper.findProduct()));
        return Common.BACKGROUND_PATH + "/system/orderlow/detail/add";
    }

    @ResponseBody
    @RequestMapping("detail/addEntity")
    @SystemLog(module = "订单详情管理", methods = "订单详情管理-新增订单详情")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addOrderDetailEntity(HttpServletRequest request) throws Exception {
        String orderId = request.getParameter("orderId").toString();
        String productId = request.getParameter("productId").toString();
        String total = request.getParameter("total").toString();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date deliveryDate = simpleDateFormat.parse(request.getParameter("deliveryDate").toString());
        Date relDeliveryDate = simpleDateFormat.parse(request.getParameter("relDeliveryDate").toString());
        String isBack = request.getParameter("isBack").toString();
        orderMapper.addOrderDetailEntity(Integer.valueOf(orderId),Integer.valueOf(productId),total,deliveryDate,relDeliveryDate,isBack);
        return "success";
    }

    @RequestMapping("detail/editUI")
    public String editOrderDetailUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("product",productMapper.findProduct());
            model.addAttribute("detail", orderMapper.findOrderDetailById(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/orderlow/detail/edit";
    }

    @ResponseBody
    @RequestMapping("detail/editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单详情管理",methods="订单详情管理-修改订单详情")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editOrderDetailEntity(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        String productId = request.getParameter("productId").toString();
        String total = request.getParameter("total").toString();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date deliveryDate = simpleDateFormat.parse(request.getParameter("deliveryDate").toString());
        Date relDeliveryDate = simpleDateFormat.parse(request.getParameter("relDeliveryDate").toString());
        String isBack = request.getParameter("isBack").toString();
        orderMapper.editOrderDetailEntity(Integer.valueOf(id),Integer.valueOf(productId),total,deliveryDate,relDeliveryDate,isBack);
        return "success";
    }

    @ResponseBody
    @RequestMapping("detail/deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单详情管理",methods="订单详情管理-删除订单详情")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteOrderDetailEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++){
                List<DetailStatus> detailStatusList = orderMapper.findOrderDetailStatusByOrderDetailId(Integer.valueOf(idArr[i]));
                if(detailStatusList != null && detailStatusList.size() > 0){
                    return "1";
                }
                orderMapper.deleteOrderDetailById(Integer.valueOf(idArr[i]));
            }
        }
        return "success";
    }

    @RequestMapping("detail/status/addUI")
    public String addOrderDetailStatusUI(Model model,HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        model.addAttribute("id",id);
        Detail detail = orderMapper.findOrderDetailById(Integer.valueOf(id));//根据订单详情id找出订单详情
        int productId = Integer.valueOf(detail.get("productId").toString());
        Stock stock = stockMapper.findStockbyProductId(productId);
        String stockCount = stock == null ? "0" : stock.get("stock").toString();
        model.addAttribute("stockCount",stockCount);

        return Common.BACKGROUND_PATH + "/system/orderlow/detail/status/add";
    }

    @ResponseBody
    @RequestMapping("detail/status/addEntity")
    @SystemLog(module = "订单详情状态管理", methods = "订单详情状态管理-新增订单详情状态")//凡需要处理业务逻辑的.都需要记录操作日志
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    public String addOrderDetailStatusEntity(HttpServletRequest request) throws Exception {
        DetailStatus detailStatus = getFormMap(DetailStatus.class);

        int orderDetailId = Integer.valueOf(detailStatus.get("orderDetailId").toString());//订单详情id

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        detailStatus.put("createDate",simpleDateFormat.parse(detailStatus.get("createDate").toString()));
        detailStatus.put("orderDetailId",orderDetailId);

        int inspection = Integer.valueOf(detailStatus.get("inspection").toString());//送检数量
        int accBack = Integer.valueOf(detailStatus.get("accBack").toString());//验退数量
        int inStock = inspection - accBack;//入库数量 = 送检数量 - 验退数量
        detailStatus.put("inStock",String.valueOf(inStock));

        int outStock = Integer.valueOf(detailStatus.get("outStock").toString());//出库数量
        int stock = inStock - outStock;//库存数量 = 入库数量 - 出库数量
        int back = Integer.valueOf(detailStatus.get("back").toString());

        int stockCount = Integer.valueOf(request.getParameter("stockCount").toString());//剩余库存量
        if(outStock > (inStock + stockCount)){
            return "1";
        }

        //1.保存订单详情状态
        orderMapper.addOrderDetailStatusEntity(detailStatus);

        //2.改变订单详情
        Detail detail = orderMapper.findOrderDetailById(orderDetailId);//根据订单详情id找出订单详情
        int orderId = Integer.valueOf(detail.get("orderId").toString());//订单id
        int productId = Integer.valueOf(detail.get("productId").toString());//产品id
        int total = Integer.valueOf(detail.get("total").toString());//需求总数
        String isBack = detail.get("isBack").toString();//是否补退

        int detailInspection = detail.get("inspection") == null ? 0 : Integer.valueOf(detail.get("inspection").toString());
        int detailAccBack = detail.get("accBack") == null ? 0 : Integer.valueOf(detail.get("accBack").toString());
        int detailInStock = detail.get("inStock") == null ? 0 : Integer.valueOf(detail.get("inStock").toString());
        int detailOutStock = detail.get("outStock") == null ? 0 : Integer.valueOf(detail.get("outStock").toString());
        int detailOwe = detail.get("owe") == null ? 0 : Integer.valueOf(detail.get("owe").toString());
        int detailBack = detail.get("back") == null ? 0 : Integer.valueOf(detail.get("back").toString());

        int owe = 0;//欠货
        String isFinish = "0";//是否完成

        if(detailOwe == 0){//判断，是否第一次操作
            if(isBack.equals("0")){
                owe = total - outStock + back;
            }else if(isBack.equals("1")){
                owe = total - outStock;
            }
        }else{
            if(isBack.equals("0")){
                owe = detailOwe - outStock + back;
            }else if(isBack.equals("1")){
                owe = detailOwe - outStock;
            }
        }

        if(owe <= 0){//订单详情是否完成状态
            isFinish = "1";
        }
        orderMapper.updateOrderDetail(orderDetailId,isFinish,inspection+detailInspection,accBack+detailAccBack,inStock+detailInStock,outStock+detailOutStock,owe,back+detailBack);

        //2.改变订单是否完成状态
        String flag = "1";
        List<Detail>  detailList = orderMapper.findOrderDetailByOrderId(orderId);//根据orderId找出该订单所有的订单详情
        for(int i=0;i<detailList.size();i++){
            String orderIsFinish = detailList.get(i).get("isfinish").toString();
            if(orderIsFinish.equals("0")){
                flag = "0";
            }
        }
        orderMapper.updateOrderByFlag(orderId,flag);

        //3.改变库存（stock） 根据productId查找是否有库存，若已经有库存，则在原有基础上改变库存量，若没有,则添加库存
        Stock newStock = stockMapper.findStockbyProductId(productId);
        if(null == newStock){
            stockMapper.addStockEntity(productId,String.valueOf(stock));
        }else{
            int stockStr = Integer.valueOf(newStock.get("stock").toString());
            String newStockStr  = String.valueOf(stockStr + stock);
            stockMapper.updateStockByProductId(productId,newStockStr);
        }

        return "success";
    }

    @RequestMapping("detail/status/list")
    public String lisOrderDetailStatusUI(Model model,HttpServletRequest request) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/orderlow/detail/status/list";
    }

    @ResponseBody
    @RequestMapping("detail/status/findByPage")
    public PageView findOrderDetailStatusByPage(String pageNow,
                                                String pageSize,String column, String sort) throws Exception {
        DetailStatus detailStatus = getFormMap(DetailStatus.class);
        detailStatus = toFormMap(detailStatus, pageNow, pageSize, detailStatus.getStr("orderby"));
        detailStatus.put("column", column);
        detailStatus.put("sort", sort);
        pageView.setRecords(orderMapper.findDetailStatusPage(detailStatus));
        return pageView;
    }

    @RequestMapping("detail/status/editUI")
    public String editOrderDetailStatusUI(Model model) throws Exception {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            model.addAttribute("detailStatus", orderMapper.findOrderDetailStatusById(Integer.valueOf(id)));
        }
        return Common.BACKGROUND_PATH + "/system/orderlow/detail/status/edit";
    }

    @ResponseBody
    @RequestMapping("detail/status/editEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单详情状态管理",methods="订单详情状态管理-修改订单详情状态")//凡需要处理业务逻辑的.都需要记录操作日志
    public String editOrderDetailStatusEntity(HttpServletRequest request) throws Exception {
        DetailStatus detailStatus = getFormMap(DetailStatus.class);

        int id = Integer.valueOf(detailStatus.get("id").toString());//订单详情状态id
        int orderDetailId = Integer.valueOf(detailStatus.get("orderDetailId").toString());//订单详情id
        int inspection = Integer.valueOf(detailStatus.get("inspection").toString());//送检数量
        int accBack = Integer.valueOf(detailStatus.get("accBack").toString());//验退数量
        int inStock = inspection - accBack;//入库数量 = 送检数量 - 验退数量
        detailStatus.put("inStock",String.valueOf(inStock));

        int outStock = Integer.valueOf(detailStatus.get("outStock").toString());//出库数量
        int stock = inStock - outStock;//库存数量 = 入库数量 - 出库数量
        int back = Integer.valueOf(detailStatus.get("back").toString());

        DetailStatus newDetailStatus = orderMapper.findOrderDetailStatusById(id);//根据订单详情状态id找出订单详情状态
        int detailStatusInspection = newDetailStatus.get("inspection") == null ? 0 : Integer.valueOf(newDetailStatus.get("inspection").toString());
        int detailStatusAccBack = newDetailStatus.get("accBack") == null ? 0 : Integer.valueOf(newDetailStatus.get("accBack").toString());
        int detailStatusInStock = newDetailStatus.get("inStock") == null ? 0 : Integer.valueOf(newDetailStatus.get("inStock").toString());
        int detailStatusOutStock = newDetailStatus.get("outStock") == null ? 0 : Integer.valueOf(newDetailStatus.get("outStock").toString());
        int detailStatusBack = newDetailStatus.get("back") == null ? 0 : Integer.valueOf(newDetailStatus.get("back").toString());

        //1.改变订单详情状态
        orderMapper.editOrderDetailStatusEntity(detailStatus);

        //2.改变订单详情
        Detail detail = orderMapper.findOrderDetailById(orderDetailId);//根据订单详情id找出订单详情
        int orderId = Integer.valueOf(detail.get("orderId").toString());//订单id
        int productId = Integer.valueOf(detail.get("productId").toString());//产品id
        int total = Integer.valueOf(detail.get("total").toString());//需求总数
        String isBack = detail.get("isBack").toString();//是否补退

        int detailInspection = detail.get("inspection") == null ? 0 : Integer.valueOf(detail.get("inspection").toString());
        int detailAccBack = detail.get("accBack") == null ? 0 : Integer.valueOf(detail.get("accBack").toString());
        int detailInStock = detail.get("inStock") == null ? 0 : Integer.valueOf(detail.get("inStock").toString());
        int detailOutStock = detail.get("outStock") == null ? 0 : Integer.valueOf(detail.get("outStock").toString());
        int detailOwe = detail.get("owe") == null ? 0 : Integer.valueOf(detail.get("owe").toString());
        int detailBack = detail.get("back") == null ? 0 : Integer.valueOf(detail.get("back").toString());

        int owe = 0;//欠货
        String isFinish = "0";//是否完成

        if (isBack.equals("0")) {
            owe = detailOwe + detailStatusOutStock - detailStatusBack - outStock + back;
        } else if (isBack.equals("1")) {
            owe = detailOwe + detailStatusOutStock - detailStatusBack - outStock;
        }

        if(owe <= 0){//订单详情是否完成状态
            isFinish = "1";
        }
        orderMapper.updateOrderDetail(orderDetailId,isFinish,detailInspection-detailStatusInspection+inspection,detailAccBack-detailStatusAccBack+accBack,detailInStock-detailStatusInStock+inStock,detailOutStock-detailStatusOutStock+outStock,owe,detailBack-detailStatusBack+back);

        //2.改变订单是否完成状态
        String flag = "1";
        List<Detail>  detailList = orderMapper.findOrderDetailByOrderId(orderId);//根据orderId找出该订单所有的订单详情
        for(int i=0;i<detailList.size();i++){
            String orderIsFinish = detailList.get(i).get("isfinish").toString();
            if(orderIsFinish.equals("0")){
                flag = "0";
            }
        }
        orderMapper.updateOrderByFlag(orderId,flag);

        //3.改变库存（stock） 根据productId查找是否有库存，若已经有库存，则在原有基础上改变库存量，若没有,则添加库存
        Stock newStock = stockMapper.findStockbyProductId(productId);
        int stockStr = Integer.valueOf(newStock.get("stock").toString());
        String newStockStr = String.valueOf(stockStr - detailStatusInStock + detailStatusOutStock + stock);
        stockMapper.updateStockByProductId(productId, newStockStr);

        return "success";
    }

    @ResponseBody
    @RequestMapping("detail/status/deleteEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="订单详情状态管理",methods="订单详情状态管理-删除订单详情状态")//凡需要处理业务逻辑的.都需要记录操作日志
    public String deleteOrderDetailStatusEntity() throws Exception {
        String[] ids = getParaValues("ids");
        for (String id : ids) {
            String[] idArr = id.split(",");
            for(int i=0;i<idArr.length;i++){
                int newId = Integer.valueOf(idArr[i]);
                DetailStatus newDetailStatus = orderMapper.findOrderDetailStatusById(newId);//根据订单详情状态id找出订单详情状态
                int detailStatusInspection = newDetailStatus.get("inspection") == null ? 0 : Integer.valueOf(newDetailStatus.get("inspection").toString());
                int detailStatusAccBack = newDetailStatus.get("accBack") == null ? 0 : Integer.valueOf(newDetailStatus.get("accBack").toString());
                int detailStatusInStock = newDetailStatus.get("inStock") == null ? 0 : Integer.valueOf(newDetailStatus.get("inStock").toString());
                int detailStatusOutStock = newDetailStatus.get("outStock") == null ? 0 : Integer.valueOf(newDetailStatus.get("outStock").toString());
                int detailStatusBack = newDetailStatus.get("back") == null ? 0 : Integer.valueOf(newDetailStatus.get("back").toString());
                int orderDetailId = newDetailStatus.get("orderDetailId") == null ? 0 : Integer.valueOf(newDetailStatus.get("orderDetailId").toString());

                Detail detail = orderMapper.findOrderDetailById(orderDetailId);//根据订单详情id找出订单详情
                int orderId = Integer.valueOf(detail.get("orderId").toString());//订单id
                int productId = Integer.valueOf(detail.get("productId").toString());//产品id
                int total = Integer.valueOf(detail.get("total").toString());//需求总数
                String isBack = detail.get("isBack").toString();//是否补退

                int detailInspection = detail.get("inspection") == null ? 0 : Integer.valueOf(detail.get("inspection").toString());
                int detailAccBack = detail.get("accBack") == null ? 0 : Integer.valueOf(detail.get("accBack").toString());
                int detailInStock = detail.get("inStock") == null ? 0 : Integer.valueOf(detail.get("inStock").toString());
                int detailOutStock = detail.get("outStock") == null ? 0 : Integer.valueOf(detail.get("outStock").toString());
                int detailOwe = detail.get("owe") == null ? 0 : Integer.valueOf(detail.get("owe").toString());
                int detailBack = detail.get("back") == null ? 0 : Integer.valueOf(detail.get("back").toString());

                int owe = 0;//欠货
                String isFinish = "0";//是否完成

                if (isBack.equals("0")) {
                    owe = detailOwe + detailStatusOutStock - detailStatusBack;
                } else if (isBack.equals("1")) {
                    owe = detailOwe + detailStatusOutStock - detailStatusBack;
                }

                if(owe <= 0){//订单详情是否完成状态
                    isFinish = "1";
                }
                orderMapper.updateOrderDetail(orderDetailId,isFinish,detailInspection-detailStatusInspection,detailAccBack-detailStatusAccBack,detailInStock-detailStatusInStock,detailOutStock-detailStatusOutStock,owe,detailBack-detailStatusBack);

                //2.改变订单是否完成状态
                String flag = "1";
                List<Detail>  detailList = orderMapper.findOrderDetailByOrderId(orderId);//根据orderId找出该订单所有的订单详情
                for(int j=0;j<detailList.size();j++){
                    String orderIsFinish = detailList.get(j).get("isfinish").toString();
                    if(orderIsFinish.equals("0")){
                        flag = "0";
                    }
                }
                orderMapper.updateOrderByFlag(orderId,flag);

                //3.改变库存（stock） 根据productId查找是否有库存，若已经有库存，则在原有基础上改变库存量，若没有,则添加库存
                Stock newStock = stockMapper.findStockbyProductId(productId);
                int stockStr = Integer.valueOf(newStock.get("stock").toString());
                String newStockStr = String.valueOf(stockStr - detailStatusInStock + detailStatusOutStock);
                stockMapper.updateStockByProductId(productId, newStockStr);

                orderMapper.deleteOrderDetailStatusById(newId);
            }
        }
        return "success";
    }

    @RequestMapping("detail/updateStatusUI")
    public String updateStatusUI(Model model,HttpServletRequest request) throws Exception {
        String id = request.getParameter("id").toString();
        model.addAttribute("id", id);
        return Common.BACKGROUND_PATH + "/system/orderlow/detail/updateStatus";
    }

    @ResponseBody
    @RequestMapping("detail/updateEntity")
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    public String updateEntity(HttpServletRequest request) throws Exception {
        int id = Integer.valueOf(request.getParameter("id").toString());
        String remark = request.getParameter("remark").toString();
        orderMapper.updateEntity(id,remark);

        //改变订单是否完成状态
        Detail detail = orderMapper.findOrderDetailById(id);
        int orderId = Integer.valueOf(detail.get("orderId").toString());//订单id
        String flag = "1";
        List<Detail>  detailList = orderMapper.findOrderDetailByOrderId(orderId);
        for(int i=0;i<detailList.size();i++){
            String orderIsFinish = detailList.get(i).get("isfinish").toString();
            if(orderIsFinish.equals("0")){
                flag = "0";
            }
        }
        orderMapper.updateOrderByFlag(orderId,flag);

        return "success";
    }

    @RequestMapping("searchDetailUI")
    public String searchDetailUI(Model model,HttpServletRequest request) throws Exception {
        int id = Integer.valueOf(request.getParameter("id").toString());
        model.addAttribute("orderDetail", orderMapper.findOrderDetailByOrderId(id));
        return Common.BACKGROUND_PATH + "/system/orderlow/orderDetail";
    }
}
