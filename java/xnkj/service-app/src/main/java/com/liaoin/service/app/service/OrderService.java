package com.liaoin.service.app.service;

import com.liaoin.service.app.Enum.OrderStatus;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.base.message.OperateResult;
import io.swagger.models.auth.In;
import org.springframework.data.domain.Page;

public interface OrderService {

    public OperateResult  buy(String userId, Integer minerId);

    public OperateResult  queryPayMoney(String userId, Integer minerId);

    public OperateResult queryUserOrderLists(String userId);

    public Page<Order> queryWithPage(int page, int size, String keyword, OrderStatus orderStatus);

    public OperateResult pass(Integer orderId);

    public OperateResult unpass(Integer orderId);

}
