package com.liaoin.service.app.dao;

import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.RevenueRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Date;
import java.util.List;

public interface RevenueRecordRepository extends JpaRepository<RevenueRecord,Integer>,JpaSpecificationExecutor<RevenueRecord> {

    RevenueRecord findByUserIdAndDate(String userId, Date date);

    List<RevenueRecord> findByUserIdAndRevenueStatus(String userId, RevenueStatus revenueStatus);
}
