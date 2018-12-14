package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.BankCard;
import com.liaoin.service.app.bean.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Integer>,JpaSpecificationExecutor<Order> {

    List<Order> findByUserId(String userId);
}
