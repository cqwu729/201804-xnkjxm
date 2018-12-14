package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.BankCard;
import com.liaoin.service.app.bean.Withdraw;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface WithdrawRepository extends JpaRepository<Withdraw,String>,JpaSpecificationExecutor<Withdraw> {

    List<Withdraw> findByUserId(String  userId);

}
