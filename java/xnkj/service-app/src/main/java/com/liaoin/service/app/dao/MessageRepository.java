package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MessageRepository extends JpaRepository<Message,String>,JpaSpecificationExecutor<Message> {

    Message findByPhoneAndVerifyOrderByAddTimeDesc(String phone,Integer verify);
}
