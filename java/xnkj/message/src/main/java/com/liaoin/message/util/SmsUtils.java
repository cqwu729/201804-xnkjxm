package com.liaoin.message.util;

import com.liaoin.common.http.OkhttpUtils;
import com.liaoin.message.constant.SmsConstant;
import okhttp3.Response;

import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class SmsUtils {

    public static int sendSms(String phone, String content) throws Exception{
        content = URLEncoder.encode(content.replaceAll("<br/>", " "), "GBK");//发送内容
        String url = SmsConstant.HTTP_URL + "?CorpID=" + SmsConstant.CORP_ID + "&Pwd=" + SmsConstant.PWD + "&Mobile=" + phone + "&Content=" + content;
        try {
            Response requestResult = OkhttpUtils.get(url);
            String result = requestResult.body().string();
            return Integer.parseInt(result);
        }catch (Exception e){
            return 0;
        }
    }

    public static void main(String[] args) {
        String content = "尊敬的用户，您好，您此次的验证码是123123；此验证码半个小时内有效；";
        try {
            sendSms("18306096704",content);
        }catch (Exception e){}
    }
}
