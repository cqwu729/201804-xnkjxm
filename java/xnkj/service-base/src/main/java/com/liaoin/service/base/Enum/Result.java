package com.liaoin.service.base.Enum;

public enum Result {
    SUCCESS("请求成功",0),
    FAIL("请求失败",1),
    DISABLED_TOKEN("token过期",2),
    SYSTEM_ERROR("系统错误",3),
    NO_USER("用户不存在",4),
    ERROR_PASSWORD("用户或密码错误",5),
    USER_REGISTERED("用户已注册",6),
    MESSAGE_IS_NOT_TRUE("验证码不正确",7),
    MESSAGE_IS_BE_OVERDUE("验证码已过期",8),
    TWICE_PASSWORD_NOT_EQUAL("两次密码不一致",9),
    RECOMMENT_CODE_HAVA_NOT("注册码不存在",10),
    SEND_MESSAGE_FAIL("验证码发送失败",11),
    HAVE_ADMIN("该管理员已存在",12),
    OLD_PASSWORD_NOT_EQUAL("原始密码不正确",13),
    HAVE_NOT_DATA("原始密码不正确",14),
    HAVE_NOT_BALANCE("余额不足",15),
    HAVE_NOT_MINER("矿机信息不存在",16),
    MINER_HIGH_TO_THIS("用户拥有的矿机等级比这高",17),
    HAVE_DATA("数据信息已存在",18),
    BANK_HAVE_NOT_DATA("银行卡不存在",19),
    ALREDAY_AUTH("您已认证",20),
    FILE_NOT_NULL("文件不能为空",21),
    BALANCE_HAVA_NOT("余额满200才能提现",22),
    CODE_NOT_NULL("邀请码不能为空",23),
    YHJY("用户已被禁用",24),
    ;

    Result(String msg, Integer code) {
        this.msg = msg;
        this.code = code;
    }

    public Integer code;
    public String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
