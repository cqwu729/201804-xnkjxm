package com.liaoin.service.app.bean;

import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.Enum.RevenueType;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

/**
 * 收益记录
 */
@Entity
@Table(name = "t_revenue_record")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RevenueRecord {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "用户")
    @OneToOne(targetEntity = User.class)
    private User user;

    @ApiModelProperty(value = "矿机")
    @OneToOne(targetEntity = Miner.class)
    private Miner miner;

    @ApiModelProperty(value = "收益金额")
    private float money;

    @ApiModelProperty(value = "收益记录使用状态")
    private RevenueStatus revenueStatus;

    @ApiModelProperty(value = "收益类型")
    private RevenueType revenueType;

    @ApiModelProperty(value = "收益时间")
    private Date date;

}
