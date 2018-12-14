package com.liaoin.service.app.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.liaoin.service.app.Enum.UserStatus;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * app用户信息
 */
@Entity
@Table(name = "t_user")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("用户信息表")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE,generator = "uuid")
    @GenericGenerator(name="uuid",strategy = "uuid")
    @ApiModelProperty(value = "用户ID")
    private String id;

    @ApiModelProperty(value = "手机号")
    private String phone;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "随机串")
    private int random;

    @ApiModelProperty(value = "token")
    private String token;

    @ApiModelProperty(value = "我的推荐码")
    private Integer recommendCode;

    @ApiModelProperty(value = "别人的推荐码")
    private int code;

    @ApiModelProperty(value = "注册时间")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date registerTime;

    @ApiModelProperty(value = "用户余额")
    private float balance;

    @ApiModelProperty(value = "用户矿机 ")
    @OneToOne(targetEntity = Miner.class)
    private Miner miner;

    @ApiModelProperty(value = "身份证号")
    private String idCardNumber;

    @ApiModelProperty(value = "姓名")
    private String username;

    @ApiModelProperty(value = "总收益")
    private float totalIncome;

    @ApiModelProperty(value = "昨日收益")
    private float yesterdayIncome;

    @ApiModelProperty(value = "今日收益")
    private float todayIncome;

    @ApiModelProperty(value = "头像")
    private String picture;

    @ApiModelProperty(value = "日收益")
    private float profit;

    @ApiModelProperty(value = "认证信息")
    @Transient
    private Authentication authentication;

    @ApiModelProperty(value = "团队总算力")
    private float totalCalculationForce;

    @ApiModelProperty(value = "隐藏")
    private int hide;

    @ApiModelProperty(value = "用户状态")
    private UserStatus roleStatus;

}
