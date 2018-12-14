package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Miner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface MinerRepository extends JpaRepository<Miner,Integer>,JpaSpecificationExecutor<Miner> {

}
