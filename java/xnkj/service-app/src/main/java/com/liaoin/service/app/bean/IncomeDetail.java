package com.liaoin.service.app.bean;

/**
 * IncomeDetail
 *
 * @author cqwu729
 * @date 2018/11/13 20:31
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
 * 收支明细
 */
@Entity
@Table(name = "t_income_detail")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class IncomeDetail {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "用户")
    @OneToOne(targetEntity = User.class)
    private User user;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "用户余额")
    private float balance;

    @ApiModelProperty(value = "时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date date;

    @ApiModelProperty(value = "收支金额")
    private float money;
}
