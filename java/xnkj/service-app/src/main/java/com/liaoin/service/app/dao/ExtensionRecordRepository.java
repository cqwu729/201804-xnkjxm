package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.ExtensionRecord;
import com.liaoin.service.app.bean.Withdraw;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ExtensionRecordRepository extends JpaRepository<ExtensionRecord,String>,JpaSpecificationExecutor<ExtensionRecord> {

    List<ExtensionRecord> findByUserId(String userId);
}
