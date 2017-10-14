package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import procheck.model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{
    public Role findByName(String name);
}
