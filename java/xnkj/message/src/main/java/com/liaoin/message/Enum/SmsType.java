package com.liaoin.message.Enum;

/**
 * 角色状态
 * Created by Administrator on 2015/1/4 0004.
 */
public enum SmsType {
    REGISTER("用户注册", 0),
    FORGET_PASSWORD("忘记密码，或者其他短信验证码，如提现", 1);

    SmsType(String name, int index) {
        this.name = name;
        this.index = index;
    }

    private String name;
    private int index;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

}
