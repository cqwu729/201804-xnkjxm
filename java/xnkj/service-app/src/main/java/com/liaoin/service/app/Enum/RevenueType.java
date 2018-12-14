package com.liaoin.service.app.Enum;

/**
 * 收益类型
 * Created by Administrator on 2015/1/4 0004.
 */
public enum RevenueType {
    GDSY("固定收益", 0),
    TJSY("推荐收益", 1),
    DTSY("动态收益", 2),
    REGISTER("注册赠送收益", 3),
    TXTK("提现退款", 4),
    ;

    RevenueType(String name, int index) {
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
