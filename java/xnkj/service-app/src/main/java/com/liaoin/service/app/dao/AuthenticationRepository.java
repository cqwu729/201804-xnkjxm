package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Authentication;
import com.liaoin.service.app.bean.BankCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface AuthenticationRepository extends JpaRepository<Authentication,Integer>,JpaSpecificationExecutor<Authentication> {

    Authentication findByUserId(String userId);
}
