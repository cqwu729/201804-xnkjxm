package com.liaoin.service.backstage.service.impl;

import com.liaoin.service.backstage.Enum.CheckStatus;
import com.liaoin.service.backstage.Enum.RoleStatus;
import com.liaoin.service.backstage.bean.AdminRole;
import com.liaoin.service.backstage.bean.Role;
import com.liaoin.service.backstage.bean.RolePower;
import com.liaoin.service.backstage.dao.AdminRoleRepository;
import com.liaoin.service.backstage.dao.MenuRepository;
import com.liaoin.service.backstage.dao.RolePowerRepository;
import com.liaoin.service.backstage.dao.RoleRepository;
import com.liaoin.service.backstage.service.RoleService;
import com.liaoin.service.base.Enum.Result;
import com.liaoin.service.base.message.OperateResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;


@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RolePowerRepository rolePowerRepository;

    @Autowired
    private MenuRepository menuRepository;

    @Autowired
    private AdminRoleRepository adminRoleRepository;
    /**
     * 获取全部角色
     */
    @Override
    public List<Role> findAllRoleLists(){
        List<Role> roles = roleRepository.findAll();
        return roles;
    }
    @Override
    public List<Role> findAllRoleLists(String adminId){
        List<Role> roles = roleRepository.findAll();
        for (Role role : roles){
            AdminRole adminRole = adminRoleRepository.findByAdminIdAndRoleId(adminId,role.getId());
            if(adminRole != null){
                role.setCheckStatus(CheckStatus.CHECK);
            }else{
                role.setCheckStatus(CheckStatus.UN_CHECK);
            }
        }
        return roles;
    }

    /**
     * 保存角色信息
     */
    @Override
    public OperateResult save(String id, String name, RoleStatus roleStatus, String introduce){
        if(StringUtils.isNotEmpty(id)){
            //编辑角色信息
            if(roleRepository.existsById(id)){
                Role role = roleRepository.findByNameAndIdNot(name,id);
                if(role == null){
                    roleRepository.save(
                            Role.builder()
                                    .id(id)
                                    .name(name)
                                    .roleStatus(roleStatus)
                                    .introduce(introduce)
                                    .build()
                    );
                    return success();
                }else{
                    return fail(Result.HAVE_DATA);
                }
            }else{
                return fail(Result.HAVE_NOT_DATA);
            }
        }else{
            Role role = roleRepository.findByName(name); //查询此角色是否存在
            if(role == null){
                roleRepository.save(
                        Role.builder()
                                .name(name)
                                .roleStatus(roleStatus)
                                .introduce(introduce)
                                .build()
                );
                return success();
            }else{
                return fail(Result.HAVE_DATA);
            }
        }
    }

    /**
     * 通过id查询角色信息
     */
    @Override
    public Role findById(String id){
        if(!roleRepository.existsById(id)){
            return null;
        }else{
            return roleRepository.findById(id).get();
        }
    }

    /**
     * 删除角色信息
     */
    @Override
    public OperateResult deleteById(String id){
        if(!roleRepository.existsById(id)){
            return fail(Result.HAVE_NOT_DATA);
        }else {
            //角色删除同时删除相应权限信息
            rolePowerRepository.deleteByRoleId(id);
            //删除用户角色信息
            adminRoleRepository.deleteByRoleId(id);
            roleRepository.deleteById(id);
            return success();
        }
    }

    /**
     * 设置角色权限
     */
    @Override
    public OperateResult setRolePowers(String roleId,String[] powerIds){
        if(!roleRepository.existsById(roleId)){
            return fail(Result.HAVE_NOT_DATA);
        }else {
            //删除此角色以前旧的权限
            rolePowerRepository.deleteByRoleId(roleId);
            for (String powerId : powerIds){
                if(menuRepository.existsById(powerId)){
                    rolePowerRepository.save(
                            RolePower.builder()
                                    .roleId(roleId)
                                    .menuId(powerId)
                                    .build()
                    );
                }
            }
            return success();
        }
    }

    @Override
    public Page<Role> queryWithPage(int page, int size){
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<Role> educations = roleRepository.findAll(pageRequest);
        return educations;
    }

    @Override
    public List<AdminRole> findByAdminId(String adminId) {
        return adminRoleRepository.findByAdminId(adminId);
    }

    @Override
    public List<String> queryRoleList(List<String> roleIds) {
        return rolePowerRepository.findPowerIdsByRoleId(roleIds);
    }
}
