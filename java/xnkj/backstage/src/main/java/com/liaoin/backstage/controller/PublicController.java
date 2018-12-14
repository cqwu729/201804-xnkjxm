package com.liaoin.backstage.controller;

import com.liaoin.backstage.file.FileUtils;
import com.liaoin.common.date.DateFormat;
import com.liaoin.service.base.constant.Constant;
import com.liaoin.service.base.message.OperateResult;
import io.swagger.annotations.ApiParam;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import static com.liaoin.service.base.message.OperateResult.success;
import static org.springframework.http.ResponseEntity.ok;

/**
 * Created by Administrator on 2017/4/21.
 */

@Controller
@RequestMapping("Public")
public class PublicController {

    /**
     * 上传广告图片
     */
    @RequestMapping(value = "/uploadPicture",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity uploadPicture(
            HttpServletRequest request
    ) throws Exception{
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile filedata = multipartRequest.getFile("Filedata");
        return ok(FileUtils.upload(filedata, request));
    }


}
