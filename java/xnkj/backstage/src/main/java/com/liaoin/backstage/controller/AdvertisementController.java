package com.liaoin.backstage.controller;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.service.AdvertisementService;
import com.liaoin.service.base.constant.Constant;
import com.liaoin.service.base.message.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import static org.springframework.http.ResponseEntity.ok;

@Controller
@RequestMapping("Advertisement")
public class AdvertisementController {

    @Autowired
    private AdvertisementService advertisementService;
    /**
     * 列表
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(
            @RequestParam(required = false) Integer p,
            @RequestParam(required = false) String keyword,
            HttpServletRequest request,
            ModelAndView modelAndView
    ){
        int page = 0;
        if(p != null){
            page = p - 1;
        }
        Page<Advertisement> advertisements = advertisementService.queryWithPage(page, Constant.PageConstant.ADMIN_PAGE_COUNT);
        PageResult<Advertisement> pageResult = new PageResult<Advertisement>();
        pageResult = pageResult.setPageUrl(request,page,Constant.PageConstant.ADMIN_PAGE_COUNT,advertisements);
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("keyword", keyword);
        modelAndView.setViewName("Advertisement/index");
        return modelAndView;
    }

    /**
     * 添加
     */
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView add(
            ModelAndView modelAndView
    ){
        modelAndView.setViewName("Advertisement/add");
        return modelAndView;
    }

    /**
     * 提交数据
     */
    @RequestMapping(value = "/post",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity post(
            @RequestParam(required = false) Integer id,
            @RequestParam String username,
            @RequestParam String picture,
            @RequestParam String url,
            @RequestParam(defaultValue = "INDEX") String icon
    ){
        Advertisement advertisement = Advertisement.builder()
                .id(id)
                .username(username)
                .picture(picture)
                .url(url)
                .icon(icon)
                .build();
        return ResponseEntity.ok(advertisementService.save(advertisement));
    }

    /**
     * 编辑
     */
    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView update(
            @RequestParam Integer id,
            ModelAndView modelAndView
    ){
        Advertisement advertisement = advertisementService.findById(id);
        modelAndView.addObject("advertisement",advertisement);
        modelAndView.setViewName("Advertisement/update");
        return modelAndView;
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity delete(
            @RequestParam Integer id
    ) throws Exception{
        return ok(advertisementService.deleteById(id));
    }
}
