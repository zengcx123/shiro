package com.lanyuan.mapper;

import com.lanyuan.entity.Buy;
import com.lanyuan.entity.PlanFormMap;
import com.lanyuan.entity.Produce;
import com.lanyuan.entity.ProduceDetail;
import com.lanyuan.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by zeng on 2017/3/14.
 */
public interface ProduceMapper extends BaseMapper {

    List<Produce> findProducePage(Produce produce);

    void addProduceEntity(@Param("planNo") String planNo,@Param("customerId") int customerId,@Param("productId") int productId,@Param("count") String count,@Param("needDate") Date needDate,@Param("owe") int owe);

    void addDetailEntity(@Param("planId") int planId,@Param("startDate") Date startDate,@Param("endDate") Date endDate,@Param("count") String count);

    List<ProduceDetail> findDetail(@Param("planId") int planId);

    void deleteProduceDetailEntity(@Param("planId") int planId);

    Produce findProduceById(@Param("planId") int planId);

    void updateProduce(@Param("planId") int planId,@Param("model") int model,@Param("box") int box,@Param("bell") int bell,
                       @Param("openBox") int openBox,@Param("polish") int polish,@Param("hot") int hot,@Param("sand") int sand,
                       @Param("inspection") int inspection,@Param("back") int back,@Param("inStock") int inStock,
                       @Param("reject") int reject, @Param("owe") int owe,@Param("isFinish") String isFinish);

    void updateNeedDate(@Param("id") int id,@Param("needDate") Date needDate);

    List<PlanFormMap> findStatus(@Param("planId") int planId);

    void deleteProduceById(@Param("planId") int planId);

    List<PlanFormMap> findAllStatus(PlanFormMap planFormMap);

    PlanFormMap findPlanFormMap(@Param("id") int id);
}
