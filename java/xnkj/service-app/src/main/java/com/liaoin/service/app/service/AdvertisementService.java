package com.liaoin.service.app.service;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.data.domain.Page;

public interface AdvertisementService {

    public OperateResult queryAdvertisementsByIcon(String icon);

    public Page<Advertisement> queryWithPage(int page, int size);

    public OperateResult save(Advertisement advertisement);

    public Advertisement findById(Integer id);

    public OperateResult deleteById(Integer id);
}
