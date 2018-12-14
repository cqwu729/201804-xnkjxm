package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.dao.AdvertisementRepository;
import com.liaoin.service.app.service.AdvertisementService;
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
public class AdvertisementServiceImpl implements AdvertisementService {

    @Autowired
    private AdvertisementRepository advertisementRepository;
    @Override
    public OperateResult queryAdvertisementsByIcon(String icon) {
        List<Advertisement> advertisements = advertisementRepository.findByIcon(icon);
        return success(advertisements);
    }

    @Override
    public Page<Advertisement> queryWithPage(int page, int size) {
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<Advertisement> advertisements = advertisementRepository.findAll(pageRequest);
        return advertisements;
    }

    @Override
    public OperateResult save(Advertisement advertisement) {
        advertisementRepository.save(advertisement);
        return success();
    }

    @Override
    public Advertisement findById(Integer id) {
        if(!advertisementRepository.existsById(id)){
            return null;
        }else{
            return advertisementRepository.findById(id).get();
        }
    }

    @Override
    public OperateResult deleteById(Integer id) {
        if(!advertisementRepository.existsById(id)){
            return fail(Result.HAVE_NOT_DATA);
        }else {
            advertisementRepository.deleteById(id);
            return success();
        }
    }
}
