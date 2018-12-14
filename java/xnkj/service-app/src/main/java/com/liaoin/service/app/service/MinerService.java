package com.liaoin.service.app.service;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.data.domain.Page;

import java.util.List;

public interface MinerService {

    public OperateResult queryMinerLists();

    public List<Miner> queryMiners();

    public Page<Miner> queryWithPage(int page, int size);

    public OperateResult save(Miner miner);

    public Miner findById(Integer id);

    public OperateResult deleteById(Integer id);
}