package com.liaoin.service.app.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.liaoin.service.app.Enum.AuthenticationStatus;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

/**
 * 用户认证
 */
@Entity
@Table(name = "t_authentication")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Authentication {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "认证用户")
    @OneToOne(targetEntity = User.class)
    private User user;

    @ApiModelProperty(value = "身份证正面")
    private String positive;

    @ApiModelProperty(value = "身份证反面")
    private String opposite;

    @ApiModelProperty(value = "认证状态")
    private AuthenticationStatus authenticationStatus;

    @ApiModelProperty(value = "认证时间")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date addTime;

    @ApiModelProperty(value = "身份证号")
    private String idCardNumber;

    @ApiModelProperty(value = "姓名")
    private String username;
}
