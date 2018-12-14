package com.liaoin.service.app.bean;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * 轮播广告图
 */
@Entity
@Table(name = "t_advertisement")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Advertisement {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "广告名称")
    private String username;

    @ApiModelProperty(value = "图片地址")
    private String picture;

    @ApiModelProperty(value = "链接")
    private String url;

    @ApiModelProperty(value = "图片标识")
    private String icon;
}
