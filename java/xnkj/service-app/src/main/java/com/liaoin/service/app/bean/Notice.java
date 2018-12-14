package com.liaoin.service.app.bean;

/**
 * Notice
 *
 * @author cqwu729
 * @date 2018/11/11 18:13
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

/**
 * 公告信息
 */
@Entity
@Table(name = "t_notice")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Notice {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "栏目")
    @OneToOne(targetEntity = Column.class)
    private Column column;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "添加时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date addTime;

    @ApiModelProperty(value = "图片")
    private String picture;

    @ApiModelProperty(value = "详情")
    private String content;

    @ApiModelProperty(value = "阅读量")
    private int count;

}
