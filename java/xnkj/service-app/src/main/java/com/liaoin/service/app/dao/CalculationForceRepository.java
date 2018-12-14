package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.CalculationForce;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface CalculationForceRepository extends JpaRepository<CalculationForce,Integer>,JpaSpecificationExecutor<CalculationForce> {

    CalculationForce findByUserId(String userId);
}
