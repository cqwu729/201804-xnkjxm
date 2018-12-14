package com.liaoin.service.app.dao;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.Authentication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface AdvertisementRepository extends JpaRepository<Advertisement,Integer>,JpaSpecificationExecutor<Advertisement> {

    List<Advertisement> findByIcon(String icon);
}
