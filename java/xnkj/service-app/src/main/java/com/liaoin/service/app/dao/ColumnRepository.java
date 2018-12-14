package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Authentication;
import com.liaoin.service.app.bean.Column;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ColumnRepository extends JpaRepository<Column,Integer>,JpaSpecificationExecutor<Column> {

}
