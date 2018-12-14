package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.BankCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface BankCardRepository extends JpaRepository<BankCard,String>,JpaSpecificationExecutor<BankCard> {

    List<BankCard>  findByUserId(String userId);

    List<BankCard>  findByUserIdAndAddressNotNull(String userId);

    List<BankCard>  findByUserIdAndAddressNull(String userId);
}
