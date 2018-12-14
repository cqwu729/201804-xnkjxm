package com.liaoin.service.app.bean;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 矿机信息
 */
@Entity
@Table(name = "t_miner")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Miner {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "矿机名称")
    private String username;

    @ApiModelProperty(value = "价格")
    private float price;

    @ApiModelProperty(value = "日收益")
    private float profit;

    @ApiModelProperty(value = "收益说明")
    private String remark;

    @ApiModelProperty(value = "矿机图片")
    private String picture;

    @ApiModelProperty(value = "回本时间")
    private int returnTime;

    @ApiModelProperty(value = "月收益")
    private float monthlyIncome;

    @ApiModelProperty(value = "推荐一代")
    private float generation;

    @ApiModelProperty(value = "推荐二代")
    private float twoGeneration;

    @ApiModelProperty(value = "无限代")
    private float infiniteGeneration;

}
