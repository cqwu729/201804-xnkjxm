package com.liaoin.service.app.Enum;

/**
 * 角色状态
 * Created by Administrator on 2015/1/4 0004.
 */
public enum AuthenticationStatus {
    WAIT("待审核", 0),
    YES("已认证", 1),
    NO("认证失败", 2),
    ;

    AuthenticationStatus(String name, int index) {
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
