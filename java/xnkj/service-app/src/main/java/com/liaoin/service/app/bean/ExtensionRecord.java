package com.liaoin.service.app.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 推广记录
 */
@Entity
@Table(name = "t_extension_record")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExtensionRecord {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "推广人")
    @OneToOne(targetEntity = User.class)
    private User user;

    @ApiModelProperty(value = "被推广人")
    @OneToOne(targetEntity = User.class)
    private User recommendUser;

    @ApiModelProperty(value = "推广时间")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date addTime;

    @ApiModelProperty(value = "级别")
    @Transient
    private int index;

    @ApiModelProperty(value = "下一级别")
    @Transient
    private List<ExtensionRecord> extensionRecords;
}
