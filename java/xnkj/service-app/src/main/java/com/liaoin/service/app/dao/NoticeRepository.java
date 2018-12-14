package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface NoticeRepository extends JpaRepository<Notice,Integer>,JpaSpecificationExecutor<Notice> {

    List<Notice> findByColumn_Id(Integer columnId);
}
