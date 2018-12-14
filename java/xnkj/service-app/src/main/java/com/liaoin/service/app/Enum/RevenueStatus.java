package com.liaoin.service.app.Enum;

/**
 * 收益记录使用状态
 * Created by Administrator on 2015/1/4 0004.
 */
public enum RevenueStatus {
    YES("已使用", 0),
    NO("未使用", 1),
    ;

    RevenueStatus(String name, int index) {
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
