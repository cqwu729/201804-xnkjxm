package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.IncomeDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface IncomeDetailRepository extends JpaRepository<IncomeDetail,Integer>,JpaSpecificationExecutor<IncomeDetail> {

}
