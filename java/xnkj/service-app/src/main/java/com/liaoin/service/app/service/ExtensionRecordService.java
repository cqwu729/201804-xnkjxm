package com.liaoin.service.app.service;

import javax.servlet.http.HttpServletRequest;

public interface ExtensionRecordService {

    /**
     * 递归获取
     */
    public String queryExtensionRecords(Integer code, HttpServletRequest request);
}
