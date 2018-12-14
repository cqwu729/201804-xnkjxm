package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.dao.MinerRepository;
import com.liaoin.service.app.service.MinerService;
import com.liaoin.service.base.Enum.Result;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;

@Service
public class MinerServiceImpl implements MinerService {

    @Autowired
    private MinerRepository  minerRepository;

    @Override
    public OperateResult queryMinerLists() {
        Sort sort = Sort.by(Sort.Direction.DESC, "price");
        List<Miner> miners = minerRepository.findAll(sort);
        if(miners.size()  ==  0){
            return fail(Result.HAVE_NOT_DATA);
        }
        return success(miners);
    }

    @Override
    public Page<Miner> queryWithPage(int page, int size) {
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<Miner> miners = minerRepository.findAll(pageRequest);
        return miners;
    }

    @Override
    public OperateResult save(Miner miner) {
        minerRepository.save(miner);
        return success();
    }

    @Override
    public Miner findById(Integer id) {
        if(!minerRepository.existsById(id)){
            return null;
        }else{
            return minerRepository.findById(id).get();
        }
    }

    @Override
    public OperateResult deleteById(Integer id) {
        if(!minerRepository.existsById(id)){
            return fail(Result.HAVE_NOT_DATA);
        }else {
            minerRepository.deleteById(id);
            return success();
        }
    }

    @Override
    public List<Miner> queryMiners() {
        Sort sort = Sort.by(Sort.Direction.DESC, "price");
        List<Miner> miners = minerRepository.findAll(sort);
        return miners;
    }
}
