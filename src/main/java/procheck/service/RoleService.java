package procheck.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import procheck.dao.RoleRepository;
import procheck.model.Role;

@Service
@Transactional
public class RoleService  {
	
	@Autowired
	private RoleRepository roleRepository;
	
	public List<Role> findAll(){
		return roleRepository.findAll();
	}
	
	public Role findById(int id){
		return roleRepository.findById(id);
	}
	
	public void save(Role role){
		roleRepository.save(role);
	}
	
	public void deleteById(int id){
		roleRepository.deleteById(id);
	}

	public Role findByName(String name){
		return roleRepository.findByName(name);
	}
	
	
}
