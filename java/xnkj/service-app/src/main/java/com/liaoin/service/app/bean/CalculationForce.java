package com.liaoin.service.app.bean;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "t_calculation_force")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CalculationForce {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "用户")
    @OneToOne(targetEntity = User.class)
    private User user;

    @ApiModelProperty(value = "金额")
    private float money;

}
