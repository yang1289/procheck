package procheck.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import procheck.model.Role;

import java.util.Set;

public interface RoleRepository extends JpaRepository<Role, Integer>{
    public Role findByName(String name);

    public Role findById(int id);

}
