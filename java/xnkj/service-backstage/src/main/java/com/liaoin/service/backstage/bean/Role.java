package com.liaoin.service.backstage.bean;

import com.liaoin.service.backstage.Enum.CheckStatus;
import com.liaoin.service.backstage.Enum.RoleStatus;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 用户权限角色表
 */
@Entity
@Table(name = "t_role")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE,generator = "uuid")
    @GenericGenerator(name="uuid",strategy = "uuid")
    private String id;

    @ApiModelProperty(value = "角色名称")
    private String name;

    @ApiModelProperty(value = "角色状态")
    private RoleStatus roleStatus;

    @ApiModelProperty(value = "介绍")
    private String introduce;

    @ApiModelProperty(value = "选中状态")
    @Transient
    private CheckStatus checkStatus;
}
