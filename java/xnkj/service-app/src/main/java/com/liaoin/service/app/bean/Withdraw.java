package com.liaoin.service.app.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.liaoin.service.app.Enum.OrderStatus;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * 提现记录
 */
@Entity
@Table(name = "t_withdraw")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Withdraw {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE,generator = "uuid")
    @GenericGenerator(name="uuid",strategy = "uuid")
    @ApiModelProperty(value = "ID")
    private String id;

    @ApiModelProperty(value = "用户")
    @OneToOne(targetEntity = User.class)
    private User user;

    @ApiModelProperty(value = "提现金额")
    private float money;

    @ApiModelProperty(value = "提现时间")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date addTime;

    @ApiModelProperty(value = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date updateTime;

    @ApiModelProperty(value = "提现状态")
    private OrderStatus orderStatus;

    @ApiModelProperty(value = "提现银行卡")
    @OneToOne(targetEntity = BankCard.class)
    private BankCard bankCard;
}
