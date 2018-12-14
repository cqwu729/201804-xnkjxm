package com.liaoin.service.app.bean;

/**
 * Notice
 *
 * @author cqwu729
 * @date 2018/11/11 18:13
 */

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 资讯
 */
@Entity
@Table(name = "t_column")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Column {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "栏目名称")
    private String name;
}
