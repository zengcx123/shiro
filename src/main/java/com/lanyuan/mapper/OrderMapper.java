package com.lanyuan.mapper;

import com.lanyuan.entity.*;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by zeng on 2017/3/14.
 */
public interface OrderMapper extends BaseMapper {

    List<OrderFormMap> findOrderPage(OrderFormMap orderFormMap);

    List<OrderNatureFormMap> findOrderNaturePage(OrderNatureFormMap orderNatureFormMap);

    void addOrderNatureEntity(@Param("nature") String nature);

    List<OrderNatureFormMap> findOrderNature();

    void addOrderEntity(OrderFormMap orderFormMap);

    List<Detail> findDetailPage(Detail detail);

    void editOrderEntity(OrderFormMap orderFormMap);

    void addOrderDetailEntity(@Param("orderId") int orderId, @Param("productId") int productId, @Param("total") String total, @Param("deliveryDate") Date deliveryDate, @Param("relDeliveryDate") Date relDeliveryDate, @Param("isBack") String isBack);

    Detail findOrderDetailById(@Param("id") int id);

    void editOrderDetailEntity(@Param("id") int id,@Param("productId") int productId,@Param("total") String total, @Param("deliveryDate") Date deliveryDate, @Param("relDeliveryDate") Date relDeliveryDate, @Param("isBack") String isBack);

    void deleteOrderDetailById(@Param("id") int id);

    void addOrderDetailStatusEntity(DetailStatus detailStatus);

    List<DetailStatus> findDetailStatusPage(DetailStatus detailStatus);

    DetailStatus findOrderDetailStatusById(@Param("id") int id);

    void editOrderDetailStatusEntity(DetailStatus detailStatus);

    void deleteOrderDetailStatusById(@Param("id") int id);

    void updateOrderDetail(@Param("id") int id,@Param("isFinish") String isFinish,@Param("inspection") int inspection,@Param("accBack") int accBack,@Param("inStock") int inStock,@Param("outStock") int outStock,@Param("owe") int owe,@Param("back") int back);

    void updateEntity(@Param("id") int id,@Param("remark") String remark);

    List<Detail> findOrderDetailByOrderId(@Param("orderId") int orderId);

    void updateOrderByFlag(@Param("id") int id,@Param("flag") String flag);

    void deleteOrderDetailByOrderId(@Param("orderId") int orderId);

    void deleteOrderDetailStatusByOrderDetailId(@Param("orderDetailId") int orderDetailId);

    List<DetailStatus> findOrderDetailStatusByOrderDetailId(@Param("orderDetailId") int orderDetailId);

    void deleteOrderById(@Param("id") int id);
}
