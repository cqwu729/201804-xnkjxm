package com.liaoin.service.backstage.dao;

import com.liaoin.service.backstage.bean.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface AdminRepository extends JpaRepository<Admin,String>, JpaSpecificationExecutor<Admin> {

    /**
     * 根据用户名查询用户
     */
    Admin findByUsername(String username);

    Admin findByUsernameAndIdNot(String username, String id);
}
