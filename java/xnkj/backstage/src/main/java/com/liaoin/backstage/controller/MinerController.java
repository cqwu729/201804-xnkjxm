package com.liaoin.backstage.controller;

import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.service.AdvertisementService;
import com.liaoin.service.app.service.MinerService;
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
import javax.validation.constraints.Min;

import static org.springframework.http.ResponseEntity.ok;

@Controller
@RequestMapping("Miner")
public class MinerController {

    @Autowired
    private MinerService minerService;
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
        Page<Miner> miners = minerService.queryWithPage(page, Constant.PageConstant.ADMIN_PAGE_COUNT);
        PageResult<Miner> pageResult = new PageResult<Miner>();
        pageResult = pageResult.setPageUrl(request,page,Constant.PageConstant.ADMIN_PAGE_COUNT,miners);
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("keyword", keyword);
        modelAndView.setViewName("Miner/index");
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
        modelAndView.setViewName("Miner/add");
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
            @RequestParam float price,
            @RequestParam float profit,
            @RequestParam String remark,
            @RequestParam String picture,
            @RequestParam Integer returnTime,
            @RequestParam float monthlyIncome,
            @RequestParam float generation,
            @RequestParam float twoGeneration,
            @RequestParam float infiniteGeneration
    ){
        Miner miner = Miner.builder()
                .id(id)
                .username(username)
                .price(price)
                .profit(profit)
                .remark(remark)
                .picture(picture)
                .returnTime(returnTime)
                .monthlyIncome(monthlyIncome)
                .generation(generation)
                .twoGeneration(twoGeneration)
                .infiniteGeneration(infiniteGeneration)
                .build();
        return ResponseEntity.ok(minerService.save(miner));
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
        Miner miner = minerService.findById(id);
        modelAndView.addObject("miner",miner);
        modelAndView.setViewName("Miner/update");
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
        return ok(minerService.deleteById(id));
    }
}
