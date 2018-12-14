package com.liaoin.service.app.service;

import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.Enum.RevenueType;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.bean.RevenueRecord;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.data.domain.Page;

import java.util.List;

public interface RevenueRecordService {

    /**
     * 计算用户每日收益
     */
    public OperateResult calculation();

    public OperateResult queryMyRevenueRecordLists(String userId);

    public OperateResult collectRevenue(String userId,Integer revenueRecordId);

    public Page<RevenueRecord> queryWithPage(int page, int size, String userId, RevenueStatus revenueStatus);

    public List<RevenueRecord> findAll();
}
