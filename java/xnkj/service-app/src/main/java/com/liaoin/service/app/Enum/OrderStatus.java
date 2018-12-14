package com.liaoin.service.app.Enum;

/**
 * 角色状态
 * Created by Administrator on 2015/1/4 0004.
 */
public enum OrderStatus {
    WAIT_FOR_PAY("待审核", 0),
    ORDER_PAID("已完成", 1),
    CANCELD("已拒绝", 2),
    ;

    OrderStatus(String name, int index) {
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
