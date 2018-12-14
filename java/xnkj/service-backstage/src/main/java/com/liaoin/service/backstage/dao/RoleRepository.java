package com.liaoin.service.backstage.dao;

import com.liaoin.service.backstage.bean.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role,String> {

    Role findByName(String name);

    Role findByNameAndIdNot(String name, String id);
}
