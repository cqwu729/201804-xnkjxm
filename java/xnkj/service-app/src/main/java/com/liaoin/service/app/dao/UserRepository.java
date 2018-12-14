package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface UserRepository extends JpaRepository<User,String>,JpaSpecificationExecutor<User> {

    User findByPhone(String phone);

    User findByRecommendCode(Integer recommendCode);

    List<User> findByCode(Integer code);
}
