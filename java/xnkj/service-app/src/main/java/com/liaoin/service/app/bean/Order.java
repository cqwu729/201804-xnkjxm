package com.liaoin.service.app.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.liaoin.service.app.Enum.OrderStatus;
import com.liaoin.service.app.Enum.PayType;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_order")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "用户ID")
    @OneToOne(targetEntity = User.class)
    private User user;

    @ApiModelProperty(value = "矿机")
    @OneToOne(targetEntity = Miner.class)
    private Miner miner;

    @ApiModelProperty(value = "支付方式")
    private PayType payType;

    @ApiModelProperty(value = "支付价格")
    private float price;

    @ApiModelProperty(value = "订单状态")
    private OrderStatus orderStatus;

    @ApiModelProperty(value = "添加时间")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date addTime;

    @ApiModelProperty(value = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date updateTime;

    @ApiModelProperty(value = "订单数量")
    private int count;
}
