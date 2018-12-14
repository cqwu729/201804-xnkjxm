package com.liaoin.backstage.controller;

import com.liaoin.common.date.DateFormat;
import com.liaoin.service.app.bean.Column;
import com.liaoin.service.app.bean.Notice;
import com.liaoin.service.app.service.NoticeService;
import com.liaoin.service.backstage.Enum.RoleStatus;
import com.liaoin.service.backstage.bean.Role;
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

import java.util.Date;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

/**
 * NoticeController
 *
 * @author cqwu729
 * @date 2018/11/11 18:24
 */
@Controller
@RequestMapping("Notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    /**
     * 列表
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(
            @RequestParam(required = false) Integer p,
            @RequestParam(required = false) Integer columnId,
            @RequestParam(required = false) String name,
            HttpServletRequest request,
            ModelAndView modelAndView
    ){
        int page = 0;
        if(p != null){
            page = p - 1;
        }
        Page<Notice> notices = noticeService.queryWithPage(page, Constant.PageConstant.ADMIN_PAGE_COUNT,columnId,name);
        PageResult<Notice> pageResult = new PageResult<Notice>();
        pageResult = pageResult.setPageUrl(request,page,Constant.PageConstant.ADMIN_PAGE_COUNT,notices);
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("columnId", columnId);
        modelAndView.addObject("name", name);
        List<Column> columns = noticeService.findAllColumns();
        modelAndView.addObject("columns",columns);
        modelAndView.setViewName("Notice/index");
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
        List<Column> columns = noticeService.findAllColumns();
        modelAndView.addObject("columns",columns);
        modelAndView.addObject("time",DateFormat.stampToDateEndM((new Date()).getTime()+""));
        modelAndView.setViewName("Notice/add");
        return modelAndView;
    }

    /**
     * 提交数据
     */
    @RequestMapping(value = "/post",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity post(
            @RequestParam(required = false) Integer id,
            @RequestParam Integer columnId,
            @RequestParam String name,
            @RequestParam String addTime,
            @RequestParam String picture,
            @RequestParam String content
    ) throws Exception{
        Column column = Column.builder().id(columnId).build();
        Notice notice = Notice.builder()
                .id(id)
                .column(column)
                .name(name)
                .addTime(DateFormat.dateToStampEndM2(addTime))
                .picture(picture)
                .content(content)
                .build()
                ;
        return ResponseEntity.ok(noticeService.save(notice));
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
        Notice notice = noticeService.findById(id);

        List<Column> columns = noticeService.findAllColumns();
        modelAndView.addObject("columns",columns);
        modelAndView.addObject("notice",notice);
        modelAndView.addObject("time",DateFormat.stampToDateEndM(notice.getAddTime().getTime()+""));
        modelAndView.setViewName("Notice/update");
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
        return ok(noticeService.deleteById(id));
    }
}
