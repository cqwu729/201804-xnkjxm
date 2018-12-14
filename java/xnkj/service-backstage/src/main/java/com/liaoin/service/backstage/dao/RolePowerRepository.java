package com.liaoin.service.backstage.dao;

import com.liaoin.service.backstage.bean.RolePower;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RolePowerRepository extends JpaRepository<RolePower,String> {

    void deleteByRoleId(String roleId);

    List<RolePower> findByMenuIdAndRoleId(String menuId, String roleId);

    @Query(value = "SELECT menu_id from t_role_power WHERE role_id in ?1",nativeQuery = true)
    List<String> findPowerIdsByRoleId(List<String> roleIds);
}
