package procheck.dao;

import java.util.List;

import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import procheck.model.Permission;

@Repository
public interface PermissionDao extends JpaRepository<Permission, Integer> {
	
	
	List<Permission> findByPidGreaterThan(int pid);
	
	List<Permission> findByPid(int pid);
	
	
	
	
}
