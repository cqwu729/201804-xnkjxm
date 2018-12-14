package com.liaoin.service.backstage.dao;

import com.liaoin.service.backstage.bean.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface MenuRepository extends JpaRepository<Menu,String>, JpaSpecificationExecutor<Menu> {

    List<Menu> findByParentId(String parentId);
}
